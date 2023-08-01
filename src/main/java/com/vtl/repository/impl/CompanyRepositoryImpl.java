/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository.impl;


import com.vtl.pojo.Company;
import com.vtl.pojo.Job;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.vtl.repository.CompanyRepository;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class CompanyRepositoryImpl implements CompanyRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getListCompany(int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rC = q.from(Company.class);
        Root rJ = q.from(Job.class);
        q.where(b.equal(rC.get("id"), rJ.get("companyID"))
                ,b.equal(rC.get("isChecked"), 1));
        q.multiselect(rC.get("name"), rC.get("city"), rC.get("avatar"), b.count(rJ.get("id")), rC.get("id"));
        q.groupBy(rC.get("id"));
        Query query = s.createQuery(q);
        int max = 4;
        query.setMaxResults(max);
        query.setFirstResult((page - 1) * max);
        return query.getResultList();
    }

    @Override
    public boolean addCompany(Company c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(c);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
//    @Override
//    public boolean updateCandidate(Company c) {
//        Session session = this.sessionFactory.getObject().getCurrentSession();
//        try {
//            Company c1 = this.getCandidateByID(c.getId());
//            c1.setCity(c.getCity());
//            c1.setDateOfBirth(c.getDateOfBirth());
//            c1.setPhone(c.getPhone());
////            c1.setAvatar(c.getAvatar());
//            c1.setFullname(c.getFullname());
//            c1.setSex(c.getSex());
//            c1.setDegree(c.getDegree());
//            c1.setMajor(c.getMajor());
//            session.update(c1);
//            return true;
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            return false;
//        }
//    }
    
     @Override
    public Company getDetailCompany(int companyId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Company where id =: comId AND isChecked = : check");
        q.setParameter("comId", companyId);
        q.setParameter("check", 1);
        return (Company) q.getSingleResult();
        
    }

    @Override
    public List<Object[]> getListCompanyByCity(String string) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rC = q.from(Company.class);
        Root rJ = q.from(Job.class);
        q.where(b.equal(rC.get("id"), rJ.get("companyID")), b.like(rC.get("city"), string)
                ,b.equal(rC.get("isChecked"), 1));
        q.multiselect(rC.get("name"), rC.get("city"), rC.get("avatar"), b.count(rJ.get("id")), rC.get("id"));
        q.groupBy(rC.get("id"));
        Query query = s.createQuery(q);
        return query.getResultList();
    }
    //hoang
    @Override
    public List<Company> getListCompany() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Company WHERE isChecked =: check");
        q.setParameter("check", 1);
        return (List<Company>) q.getResultList();
    }

   

    @Override
    public List<Object[]> getListCompanyBycityAndCompany(String company, String city) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rC = q.from(Company.class);
        Root rJ = q.from(Job.class);
        
        q.where(b.equal(rC.get("id"), rJ.get("companyID")), b.like(rC.get("city"), city)
                ,b.like(rC.get("name"), String.format("%%%S%%", company))
                ,b.equal(rC.get("isChecked"), 1));

        q.multiselect(rC.get("name"), rC.get("city"), rC.get("avatar"), b.count(rJ.get("id")), rC.get("id"));
        q.groupBy(rC.get("id"));
        Query query = s.createQuery(q);
        
        
        return query.getResultList();
    }

    @Override
    public long countCompany() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT COUNT(*) From Company WHERE isChecked =: check");
        q.setParameter("check", 1);
        return  (long) q.getSingleResult();
        
    }

    @Override
    public List<Object[]> getListCompanyByCompany(String company) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rC = q.from(Company.class);
        Root rJ = q.from(Job.class);

        q.where(b.equal(rC.get("id"), rJ.get("companyID"))
                ,b.like(rC.get("name"), String.format("%%%S%%", company))
                ,b.equal(rC.get("isChecked"), 1));

        q.multiselect(rC.get("name"), rC.get("city"), rC.get("avatar"), b.count(rJ.get("id")), rC.get("id"));
        q.groupBy(rC.get("id"));
        Query query = s.createQuery(q);
        
        
        return query.getResultList();
    }

    @Override
    public List<Company> getListCompanyByCheckAdmin() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Company WHERE isChecked =: check");
        q.setParameter("check", 0);
        return (List<Company>) q.getResultList();
    }

    @Override
    public void checkCompany(int companyID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Company c = this.getCompany(companyID);
            c.setIsChecked(1);
            session.update(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Company getCompany(int companyId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Company where id =: comId");
        q.setParameter("comId", companyId);
        return (Company) q.getSingleResult();
        }
    @Override
    public List<Company> getListCompanyForManage() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Company");

        return (List<Company>) q.getResultList();
    }
}
