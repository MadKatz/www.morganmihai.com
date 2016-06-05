package com.mm.website.service;

import com.mm.website.dao.UserRoleDAO;
import com.mm.website.model.UserRole;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserRoleServiceImpl implements UserRoleService {
    
    private UserRoleDAO userRoleDAO;

    public void setUserRoleDAO(UserRoleDAO userRoleDAO) {
        this.userRoleDAO = userRoleDAO;
    }

    @Override
    @Transactional
    public void addUserRole(UserRole userRole) {
        this.userRoleDAO.addUserRole(userRole);
    }

    @Override
    @Transactional
    public void updateUserRole(UserRole userRole) {
        this.userRoleDAO.updateUserRole(userRole);
    }

    @Override
    @Transactional
    public List<UserRole> listUserRoles() {
        return this.userRoleDAO.listUserRoles();
    }

    @Override
    @Transactional
    public UserRole getUserRoleById(int id) {
        return this.userRoleDAO.getUserRoleById(id);
    }

    @Override
    @Transactional
    public void removeUserRole(int id) {
        this.userRoleDAO.removeUserRole(id);
    }
}
