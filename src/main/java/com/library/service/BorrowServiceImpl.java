package com.library.service;

import com.library.dao.BorrowDao;
import com.library.pojo.Borrow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-05-30-16:09
 */
@Service
public class BorrowServiceImpl implements BorrowService{
    @Autowired
    @Qualifier("borrowDao")
   private BorrowDao borrowDao;
    @Override
    public Integer addBorrow(Borrow borrow) {
        return borrowDao.addBorrow(borrow);
    }

    @Override
    public Integer deleteBorrow(Integer bookID, Integer userID) {
        return borrowDao.deleteBorrow(bookID,userID);
    }

    @Override
    public Integer deleteBorrowByBookID(Integer bookID) {
        return borrowDao.deleteBorrowByBookID(bookID);
    }

    @Override
    public Integer deleteBorrowByUserID(Integer userID) {
        return borrowDao.deleteBorrowByUserID(userID);
    }

    @Override
    public List<Borrow> getAllBorrow() {
        return borrowDao.getAllBorrow();
    }

    @Override
    public List<Borrow> getAllBorrowByBookID(Integer bookID) {
        return borrowDao.getAllBorrowByBookID(bookID);
    }

    @Override
    public List<Borrow> getAllBorrowByUserID(Integer userID) {
        return borrowDao.getAllBorrowByUserID(userID);
    }
}
