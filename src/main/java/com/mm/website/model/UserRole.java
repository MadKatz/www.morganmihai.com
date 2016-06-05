package com.mm.website.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_roles")
public class UserRole implements Serializable {

    @Id
    @Column(name="userid")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int userRoleId;
    private int userId;
    private String role;
    
    public int getUserRoleId() {
        return userRoleId;
    }
  
    public int getUserId() {
        return userId;
    }
    
    public String getRole() {
        return role;
    }
    
    public void setUserRoleId(int userRoleId) {
      this.userRoleId = userRoleId;
    }
    
    public void setUserId(int userId) {
      this.userId = userId;
    }
    
    public void setRole(String role) {
      this.role = role;
    }
    @Override
    public String toString() {
        return String.format("userRoleId=%d, userId=%d, role=%s",
                userRoleId, userId, role);
    }
}
