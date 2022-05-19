package com.library.service;

import com.library.dao.BookDao;
import com.library.pojo.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    //组合Dao
    @Autowired
    @Qualifier("bookDao")
    private BookDao bookDao;
    @Override
    public int addBook(Books books) {
        return bookDao.addBook(books);
    }

    @Override
    public int deleteBookByID(int id) {
        return bookDao.deleteBookByID(id);
    }

    @Override
    public int updateBook(Books books) {
        return bookDao.updateBook(books);
    }

    @Override
    public Books queryBookByID(int id) {
        return bookDao.queryBookByID(id);
    }

    @Override
    public List<Books> queryAllBook() {
        return bookDao.queryAllBook();
    }

    @Override
    public Books queryBookByName(String bookName) {
        return bookDao.queryBookByName(bookName);
    }

    @Override
    public List<Books> queryBookByType(String bookType) {
        return bookDao.queryBookByType(bookType);
    }
}
