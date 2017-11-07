package com.bawei.dao;

import com.bawei.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    User selectByName(String name);

    void add(User user);

    User login(User user);

    List<User> selectAllUser();
}
