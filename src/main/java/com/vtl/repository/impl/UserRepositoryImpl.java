/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.repository.impl;

import com.vtl.pojo.User;
import com.vtl.repository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addUser(User user) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            session.save(user);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
         return false;
    }

    @Override
    public List<User> getUsers(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (!username.isEmpty()) {
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p);
        }

        Query q = session.createQuery(query);
        return q.getResultList();

    }

    @Override
    public List<User> getUsers(int userID) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("id").as(Integer.class), userID);
        query = query.where(p);

        Query q = session.createQuery(query);
        return q.getResultList();

    }

    @Override
    public List<User> getListUserForManage() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From User WHERE userRole <> :usr AND userRole <> :usr1");
        q.setParameter("usr", "ROLE_ADMIN");
        q.setParameter("usr1", "ROLE_COMPANY");
        return (List<User>) q.getResultList();
    }

    @Override
    public void deleteUser(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            User user = this.getUsers(username).get(0);
            if(user.getUserRole().equals("ROLE_COMPANY")){
                user.getCompany().getJobSet().forEach(p -> {
                    p.setIsDeleted(1);
                    session.update(p);
                });
            }
            user.setIsDeleted(1);
            session.update(user);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
