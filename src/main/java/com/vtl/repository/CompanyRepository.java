/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository;

import com.vtl.pojo.CandidateCompany;
import com.vtl.pojo.Company;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CompanyRepository {
    List<Object[]> getListCompany(int page);
    boolean addCompany(Company c);
    Company getDetailCompany(int companyId);
    Company getCompany(int companyId);
    List<Object[]> getListCompanyByCity(String city);
    List<Company> getListCompany();
    List<Company> getListCompanyByCheckAdmin();
    List<Object[]> getListCompanyBycityAndCompany(String  company , String city);
    List<Object[]> getListCompanyByCompany(String company);
    long countCompany();
    void checkCompany(int companyID);
    List<Company> getListCompanyForManage();
    
}
