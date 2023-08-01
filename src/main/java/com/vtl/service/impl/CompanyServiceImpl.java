/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vtl.pojo.Company;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vtl.repository.CompanyRepository;
import com.vtl.service.CompanyService;
import java.io.IOException;
import java.util.Map;

/**
 *
 * @author Admin
 */
@Service
public class CompanyServiceImpl implements CompanyService{
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private Cloudinary cloudinary;
    @Override
    public List<Object[]> getListCompany(int page) {
        return this.companyRepository.getListCompany(page);
    }

    @Override
    public boolean addCompany(Company c) {
        try {
            Map r = this.cloudinary.uploader().upload(c.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            c.setAvatar((String)r.get("secure_url"));
            return this.companyRepository.addCompany(c);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
       return false;
    }


     @Override
    public Company getDetailCompany(int companyId) {
        return this.companyRepository.getDetailCompany(companyId);
    }


    @Override
    public List<Object[]> getListCompanyByCity(String string) {
        return this.companyRepository.getListCompanyByCity(string);
    }

    @Override
    public List<Object[]> getListCompanyBycityAndCompany(String company, String city) {
        return this.companyRepository.getListCompanyBycityAndCompany(company, city);
    }

    @Override
    public long countCompany() {
        return this.companyRepository.countCompany();
    }

    @Override
    public List<Object[]> getListCompanyByCompany(String string) {
        return this.companyRepository.getListCompanyByCompany(string);
    }
    @Override
    public List<Company> getListCompany() {
        return this.companyRepository.getListCompany();
    }

    @Override
    public List<Company> getListCompanyByCheckAdmin() {
        return this.companyRepository.getListCompanyByCheckAdmin();
    }

    @Override
    public void checkCompany(int companyID) {
        this.companyRepository.checkCompany(companyID);
    }
    @Override
    public List<Company> getListCompanyForManage() {
         return this.companyRepository.getListCompanyForManage();
    }
}
