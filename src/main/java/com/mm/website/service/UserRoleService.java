/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mm.website.service;

import com.mm.website.model.UserRole;
import java.util.List;

/**
 *
 * @author Morgan
 */
public interface UserRoleService {

    public void addUserRole(UserRole userRole);

    public void updateUserRole(UserRole userRole);

    public List<UserRole> listUserRoles();

    public UserRole getUserRoleById(int id);

    public void removeUserRole(int id);
}
