package com.mm.website.dao;

import java.util.List;

import com.mm.website.model.User;

public interface UserDAO {

    public void addUser(User user);

    public void updateUser(User user);

    public List<User> listUsers();

    public User getUserById(int id);
    
    public User getUserByEmail(String email);
    
    public User getUserByUsername(String username);

    public void removeUser(int id);
}
