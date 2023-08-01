/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.validators;

import com.vtl.pojo.User;
import com.vtl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Admin
 */
@Component
public class RegisterValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override 
    public void validate(Object o, Errors errors) {
        User u = (User) o;
        if (checkStrongPassword(u.getPassword()) == false)
            errors.rejectValue("password", "user.password.strongErr");
        if(!u.getPassword().equals(u.getRepassword())){
            errors.rejectValue("repassword", "user.password.notMatch");
        }
    }

    public boolean checkStrongPassword(String s) {

        if (s.length() < 8 || s.length() > 16) {
            return false;
        }
        if (!s.matches("(?=.*[0-9]).*")) {
            return false;
        }
        if (!s.matches("(?=.*[a-z]).*")) {
            return false;
        }
        if (!s.matches("(?=.*[A-Z]).*")) {
            return false;
        }
        if(!s.matches("(?=.*[~!@#$%^&*()_-]).*")) {
            return false;
        }

        return true;
    }

}
