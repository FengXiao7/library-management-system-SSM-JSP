package com.library.dao;

import com.library.pojo.User;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-05-30-12:49
 */
public interface UserDao {
    //增加用户
    int addUser(User user);
    //删除用户
    int deleteUser(Integer id);
    //更新用户
    int updateUser(User user);
    //查询一个用户
    User getOneUser(Integer id);
    //根据用户名查询一个用户
    User getUserByUserName(String userName);
    //查询所有用户
    List<User> getAllUser();
}
