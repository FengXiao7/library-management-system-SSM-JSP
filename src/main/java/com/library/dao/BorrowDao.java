package com.library.dao;

import com.library.pojo.Borrow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-05-30-15:48
 */
public interface BorrowDao {
    //增加借阅信息
    Integer addBorrow(Borrow borrow);
    //根据书号和用户号删除借阅信息
    Integer deleteBorrow(@Param("ID1") Integer bookID,@Param("ID2") Integer userID);
    //根据书号删除借阅信息
    Integer deleteBorrowByBookID(@Param("ID1") Integer bookID);
    //根据用户号删除借阅信息
    Integer deleteBorrowByUserID(@Param("ID2") Integer userID);
    //查看所有借阅信息
    List<Borrow> getAllBorrow();
    //根据图书ID获取借阅信息
    List<Borrow> getAllBorrowByBookID(@Param("ID1")Integer bookID);
    //根据用户ID获取借阅信息
    List<Borrow> getAllBorrowByUserID(@Param("ID2")Integer userID);
}
