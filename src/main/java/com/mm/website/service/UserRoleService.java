package com.mm.website.service;

import com.mm.website.model.UserRole;
import java.util.List;

public interface UserRoleService {

    public void addUserRole(UserRole userRole);

    public void updateUserRole(UserRole userRole);

    public List<UserRole> listUserRoles();

    public UserRole getUserRoleById(int id);

    public void removeUserRole(int id);
}
