package com.mm.website.model;

public class PasswordUpdate {
    private String oldPassword;
    private String newPassword;
    
    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }
    
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    
    public String getOldPassword() {
        return oldPassword;
    }
    
    public String getNewPassword() {
        return newPassword;
    }
}
