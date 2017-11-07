package com.bawei.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    private Integer id;//编号
    private String name;//姓名
    private String password;//密码
    private String username;//昵称
    private String email;//邮箱
    private String sex;//性别
    private String hobby;//爱好
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;//出生日期
    private String address;//地址
    private String phone;//手机号
    private String idcard;//身份证
    private String introduce;//个人简介
    private String picture;//头像

    public User(Integer id, String name, String password, String username, String email, String sex, String hobby,
                Date birthday, String address, String phone, String idcard, String introduce, String picture) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.username = username;
        this.email = email;
        this.sex = sex;
        this.hobby = hobby;
        this.birthday = birthday;
        this.address = address;
        this.phone = phone;
        this.idcard = idcard;
        this.introduce = introduce;
        this.picture = picture;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getId() {

        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getSex() {
        return sex;
    }

    public String getHobby() {
        return hobby;
    }

    public Date getBirthday() {
        return birthday;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getIdcard() {
        return idcard;
    }

    public String getIntroduce() {
        return introduce;
    }

    public String getPicture() {
        return picture;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", hobby='" + hobby + '\'' +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", idcard='" + idcard + '\'' +
                ", introduce='" + introduce + '\'' +
                ", picture='" + picture + '\'' +
                '}';
    }

    public User() {
        super();
    }

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }
}




























































