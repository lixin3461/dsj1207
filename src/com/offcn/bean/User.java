package com.offcn.bean;

import java.util.Date;

public class User {

    private int userid;
    private String username;
    private String password;
    private String sex;
    private String email;
    private String name;
    private Date birthday;

    public User(){}

    public User(int userid, String username, String password, String sex, String email, String name, Date birthday) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.email = email;
        this.name = name;
        this.birthday = birthday;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
