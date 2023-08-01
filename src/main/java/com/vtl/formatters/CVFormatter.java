/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.formatters;


import com.vtl.pojo.CurriculumVitae;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Admin
 */
public class CVFormatter implements Formatter<CurriculumVitae>{

    @Override
    public String print(CurriculumVitae t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public CurriculumVitae parse(String ID, Locale locale) throws ParseException {
        CurriculumVitae u = new CurriculumVitae();
        u.setId(Integer.parseInt(ID));
        return u;
    }
    
    
}