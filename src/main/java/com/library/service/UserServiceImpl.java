package com.library.service;

import com.library.dao.UserDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-05-30-13:00
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;
    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public User getOneUser(Integer id) {
        return userDao.getOneUser(id);
    }

    @Override
    public User getUserByUserName(String userName) {
        return userDao.getUserByUserName(userName);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }
}
