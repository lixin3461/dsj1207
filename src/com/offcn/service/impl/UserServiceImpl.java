package com.offcn.service.impl;

import com.offcn.bean.User;
import com.offcn.dao.UserDao;
import com.offcn.dao.impl.UserDaoImpl;
import com.offcn.service.UserService;

public class UserServiceImpl implements UserService {


    UserDao dao = new UserDaoImpl();

    public int addUser(User u) {
        return dao.insertUser(u);
    }

    @Override
    public User login(String username, String password) {
        return dao.findUserByUsernameAndPassword(username,password);
    }
}
