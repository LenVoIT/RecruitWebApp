/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository.impl;

import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.CurriculumVitae;
import com.vtl.pojo.Job;
import com.vtl.repository.CurriculumVitaeRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class CurriculumVitaeRepositoryImpl implements CurriculumVitaeRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addCV(CurriculumVitae cv) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            cv.setIsDeleted(0);
            session.save(cv);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<CurriculumVitae> getListCvForManage(int candidateID) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Job> q = b.createQuery(Job.class);

        Root rCV = q.from(CurriculumVitae.class);

        q.where(b.equal(rCV.get("candidateID"), candidateID));

        q.select(rCV);

        Query query = s.createQuery(q);
        return (List<CurriculumVitae>) query.getResultList();
    }

    @Override
    public boolean applyCV(CandidateJob c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(c);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public CurriculumVitae getCV(int i) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From CurriculumVitae where id =: cvID");
        q.setParameter("cvID", i);
        return (CurriculumVitae) q.getSingleResult();
    }

    @Override
    public CandidateJob apply(CandidateJob cj) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(cj);
            return cj;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public CandidateJob getApply(int candidateID, int jobID) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rCJ = q.from(CandidateJob.class);

        q.where(b.equal(rCJ.get("candidateID"), candidateID), b.equal(rCJ.get("jobID"), jobID));
        q.select(rCJ);
        Query query = s.createQuery(q);
        if (query.getResultList().isEmpty()) {
            return null;
        }
        return (CandidateJob) query.getResultList().get(0);
    }

//    @Override
//    public boolean updateCV(CurriculumVitae cv) {
//        Session session = this.sessionFactory.getObject().getCurrentSession();
//        try {
//            session.save(cv);
//            return true;
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            return false;
//        }
//    }
//    
    @Override
    public void deleteCV(int cvID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            CurriculumVitae c = this.getCV(cvID);
            c.setIsDeleted(1);
            session.update(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
