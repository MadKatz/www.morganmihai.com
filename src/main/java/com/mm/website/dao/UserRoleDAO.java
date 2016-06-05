package com.mm.website.dao;

import com.mm.website.model.UserRole;
import java.util.List;

public interface UserRoleDAO {
  
    public void addUserRole(UserRole user);
    
    public void updateUserRole(UserRole user);
    
    public List<UserRole> listUserRoles();
    
    public UserRole getUserRoleById(int id);
    
    public void removeUserRole(int id);
}
