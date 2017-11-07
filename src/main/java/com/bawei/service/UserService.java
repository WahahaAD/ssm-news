package com.bawei.service;

import com.bawei.pojo.User;


import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {
    /**
     * @param name
     */
    String selectByname(String name);

    /**
     * @param user
     */
    String add(User user);

    /**
     * @param password
     * @param name
     * @param session
     *
     */
    String login(String name, String password, HttpSession session);

    List<User> selectAllUser();
}
