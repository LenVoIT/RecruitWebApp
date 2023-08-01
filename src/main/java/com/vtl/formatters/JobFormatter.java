/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.formatters;

import com.vtl.pojo.Job;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Admin
 */
public class JobFormatter implements Formatter<Job>{
    @Override
    public String print(Job t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Job parse(String string, Locale locale) throws ParseException {
       Job u = new Job();
        u.setId(Integer.parseInt(string));
        return u;
    }
}
