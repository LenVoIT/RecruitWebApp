/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtl.service;

import com.vtl.pojo.Candidate;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CandidateService {
    boolean addCandidate(Candidate c);
    boolean updateCandidate(Candidate c);
    List<Candidate> getCandidate(int userID);
    List<Object[]> getListCandidateByCompany(int companyId);
    List<Object[]> getListCandidateByJob(int jobId , int companyId);
    List<Candidate[]> getListCandidate();
    List<Candidate[]> getListCandidateByCityMajorDegree(String city , String nameMajor , String degree);
}
