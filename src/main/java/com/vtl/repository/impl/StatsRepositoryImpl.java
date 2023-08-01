/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository.impl;

import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.Job;
import com.vtl.pojo.JobMajor;
import com.vtl.pojo.Major;
import com.vtl.repository.StatsRepository;
import java.util.Date;
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
public class StatsRepositoryImpl implements StatsRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> getStatsJobApplyOfMajor() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rM = q.from(Major.class);
        Root rJM = q.from(JobMajor.class);
        Root rJ = q.from(Job.class);
        Root rCJ = q.from(CandidateJob.class);

        q.where(b.equal(rJM.get("majorID"), rM.get("id")), b.equal(rJM.get("jobID"), rJ.get("id")),
                 b.equal(rJ.get("id"), rCJ.get("jobID"))
        );

        q.multiselect(rM.get("name"), b.count(rCJ.get("id")));
        q.groupBy(rM.get("id"));

        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }

    @Override
    public List<Object[]> getStatsJobOfMajor() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rM = q.from(Major.class);
        Root rJM = q.from(JobMajor.class);

        q.where(b.equal(rJM.get("majorID"), rM.get("id")));

        q.multiselect(rM.get("name"), b.count(rJM.get("id")));
        q.groupBy(rM.get("id"));

        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }

    @Override
    public List<Object[]> getStatsJobOfMajorByMonthYear(Date dFrom, Date dTo) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rM = q.from(Major.class);
        Root rJM = q.from(JobMajor.class);
        Root rJ = q.from(Job.class);
        Root rCJ = q.from(CandidateJob.class);

        q.where(b.equal(rJM.get("majorID"), rM.get("id")), b.equal(rJM.get("jobID"), rJ.get("id")),
                 b.equal(rJ.get("id"), rCJ.get("jobID"))
        );

        q.multiselect(rM.get("name"), b.count(rCJ.get("id")));

        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }
}
