package com.library.service;

import com.library.dao.ManagerDao;
import com.library.pojo.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-05-28-16:14
 */
@Service
public class ManagerServiceImpl implements ManagerService{
    @Autowired
    @Qualifier("managerDao")
    private ManagerDao managerDao;
    @Override
    public int addManager(Manager manager) {
        return managerDao.addManager(manager);
    }

    @Override
    public int deleteManager(Integer id) {
        return managerDao.deleteManager(id);
    }

    @Override
    public List<Manager> getAllManager() {
        return managerDao.getAllManager();
    }

    @Override
    public int updateManager(Manager manager) {
        return managerDao.updateManager(manager);
    }

    @Override
    public Manager getManager(Integer id) {
        return managerDao.getManager(id);
    }
}
