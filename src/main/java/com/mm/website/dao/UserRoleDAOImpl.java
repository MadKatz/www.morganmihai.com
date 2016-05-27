/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mm.website.dao;

import com.mm.website.model.UserRole;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Morgan
 */
@Repository
public class UserRoleDAOImpl implements UserRoleDAO {

    private static final Logger logger = LoggerFactory.getLogger(UserRoleDAOImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    @Override
    public void addUserRole(UserRole userRole) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(userRole);
        logger.info("UserRole saved successfully, userRole Details=%s", userRole);
    }

    @Override
    public void updateUserRole(UserRole userRole) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(userRole);
        logger.info("UserRole updated successfully, userRole Details=%s", userRole);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<UserRole> listUserRoles() {
        Session session = this.sessionFactory.getCurrentSession();
        List<UserRole> userRoles = session.createQuery("from user_roles").list();
        for (UserRole userRole : userRoles) {
            logger.info("UserRole List::%s", userRole);
        }
        return userRoles;
    }

    @Override
    public UserRole getUserRoleById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        UserRole userRole = (UserRole) session.load(UserRole.class, new Integer(id));
        logger.info("UserRole loaded successfully, userRole details=%s", userRole);
        return userRole;
    }

    @Override
    public void removeUserRole(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        UserRole userRole = (UserRole) session.load(UserRole.class, new Integer(id));
        if (null != userRole) {
            session.delete(userRole);
        }
        logger.info("UserRole deleted successfully, userRole details=%s", userRole);
    }
}
