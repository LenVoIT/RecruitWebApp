/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.service.impl;

import com.vtl.pojo.Candidate;
import com.vtl.pojo.Comment;
import com.vtl.pojo.Company;
import com.vtl.repository.CandidateRepository;
import com.vtl.repository.CommentRepository;
import com.vtl.repository.CompanyRepository;
import com.vtl.service.CommentService;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private CandidateRepository candidateRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Override
    public Comment addComment(String assessment, int companyID, int candidateID, int rating) {
        Company c = this.companyRepository.getDetailCompany(companyID);
        Candidate ca = this.candidateRepository.getCandidateByID(candidateID);
        Comment co = new Comment();
        co.setAssessment(assessment);
        co.setCandidateID(ca);
        co.setCompanyID(c);
        co.setRating(rating);
        DateTimeFormatter format1 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime ldt = LocalDateTime.now();
        String s = ldt.format(format1);
        Date d = new Date(s);
        co.setCreatedDate(d);
        return this.commentRepository.addComment(co);
    }
    
}
