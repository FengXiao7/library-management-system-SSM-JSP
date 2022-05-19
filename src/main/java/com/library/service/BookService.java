package com.library.service;

import com.library.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {
    //增加一个Books
    int addBook(Books books);

    //根据id删除Books
    int deleteBookByID(int id);

    //更新Books
    int updateBook(Books books);

    //根据id查询Book
    Books queryBookByID(int id);

    //查看全部的Book
    List<Books> queryAllBook();

    //通过书名查看一本书
    Books queryBookByName(String bookName);

    //通过书类查看书
    List<Books> queryBookByType(String bookType);
}
