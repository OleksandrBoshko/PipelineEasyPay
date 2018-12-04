package com.softserveinc.ch067.easypay.dao.impl.dataprovider;

import com.softserveinc.ch067.easypay.model.Address;
import com.softserveinc.ch067.easypay.model.Role;
import com.softserveinc.ch067.easypay.model.User;
import com.softserveinc.ch067.easypay.model.UserStatus;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

public class UserTestDataProvider {

    private static User getUser1(){
        User user = new User("Mariya", "Chuikina", "", "user1@gmail.com",
                "$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS", Role.USER, new HashSet<Address>(),
                LocalDate.of(2018, Month.SEPTEMBER, 4), "+380968780876", UserStatus.ACTIVE, null);
        user.setId(101L);
        return user;
    }

    private static User getUser2(){
        User user = new User("Valera", "Dobkin", "", "user2@gmail.com",
                "$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS", Role.USER, new HashSet<Address>(),
                LocalDate.of(2018, Month.SEPTEMBER, 4), "+380968780812", UserStatus.ACTIVE, null);
        user.setId(102L);
        return user;
    }

    private static User getUser3(){
        User user = new User("Pavel", "Chernov", "", "user3@gmail.com",
                "$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS", Role.USER, new HashSet<Address>(),
                LocalDate.of(2018, Month.SEPTEMBER, 4), "+380968780812", UserStatus.ACTIVE, null);
        user.setId(103L);
        return user;
    }

    private static User getUser4(){
        User user = new User("Germiona", "Potter", "", "user4@gmail.com",
                "$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS", Role.USER, new HashSet<Address>(),
                LocalDate.of(2018, Month.SEPTEMBER, 4), "+380968780812", UserStatus.NOT_ACTIVE, null);
        user.setId(104L);
        return user;
    }

    private static List<User> getUsersWithRoleUser(){
        return  Arrays.asList(getUser1(), getUser2(), getUser3(), getUser4());
    }

    public static Object[] provideDataForTestGetByUserEmail(){
        return new Object[]{
                new Object[]{"user1@gmail.com", getUser1()},
                new Object[]{"emailNotFound@gmail.com", null}
        };
    }

    public static Object[] provideDataForTestIsEmailUnique(){
        return new Object[]{
                new Object[]{"user1@gmail.com", false},
                new Object[]{"uniqueEmail@gmail.com", true}
        };
    }

    public static Object[] provideDataForTestGetActiveUserByEmail(){
        return new Object[]{
                new Object[]{"user1@gmail.com", getUser1()},
                new Object[]{"user4@gmail.com", null}
        };
    }

    public static Object[] provideDataForTestGetUserByRole(){
        return new Object[]{
                new Object[]{Role.USER, getUsersWithRoleUser()}
        };
    }
}
