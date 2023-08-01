/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.service;

import com.vtl.pojo.Company;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CompanyService {
    List<Object[]> getListCompany(int page);
    boolean addCompany(Company c);
    Company getDetailCompany(int companyId);
    List<Object[]> getListCompanyByCity(String city);
    List<Object[]> getListCompanyBycityAndCompany(String  company , String city);
    List<Object[]> getListCompanyByCompany(String company);
    long countCompany();
    List<Company> getListCompany();
    List<Company> getListCompanyByCheckAdmin();
    void checkCompany(int companyID);
    List<Company> getListCompanyForManage();
}
