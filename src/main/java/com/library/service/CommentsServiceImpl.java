package com.library.service;

import com.library.dao.CommentsDao;
import com.library.pojo.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-06-12-20:15
 */
@Service
public class CommentsServiceImpl implements CommentsService{
    @Autowired
    @Qualifier("commentsDao")
    private CommentsDao commentsDao;
    @Override
    public Integer addComments(Comments comments) {
        return commentsDao.addComments(comments);
    }

    @Override
    public Integer updateComments(Comments comments) {
        return commentsDao.updateComments(comments);
    }

    @Override
    public Integer deleteComments(Integer bookID, Integer userID) {
        return commentsDao.deleteComments(bookID,userID);
    }

    @Override
    public Integer deleteCommentsByBookID(Integer bookID) {
        return commentsDao.deleteCommentsByBookID(bookID);
    }

    @Override
    public Integer deleteCommentsByUserID(Integer userID) {
        return commentsDao.deleteCommentsByUserID(userID);
    }

    @Override
    public List<Comments> getAllComments() {
        return commentsDao.getAllComments();
    }

    @Override
    public List<Comments> getAllCommentsByBookID(Integer bookID) {
        return commentsDao.getAllCommentsByBookID(bookID);
    }

    @Override
    public List<Comments> getAllCommentsByUserID(Integer userID) {
        return commentsDao.getAllCommentsByUserID(userID);
    }
}
