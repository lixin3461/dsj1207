package com.offcn.dao.impl;

import com.offcn.bean.User;
import com.offcn.dao.UserDao;
import com.offcn.utils.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

public class UserDaoImpl implements UserDao {
    @Override
    public int insertUser(User u) {
        int result = 0;
        try{
            QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
            String sql = "insert into user values (null,?,?,?,?,?,?)";
            result = qr.update(sql,new Object[]{u.getUsername(),u.getPassword(),u.getEmail(),u.getName(),u.getSex(),u.getBirthday()});

        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public User findUserByUsernameAndPassword(String username, String password) {
        User user = null;
        try{
            String sql = "select * from user where username=? and password=?";
            QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
            user = qr.query(sql,new BeanHandler<>(User.class),username,password);
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
