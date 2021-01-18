package com.offcn.service;
import com.offcn.bean.User;
public interface UserService {
    public int addUser(User u);
    public User login(String username,String password);
}
