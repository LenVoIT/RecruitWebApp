/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository.impl;

import com.vtl.pojo.JobMajor;
import com.vtl.pojo.Major;
import com.vtl.repository.MajorRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class MajorRepositoryImpl implements MajorRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Major> getListMajor() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Major> query = builder.createQuery(Major.class);
        Root root = query.from(Major.class);
        query = query.select(root);

        Query q = session.createQuery(query);
        return q.getResultList();
    }
    @Override
    public List<Object[]> getnameOfMajorByJob(int jobId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rM = q.from(Major.class);
        Root rJM = q.from(JobMajor.class);
        
        q.where(b.equal(rJM.get("jobID"), jobId),b.equal(rJM.get("majorID"), rM.get("id")));

        q.multiselect(rJM.get("id"),rM.get("name"));
        q.groupBy(rJM.get("id"));
        Query query = s.createQuery(q);
        return   query.getResultList();
    }


    @Override
    public Major getnameOfMajor(int i) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query query = s.createQuery("From Major where id =: majorid");
        query.setParameter("majorid", i);
        return (Major) query.getSingleResult();
    }
}
