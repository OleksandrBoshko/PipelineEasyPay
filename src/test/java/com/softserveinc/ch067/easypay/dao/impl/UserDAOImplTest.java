package com.softserveinc.ch067.easypay.dao.impl;

import com.softserveinc.ch067.easypay.config.DatabaseConfigTest;
import com.softserveinc.ch067.easypay.dao.IUserDAO;
import com.softserveinc.ch067.easypay.dao.impl.dataprovider.UserTestDataProvider;
import com.softserveinc.ch067.easypay.model.Role;
import com.softserveinc.ch067.easypay.model.User;
import junitparams.JUnitParamsRunner;
import junitparams.Parameters;
import org.hamcrest.Matchers;
import org.junit.ClassRule;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlGroup;
import org.springframework.test.context.junit4.rules.SpringClassRule;
import org.springframework.test.context.junit4.rules.SpringMethodRule;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;

import static junit.framework.TestCase.*;
import static org.springframework.test.context.jdbc.Sql.ExecutionPhase.AFTER_TEST_METHOD;
import static org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD;

@RunWith(JUnitParamsRunner.class)
@ContextConfiguration(classes = {DatabaseConfigTest.class, UserDAOImpl.class})
@SqlGroup({
        @Sql(scripts = "classpath:db/UserDAO.sql", executionPhase = BEFORE_TEST_METHOD),
        @Sql(scripts = "classpath:db/CleanTables.sql", executionPhase = AFTER_TEST_METHOD)
})
public class UserDAOImplTest {

    @ClassRule
    public static final SpringClassRule SCR = new SpringClassRule();

    @Rule
    public final SpringMethodRule springMethodRule = new SpringMethodRule();

    @Autowired
    IUserDAO userDAO;

    @Test
    public void testGetObjects() {
        List<User> users = userDAO.getObjects(0, 1L);
        assertNotNull("The list of users is null", users);
        assertEquals("Size is not equals", 10, users.size());
    }

    
    @Test
    public void testGetPages() {
        Long pageCount = userDAO.getPages();
        assertNotNull("The page count si null", pageCount);
        assertEquals("Size is not equals", new Long(2L), pageCount);
    }

    @Test
    @Parameters(source = UserTestDataProvider.class, method = "provideDataForTestGetByUserEmail")
    public void testGetUserByEmail(String email, User expectedUser){
        assertThat(expectedUser, Matchers.is(userDAO.getUserByEmail(email)));
    }

    @Test
    @Parameters(source = UserTestDataProvider.class, method = "provideDataForTestIsEmailUnique")
    public void testIsEmailUnique(String email, boolean expectedValue){
        assertThat(expectedValue, Matchers.is(userDAO.isEmailUnique(email)));
    }

    @Test
    @Parameters(source = UserTestDataProvider.class, method = "provideDataForTestGetActiveUserByEmail")
    public void testGetActiveUserByEmail(String email, User expectedUser){
        assertThat(expectedUser, Matchers.is(userDAO.getActiveUserByEmail(email)));
    }

    @Test
    @Parameters(source = UserTestDataProvider.class, method = "provideDataForTestGetUserByRole")
    public void testGetUsersByRole(Role role, List<User> expectedUsers){
        assertThat(expectedUsers, Matchers.is(userDAO.getUsersByRole(role)));
    }
}
