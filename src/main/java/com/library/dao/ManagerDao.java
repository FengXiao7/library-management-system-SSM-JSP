package com.library.dao;

import com.library.pojo.Manager;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-05-28-16:03
 */
public interface ManagerDao {
    //添加一个管理员
    int addManager(Manager manager);
    //根据id删除管理员
    int deleteManager(Integer managerID);
    //查询所有管理员
    List<Manager> getAllManager();
    //修改管理员信息
    int updateManager(Manager manager);
    //根据id查看管理员信息
    Manager getManager(Integer managerID);
}
