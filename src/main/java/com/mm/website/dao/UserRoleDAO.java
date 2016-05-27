/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mm.website.dao;

import com.mm.website.model.UserRole;
import java.util.List;

/**
 *
 * @author Morgan
 */
public interface UserRoleDAO {
  
    public void addUserRole(UserRole user);
    public void updateUserRole(UserRole user);
    public List<UserRole> listUserRoles();
    public UserRole getUserRoleById(int id);
    public void removeUserRole(int id);
}
