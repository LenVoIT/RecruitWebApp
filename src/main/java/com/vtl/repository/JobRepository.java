/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtl.repository;

import com.vtl.pojo.Job;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface JobRepository {
    boolean addJob(Job j);
    List<Object[]> getListJobBymayor(int mayorID);
    List<Job> getListJobByCompanyId(int companyID);
    List<Object[]> getListJobByrecommend(int jobIdExpect , int mayorID);
    Object[] getDetailJobById(int jobId);
    //list candidate apply
    List<Object[]> getListJobByCompanyId1(int companyId);
    List<Object[]> getListJobByCompanyExpectCurrentJob(int jobID , int companyId);
    Job getNameJob(int jobId);
    Job getJob(int jobId);
    List<Object[]> getListJobByCandidate(int candidate);
    List<Object[]> getListJobByCheckAdmin();
    List<Object[]> getListJobBymayorAndCity(int mayorID , String city,String kw);
    //admin management
    List<Job> getListJobForManageCompany(int company);
    void updateJob(int jobID);
    List<Object[]> getListJobByCityKw(String city  , String kw);
    List<Object[]> getListJobByCityKwPage(String city  , String kw , int page);
    Long countJob();
    void deleteJob(int jobID);
    List<Object[]> getListJobForManage();
   
}
