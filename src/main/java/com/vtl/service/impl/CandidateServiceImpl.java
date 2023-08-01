/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vtl.pojo.Candidate;
import com.vtl.repository.CandidateRepository;
import com.vtl.service.CandidateService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class CandidateServiceImpl implements CandidateService{
    
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private CandidateRepository candidateRepository;
    
    @Override
    public boolean addCandidate(Candidate c) {
        try {
            Map r = this.cloudinary.uploader().upload(c.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            c.setAvatar((String)r.get("secure_url"));
            return this.candidateRepository.addCandidate(c);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
       return false;
    }

    @Override
    public List<Candidate> getCandidate(int userID) {
        return candidateRepository.getCandidate(userID);
    }
    @Override
    public List<Object[]> getListCandidateByCompany(int companyId) {
        return this.candidateRepository.getListCandidateByCompany(companyId);
    }

    @Override
    public List<Object[]> getListCandidateByJob(int i, int i1) {
        return this.candidateRepository.getListCandidateByJob(i, i1);
    }
    @Override
    public List<Candidate[]> getListCandidate() {
        return this.candidateRepository.getListCandidate();
    }

    @Override
    public List<Candidate[]> getListCandidateByCityMajorDegree(String string, String string1, String string2) {
        return this.candidateRepository.getListCandidateByCityMajorDegree(string, string1, string2);
    }

    @Override
    public boolean updateCandidate(Candidate c) {
        return this.candidateRepository.updateCandidate(c);
    }
    
}
