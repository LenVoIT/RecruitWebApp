/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository.impl;

import com.vtl.pojo.Candidate;
import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.CurriculumVitae;
import com.vtl.pojo.Job;
import com.vtl.repository.CandidateRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class CandidateRepositoryImpl implements CandidateRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addCandidate(Candidate c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(c);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Candidate> getCandidate(int userID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Candidate> query = builder.createQuery(Candidate.class);
        Root root = query.from(Candidate.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("userID"), userID);
        query = query.where(p);

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Candidate getCandidateByID(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Candidate.class, i);
    }

    @Override
    public List<Object[]> getListCandidateByCompany(int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rC = q.from(Candidate.class);
        Root rCJ = q.from(CandidateJob.class);
        Root rJ = q.from(Job.class);
        Root rCV = q.from(CurriculumVitae.class);
        q.where(b.equal(rJ.get("companyID"), companyId), b.equal(rJ.get("id"), rCJ.get("jobID")),
                b.equal(rCJ.get("candidateID"), rC.get("id")),
                b.equal(rCJ.get("cvId"), rCV.get("id")),
                b.equal(rJ.get("isChecked"), 1));
        q.multiselect(rC.get("id"), rC.get("fullname"), rC.get("email"),
                rC.get("phone"), rC.get("city"),
                rC.get("avatar"), rCJ.get("appliedDate"),
                rCV.get("cvLink"), rCV.get("id"),
                rJ.get("name"));

        Query query = session.createQuery(q);
        return query.getResultList();

    }

    @Override
    public List<Object[]> getListCandidateByJob(int jobId, int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rC = q.from(Candidate.class);
        Root rCJ = q.from(CandidateJob.class);
        Root rJ = q.from(Job.class);
        Root rCV = q.from(CurriculumVitae.class);
        q.where(b.equal(rJ.get("id"), jobId), b.equal(rJ.get("companyID"), companyId), b.equal(rJ.get("id"), rCJ.get("jobID")),
                b.equal(rCJ.get("candidateID"), rC.get("id")),
                b.equal(rCJ.get("cvId"), rCV.get("id")),
                b.equal(rJ.get("isChecked"), 1));
        q.multiselect(rC.get("id"), rC.get("fullname"), rC.get("email"),
                rC.get("phone"), rC.get("city"),
                rC.get("avatar"), rCJ.get("appliedDate"),
                rCV.get("cvLink"), rCV.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Candidate[]> getListCandidate() {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Candidate[]> q = b.createQuery(Candidate[].class);
        Root rC = q.from(Candidate.class);

        q.select(rC);
        q.groupBy(rC.get("id"));
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Candidate[]> getListCandidateByCityMajorDegree(String city, String major, String degree) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Candidate[]> q = b.createQuery(Candidate[].class);
        Root rC = q.from(Candidate.class);
        if("all".equals(city) && "all".equals(major)){
            q.where(
                
                b.equal(rC.get("degree"), degree));
        }
        if(!"all".equals(city) && "all".equals(major)){
            q.where(
                b.like(rC.get("city"), city),
                b.equal(rC.get("degree"), degree));
        }
        if("all".equals(city) && !"all".equals(major)){
            q.where(
                b.like(rC.get("major"), major),
                b.equal(rC.get("degree"), degree));
        }
        if(!"all".equals(city) && !"all".equals(major)){
            q.where(
                b.like(rC.get("city"), city),
                b.like(rC.get("major"), major),
                b.equal(rC.get("degree"), degree));
        }
        
        q.select(rC);
        q.groupBy(rC.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean updateCandidate(Candidate c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Candidate c1 = this.getCandidateByID(c.getId());
            c1.setCity(c.getCity());
            c1.setDateOfBirth(c.getDateOfBirth());
            c1.setPhone(c.getPhone());
//            c1.setAvatar(c.getAvatar());
            c1.setFullname(c.getFullname());
            c1.setSex(c.getSex());
            c1.setDegree(c.getDegree());
            c1.setMajor(c.getMajor());
            session.update(c1);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
