package com.bawei.service.impl;

import com.bawei.dao.UserMapper;
import com.bawei.pojo.User;
import com.bawei.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userDao;
    @Override
    public String selectByname(String name) {
        User user = userDao.selectByName(name);
        if (user!=null) {
            return "ok";
        }
        return "error";
    }

    @Override
    public String add(User user) {
        userDao.add(user);
        return "ok";
    }

    /* (non-Javadoc)
     * @see com.bawei.service.UserService#login(java.lang.String, java.lang.String)
     */
    @Override
    public String login(String name, String password,HttpSession session) {
        User user = new User(name,password);
        User login = userDao.login(user);
        System.out.println(user);
        if (login!=null) {
            session.setAttribute("user",login);
            return "ok";
        }
        return "error";

    }

    @Override
    public List<User> selectAllUser() {
        return userDao.selectAllUser();
    }

}
