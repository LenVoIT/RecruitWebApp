/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.formatters;

import com.vtl.pojo.Candidate;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Admin
 */
public class CandidateFormatter implements Formatter<Candidate>{

    @Override
    public String print(Candidate t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Candidate parse(String ID, Locale locale) throws ParseException {
        Candidate u = new Candidate();
        u.setId(Integer.parseInt(ID));
        
        return u;
    }
    
    
}

