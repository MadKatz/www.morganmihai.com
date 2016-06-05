package com.mm.website.dao;

import com.mm.website.model.UserRole;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class UserRoleDAOImpl implements UserRoleDAO {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserRoleDAOImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    @Override
    public void addUserRole(UserRole userRole) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(userRole);
        LOGGER.info("UserRole saved successfully, userRole Details={}", userRole);
    }

    @Override
    public void updateUserRole(UserRole userRole) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(userRole);
        LOGGER.info("UserRole updated successfully, userRole Details={}", userRole);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<UserRole> listUserRoles() {
        Session session = this.sessionFactory.getCurrentSession();
        List<UserRole> userRoles = session.createQuery("from UserRole").list();
        for (UserRole userRole : userRoles) {
            LOGGER.info("UserRole List::{}", userRole);
        }
        return userRoles;
    }

    @Override
    public UserRole getUserRoleById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        UserRole userRole = (UserRole) session.load(UserRole.class, new Integer(id));
        LOGGER.info("UserRole loaded successfully, userRole details={}", userRole);
        return userRole;
    }

    @Override
    public void removeUserRole(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        UserRole userRole = (UserRole) session.load(UserRole.class, new Integer(id));
        if (null != userRole) {
            session.delete(userRole);
        }
        LOGGER.info("UserRole deleted successfully, userRole details={}", userRole);
    }
}
