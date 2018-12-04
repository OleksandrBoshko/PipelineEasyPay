package com.softserveinc.ch067.easypay.controller;

import com.softserveinc.ch067.easypay.controller.swagger.AccountControllerSwagger;
import com.softserveinc.ch067.easypay.dto.*;
import com.softserveinc.ch067.easypay.exception.ConfirmRegistrationJWTInvalidException;
import com.softserveinc.ch067.easypay.exception.PasswordResetJWTInvalidException;
import com.softserveinc.ch067.easypay.model.EmailToken;
import com.softserveinc.ch067.easypay.model.Role;
import com.softserveinc.ch067.easypay.model.User;
import com.softserveinc.ch067.easypay.model.UserStatus;
import com.softserveinc.ch067.easypay.response.AuthorizationResponse;
import com.softserveinc.ch067.easypay.response.MessageResponse;
import com.softserveinc.ch067.easypay.response.VerifyUserResponse;
import com.softserveinc.ch067.easypay.service.*;
import io.jsonwebtoken.JwtException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.Locale;

@RestController
public class AccountController extends AccountControllerSwagger {
    private final MessageSource messageSource;
    private final IMailService mailService;
    private final IUserService userService;
    private final IEmailTokenService emailTokenService;
    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder;
    private final ModelMapper modelMapper;
    private final IJwtTokenService jwtTokenService;

    @Autowired
    public AccountController(@Qualifier(value = "localeMessageSource") MessageSource messageSource, IMailService mailService,
                             IUserService userService, IEmailTokenService emailTokenService, AuthenticationManager authenticationManager,
                             PasswordEncoder passwordEncoder, ModelMapper modelMapper, IJwtTokenService jwtTokenService) {
        this.messageSource = messageSource;
        this.mailService = mailService;
        this.userService = userService;
        this.emailTokenService = emailTokenService;
        this.authenticationManager = authenticationManager;
        this.passwordEncoder = passwordEncoder;
        this.modelMapper = modelMapper;
        this.jwtTokenService = jwtTokenService;
    }

    @PostMapping(value = "/registration", produces = "application/json")
    @ResponseBody
    public ResponseEntity<Object> registration(@Valid @RequestBody UserValidationDTO userValidationDTO, BindingResult result,
                                               HttpServletRequest request, Locale locale) {
        VerifyUserResponse verifyUserResponse = userService.verifyUser(userValidationDTO, result, locale);
        if (!verifyUserResponse.isValid()) {
            return new ResponseEntity<>(verifyUserResponse, HttpStatus.BAD_REQUEST);
        }
        User user = modelMapper.map(userValidationDTO, User.class);
        userService.create(user, Role.USER);
        mailService.sendRegistrationConfirmationToken(emailTokenService.buildToken(user), user.getEmail(),
                userService.generateAppBaseUrl(request), locale);
        return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("successRegistration", null,
                locale)), HttpStatus.CREATED);
    }

    @PostMapping("/authorization")
    public ResponseEntity<Object> login(@RequestBody AuthorizationDto authorizationDto, HttpServletRequest request, Locale locale) {
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                new UsernamePasswordAuthenticationToken(authorizationDto.getEmail(), authorizationDto.getPassword());
        User user = userService.getUserByEmail(authorizationDto.getEmail());
        try {
            Authentication authenticate = authenticationManager.authenticate(usernamePasswordAuthenticationToken);
            SecurityContext securityContext = SecurityContextHolder.getContext();
            securityContext.setAuthentication(authenticate);
            HttpSession session = request.getSession(true);
            session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, securityContext);
            userService.setLastLoginToUserWithEmail(authorizationDto.getEmail());
        } catch (BadCredentialsException e) {
            return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("incorrectLoginInfo", null, locale)),
                    HttpStatus.FORBIDDEN);
        } catch (DisabledException e) {
            return new ResponseEntity<>(userService.determineUserStatus(user, locale), HttpStatus.UNAUTHORIZED);
        }
        return new ResponseEntity<>(new AuthorizationResponse(UserStatus.ACTIVE), HttpStatus.OK);
    }

    @GetMapping("/confirmRegistration")
    public RedirectView confirmRegistration(@RequestParam("token") String token, Locale locale) {
        String email;
        if (emailTokenService.getByToken(token) == null) {
            throw new ConfirmRegistrationJWTInvalidException(messageSource.getMessage("invalidToken", null, locale));
        }
        try {
            email = jwtTokenService.parseEmailTokenAndGetEmail(token);
        } catch (JwtException e) {
            throw new ConfirmRegistrationJWTInvalidException(e.getMessage());
        }
        userService.setStatusActive(email);
        emailTokenService.delete(emailTokenService.getByToken(token));
        return new RedirectView("/loginPage?registrationSuccess");
    }

    @PostMapping("/reactivationToken")
    public ResponseEntity<Object> sendMessage(@RequestBody AuthorizationDto authorizationDto, HttpServletRequest request,
                                              Locale locale) {
        User user = userService.getUserByEmail(authorizationDto.getEmail());
        if (user == null) {
            return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("disabledUser", null, locale)),
                    HttpStatus.BAD_REQUEST);
        }
        EmailToken emailToken = emailTokenService.getByUserId(user.getId());
        if (emailToken != null) {
            emailTokenService.delete(emailToken);
        }
        EmailToken newEmailToken = new EmailToken();
        newEmailToken.setUser(user);
        newEmailToken.setToken(jwtTokenService.generateAndGetEmailToken(authorizationDto.getEmail()));
        emailTokenService.create(newEmailToken);
        if (user.getUserStatus().equals(UserStatus.REGISTERED_BY_ADMIN)) {
            User userFromDB = userService.getUserByEmail(authorizationDto.getEmail());
            userFromDB.setPassword(userService.generatePassword());
            mailService.sendPasswordAndLogin(newEmailToken, userFromDB.getEmail(), userFromDB.getPassword(), userService.generateAppBaseUrl(request), locale);
            userFromDB.setPassword(userService.encodePassword(userFromDB.getPassword()));
            userService.update(userFromDB);
        } else {
            mailService.sendRegistrationConfirmationToken(newEmailToken, authorizationDto.getEmail(), userService.generateAppBaseUrl(request), locale);
        }
        return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("successEmailSend", null, locale)),
                HttpStatus.OK);
    }

    @PostMapping("/forgotPassword")
    public ResponseEntity<Object> sendForgotPasswordToken(@RequestParam String email, HttpServletRequest request, Locale locale) {
        User user = userService.getActiveUserByEmail(email);
        if (user == null) {
            return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("disabledUser", null, locale)),
                    HttpStatus.BAD_REQUEST);
        }
        EmailToken emailToken = emailTokenService.getByUserId(user.getId());
        if (emailToken != null) {
            emailTokenService.delete(emailToken);
        }
        EmailToken newEmailToken = new EmailToken();
        newEmailToken.setUser(user);
        newEmailToken.setToken(jwtTokenService.generateAndGetEmailToken(email));
        emailTokenService.create(newEmailToken);
        mailService.sendPasswordResetTokenMessageToEmail(newEmailToken, email, userService.generateAppBaseUrl(request),
                locale);
        return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("successEmailSend", null, locale)),
                HttpStatus.OK);
    }

    @GetMapping("/resetPassword")
    public RedirectView resetPassword(@RequestParam("token") String token, Locale locale) {
        String email;
        if (emailTokenService.getByToken(token) == null) {
            throw new PasswordResetJWTInvalidException(messageSource.getMessage("invalidToken", null, locale));
        }
        try {
            email = jwtTokenService.parseEmailTokenAndGetEmail(token);
        } catch (JwtException e) {
            throw new PasswordResetJWTInvalidException(e.getMessage());
        }
        User user = userService.getUserByEmail(email);
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, Arrays.asList(
                new SimpleGrantedAuthority(Role.CHANGE_PASSWORD.toString())));
        SecurityContextHolder.getContext().setAuthentication(auth);
        emailTokenService.delete(emailTokenService.getByToken(token));
        return new RedirectView("/resetPasswordPage");
    }

    @PostMapping("/changePassword")
    public ResponseEntity<Object> changePassword(@RequestBody PasswordResetDto passwordResetDto, @AuthenticationPrincipal User user,
                                                 HttpServletRequest request, Locale locale) {
        String password = passwordResetDto.getPassword();
        String passwordConfirm = passwordResetDto.getConfirmPassword();
        if (password.equals(passwordConfirm)) {
            if (!userService.isPasswordValid(password)) {
                return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("badPassword", null, locale)),
                        HttpStatus.BAD_REQUEST);
            }
            user.setPassword(passwordEncoder.encode(password));
            userService.update(user);
            request.getSession(false).invalidate();
            return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("updatePasswordSuccess", null, locale)),
                    HttpStatus.OK);
        }
        return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("notConfirmed", null, locale)),
                HttpStatus.BAD_REQUEST);
    }

    @PostMapping(value = "/admin/registration", produces = "application/json")
    public ResponseEntity<Object> registerUser(@Valid @RequestBody RegisterUserDTO userDTO, BindingResult result,
                                               HttpServletRequest request, Locale locale) {
        String password = userService.generatePassword();
        userDTO.setPassword(password);
        VerifyUserResponse verifyUserResponse = userService.verifyUser(userDTO, result, locale);
        if (!verifyUserResponse.isValid()) {
            return new ResponseEntity<>(verifyUserResponse, HttpStatus.BAD_REQUEST);
        }
        User user = modelMapper.map(userDTO, User.class);
        userService.create(user);
        mailService.sendPasswordAndLogin(emailTokenService.buildToken(user), user.getEmail(), password,
                userService.generateAppBaseUrl(request), locale);
        return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("adminAddUser", null, locale)),
                HttpStatus.CREATED);
    }

    @GetMapping(value = "/continue")
    public RedirectView continueRegistration(@RequestParam("token") String token, Locale locale) {
        if (emailTokenService.getByToken(token) == null) {
            throw new ConfirmRegistrationJWTInvalidException(messageSource.getMessage("invalidToken",
                    null, locale));
        }
        return new RedirectView("/continue-registration?token=" + token);
    }

    @PostMapping(value = "/finish-registration")
    public ResponseEntity<Object> finishRegistration(@RequestParam("token") String token,
                                                     @Valid @RequestBody ContinueUserRegistrationDTO userDTO,
                                                     BindingResult result, Locale locale) {
        VerifyUserResponse verifyUserResponse = userService.verifyUser(userDTO, result, locale);
        if (!verifyUserResponse.isValid()) {
            return new ResponseEntity<>(verifyUserResponse, HttpStatus.BAD_REQUEST);
        }
        userService.update(userDTO, jwtTokenService.parseEmailTokenAndGetEmail(token));
        emailTokenService.delete(emailTokenService.getByToken(token));
        return new ResponseEntity<>(new MessageResponse(messageSource.getMessage("createdByAdmin", null, locale)),
                HttpStatus.CREATED);
    }
}