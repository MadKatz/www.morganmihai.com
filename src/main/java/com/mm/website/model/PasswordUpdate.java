/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mm.website.model;

/**
 *
 * @author Morgan
 */
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
