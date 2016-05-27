package com.mm.website.service;

import java.util.List;

import com.mm.website.model.User;

/**
 *
 * @author Morgan
 */
public interface UserService {

    public void addUser(User user);

    public void updateUser(User user);

    public List<User> listUsers();

    public User getUserById(int id);
    
    public User getUserByEmail(String email);
    
    public User getUserByUsername(String username);

    public void removeUser(int id);
}
