/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.formatters;

import com.vtl.pojo.Company;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Admin
 */
public class CompanyFormatter implements Formatter<Company>{

    @Override
    public String print(Company t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Company parse(String ID, Locale locale) throws ParseException {
        Company u = new Company();
        u.setId(Integer.parseInt(ID));
        return u;
    }
    
    
}
