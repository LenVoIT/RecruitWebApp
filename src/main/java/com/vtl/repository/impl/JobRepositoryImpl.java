/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository.impl;

import com.vtl.pojo.CandidateJob;
import com.vtl.pojo.Company;
import com.vtl.pojo.Job;
import com.vtl.pojo.Major;
import com.vtl.pojo.JobMajor;
import com.vtl.repository.JobRepository;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
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
public class JobRepositoryImpl implements JobRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public boolean addJob(Job j) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            j.setIsChecked(0);
            j.setIsDeleted(0);
            session.save(j);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
      @Override
    public List<Object[]> getListJobBymayor(int mayorID) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rJM = q.from(JobMajor.class);
        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        Root rM = q.from(Major.class);
        q.where(b.equal(rJM.get("majorID"), mayorID), b.equal(rJ.get("id"), rJM.get("jobID"))
                , b.equal(rC.get("id"), rJ.get("companyID"))
                , b.equal(rJM.get("majorID"), rM.get("id"))
                ,b.equal(rJ.get("isChecked"), 1));

        q.multiselect(rJ.get("name"), rC.get("name"), rJ.get("city"), rJ.get("salaryTo"),
                rJ.get("salaryFrom"), rJ.get("endDate"), rC.get("avatar"), rJ.get("id"), rM.get("id"), rJ.get("createdDate"));
        q.orderBy(b.desc(rJ.get("id")));
        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Object[] getDetailJobById(int jobId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        q.where(b.equal(rC.get("id"), rJ.get("companyID")), b.equal(rJ.get("id"), jobId));

        q.multiselect(rJ.get("name"), rJ.get("city"), rJ.get("salaryFrom"), rJ.get("salaryTo"), rJ.get("ageFrom"), rJ.get("ageTo"), rJ.get("endDate"), rJ.get("quantity"), rJ.get("probationaryPeriod"),
                 rJ.get("sexRequired"), rJ.get("degreeRequired"),
                 rJ.get("position"), rJ.get("type"),
                 rC.get("name"), rC.get("avatar"),
                 rC.get("address"), rC.get("city"),
                 rJ.get("createdDate"),rJ.get("experienceRequired")
                 ,rJ.get("description"),rJ.get("benefit"),rJ.get("id"));
        
        Query query = s.createQuery(q);
        return (Object[]) query.getSingleResult();
    }

    @Override
    public List<Object[]> getListJobByrecommend(int jobIdExpect, int majorId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rJM = q.from(JobMajor.class);
        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        Root rM = q.from(Major.class);
        q.where(b.equal(rJM.get("majorID"), majorId), b.equal(rJ.get("id"), rJM.get("jobID")),
                 b.equal(rC.get("id"), rJ.get("companyID")), b.equal(rJM.get("majorID"), rM.get("id")),
                 b.notEqual(rJ.get("id"), jobIdExpect)
                 ,b.equal(rJ.get("isChecked"), 1));

        q.multiselect(rJ.get("name"), rC.get("name"), rJ.get("city"), rJ.get("salaryTo"), rJ.get("salaryFrom"), rJ.get("endDate"), rC.get("avatar"), rJ.get("id"), rM.get("id"));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Job> getListJobByCompanyId(int i) {
        Calendar cFrom = Calendar.getInstance();
        cFrom.setTime(new Date());
        /* today */
        cFrom.set(Calendar.HOUR_OF_DAY, 0);
        cFrom.set(Calendar.MINUTE, 0);
        cFrom.set(Calendar.SECOND, 0);
        cFrom.set(Calendar.MILLISECOND, 0);
        Timestamp from = new Timestamp(cFrom.getTime().getTime());
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Job> q = b.createQuery(Job.class);

        Root rJ = q.from(Job.class);
        
        q.where(b.equal(rJ.get("companyID"), i),b.greaterThan(rJ.get("endDate"), from)
                ,b.equal(rJ.get("isChecked"), 1));

        q.select(rJ);

        Query query = s.createQuery(q);
        return (List<Job>) query.getResultList();

    }

    @Override
    public List<Object[]> getListJobByCompanyId1(int i) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        
        q.where(b.equal(rC.get("id"), i) , b.equal(rC.get("id"), rJ.get("companyID"))
                ,b.equal(rJ.get("isChecked"), 1));

        q.multiselect(rJ.get("id") , rJ.get("name") , rC.get("id"));

        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }

    @Override
    public List<Object[]> getListJobByCompanyExpectCurrentJob(int jobID, int companyId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        q.where(b.equal(rC.get("id"), companyId),b.equal(rC.get("id"), rJ.get("companyID"))
                , b.notEqual(rJ.get("id"), jobID)
                ,b.equal(rJ.get("isChecked"), 1));

        q.multiselect(rJ.get("id") , rJ.get("name") , rC.get("id"));

        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }

    @Override
    public Job getNameJob(int i) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Job where id =: jobID");
        q.setParameter("jobID", i);
        return (Job) q.getSingleResult();
    }

    @Override
    public List<Object[]> getListJobByCandidate(int i) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        
        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        Root rCJ = q.from(CandidateJob.class);
        q.where(b.equal(rCJ.get("candidateID"), i),b.equal(rCJ.get("jobID"), rJ.get("id")),
                b.equal(rJ.get("companyID"), rC.get("id"))
                ,b.equal(rJ.get("isChecked"), 1));

        q.multiselect(rJ.get("id") , rJ.get("name") , rC.get("name"),rC.get("avatar"),rJ.get("salaryFrom"),
                rJ.get("salaryTo"), rJ.get("city"),rCJ.get("appliedDate"));

        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }

    @Override
    public List<Object[]> getListJobByCheckAdmin() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        
        q.where(b.equal(rC.get("id"), rJ.get("companyID")), b.equal(rJ.get("isChecked"), 0));

        q.multiselect(rJ.get("id") , rJ.get("name")
                , rJ.get("salaryFrom") , rJ.get("salaryTo")
                , rJ.get("city")  , rJ.get("createdDate"), rJ.get("endDate") 
                , rC.get("avatar") , rC.get("name"));

        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }
    @Override
    public List<Object[]> getListJobBymayorAndCity(int mayorID, String city , String kw) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rJM = q.from(JobMajor.class);
        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        Root rM = q.from(Major.class);
        if("all".equals(city) && "null".equals(kw)){
            q.where(b.equal(rJM.get("majorID"), mayorID), b.equal(rJ.get("id"), rJM.get("jobID"))
                , b.equal(rC.get("id"), rJ.get("companyID"))
                , b.equal(rJM.get("majorID"), rM.get("id"))
                ,b.equal(rJ.get("isChecked"), 1));
            
        }
        if("all".equals(city) && !"null".equals(kw)){
            q.where(b.equal(rJM.get("majorID"), mayorID), b.equal(rJ.get("id"), rJM.get("jobID"))
                , b.equal(rC.get("id"), rJ.get("companyID"))
                , b.equal(rJM.get("majorID"), rM.get("id"))
                ,b.like(rJ.get("name"),String.format("%%%S%%", kw))
                ,b.equal(rJ.get("isChecked"), 1));
        }
        if(!"all".equals(city) && "null".equals(kw)){
             q.where(b.equal(rJM.get("majorID"), mayorID), b.equal(rJ.get("id"), rJM.get("jobID"))
                , b.equal(rC.get("id"), rJ.get("companyID"))
                , b.equal(rJM.get("majorID"), rM.get("id"))
                ,b.equal(rJ.get("city"), city)
                ,b.equal(rJ.get("isChecked"), 1));
        }
        if(!"all".equals(city) && !"null".equals(kw)){
             q.where(b.equal(rJM.get("majorID"), mayorID), b.equal(rJ.get("id"), rJM.get("jobID"))
                , b.equal(rC.get("id"), rJ.get("companyID"))
                , b.equal(rJM.get("majorID"), rM.get("id"))
                ,b.equal(rJ.get("city"), city)
                ,b.like(rJ.get("name"),String.format("%%%S%%", kw))
                ,b.equal(rJ.get("isChecked"), 1));
        }
        

        q.multiselect(rJ.get("name"), rC.get("name"), rJ.get("city"), rJ.get("salaryTo"),
                rJ.get("salaryFrom"), rJ.get("endDate"), rC.get("avatar"), rJ.get("id"), rM.get("id"));
        q.orderBy(b.desc(rJ.get("id")));
        Query query = s.createQuery(q);
        return query.getResultList();
    }
    @Override
    public List<Job> getListJobForManageCompany(int company) {
        
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Job> q = b.createQuery(Job.class);

        Root rJ = q.from(Job.class);
        
        q.where(b.equal(rJ.get("companyID"), company));

        q.select(rJ);

        Query query = s.createQuery(q);
        return (List<Job>) query.getResultList();
    }

    @Override
    public void updateJob(int jobID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Job c = this.getJob(jobID);
            c.setIsChecked(1);
            session.update(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Job getJob(int jobId) {
       Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Job where id =: jobID");
        q.setParameter("jobID", jobId);
        return (Job) q.getSingleResult();
    }

    @Override
    public List<Object[]> getListJobByCityKw(String city, String kw) {
        Calendar cFrom = Calendar.getInstance();
        cFrom.setTime(new Date());
        /* ngày hiện tại */
        cFrom.set(Calendar.HOUR_OF_DAY, 0);
        cFrom.set(Calendar.MINUTE, 0);
        cFrom.set(Calendar.SECOND, 0);
        cFrom.set(Calendar.MILLISECOND, 0);
        Timestamp from = new Timestamp(cFrom.getTime().getTime());
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rJM = q.from(JobMajor.class);
        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        Root rM = q.from(Major.class);
        if ("all".equals(city) && "null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );

        }
        if ("all".equals(city) && !"null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.like(rJ.get("name"), String.format("%%%S%%", kw)),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );
        }
        if (!"all".equals(city) && "null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.like(rJ.get("city"), city),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );
        }
        if (!"all".equals(city) && !"null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.like(rJ.get("city"), city),
                     b.like(rJ.get("name"), String.format("%%%S%%", kw)),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );
        }

        q.multiselect(rJ.get("name"), rC.get("name"), rJ.get("city"), rJ.get("salaryTo"),
                rJ.get("salaryFrom"), rJ.get("endDate"), rC.get("avatar"), rJ.get("id"), rM.get("id"));
        q.groupBy(rJ.get("id"));
        q.orderBy(b.desc(rJ.get("id")));
        Query query = s.createQuery(q);

        return query.getResultList();
    }

    @Override
    public List<Object[]> getListJobByCityKwPage(String city, String kw, int page) {
        Calendar cFrom = Calendar.getInstance();
        cFrom.setTime(new Date());
        /* ngày hiện tại */
        cFrom.set(Calendar.HOUR_OF_DAY, 0);
        cFrom.set(Calendar.MINUTE, 0);
        cFrom.set(Calendar.SECOND, 0);
        cFrom.set(Calendar.MILLISECOND, 0);
        Timestamp from = new Timestamp(cFrom.getTime().getTime());
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rJM = q.from(JobMajor.class);
        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        Root rM = q.from(Major.class);
        if ("all".equals(city) && "null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );

        }
        if ("all".equals(city) && !"null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.like(rJ.get("name"), String.format("%%%S%%", kw)),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );
        }
        if (!"all".equals(city) && "null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.like(rJ.get("city"), city),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );
        }
        if (!"all".equals(city) && !"null".equals(kw)) {
            q.where(b.equal(rJ.get("id"), rJM.get("jobID")),
                     b.equal(rC.get("id"), rJ.get("companyID")),
                     b.equal(rJM.get("majorID"), rM.get("id")),
                     b.like(rJ.get("city"), city),
                     b.like(rJ.get("name"), String.format("%%%S%%", kw)),
                     b.equal(rJ.get("isChecked"), 1),
                     b.equal(rJ.get("isDeleted"), 0)
                    , b.greaterThan(rJ.get("endDate"), from)
                    );
        }

        q.multiselect(rJ.get("name"), rC.get("name"), rJ.get("city"), rJ.get("salaryTo"),
                rJ.get("salaryFrom"), rJ.get("endDate"), rC.get("avatar"), rJ.get("id"), rM.get("id"));
        q.groupBy(rJ.get("id"));
        q.orderBy(b.desc(rJ.get("id")));
        Query query = s.createQuery(q);
        int max = 20;
        query.setMaxResults(max);
        query.setFirstResult((page - 1) * max);
        return query.getResultList();
    }

    @Override
    public Long countJob() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT COUNT(*) From Job Where isChecked =: check AND isDeleted =: deleted");
        q.setParameter("check", 1);
        q.setParameter("deleted", 0);
        return (long) q.getSingleResult();
    }

    @Override
    public void deleteJob(int jobID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            Job c = this.getJob(jobID);
            c.setIsDeleted(1);
            session.update(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<Object[]> getListJobForManage() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        Root rJ = q.from(Job.class);
        Root rC = q.from(Company.class);
        q.where(b.equal(rJ.get("companyID"), rC.get("id")), b.equal(rJ.get("isDeleted"), 0)
                );
        q.multiselect(rJ.get("id"), rC.get("name"), rJ.get("name"),rJ.get("createdDate"));
        Query query = s.createQuery(q);
        return (List<Object[]>) query.getResultList();
    }
}
