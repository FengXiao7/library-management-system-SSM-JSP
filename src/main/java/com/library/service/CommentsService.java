package com.library.service;

import com.library.dao.CommentsDao;
import com.library.pojo.Comments;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-06-12-20:14
 */

public interface CommentsService {

    //增加评论信息
    Integer addComments(Comments comments);
    //修改评论信息
    Integer updateComments(Comments comments);
    //根据书号和用户号删除评论信息
    Integer deleteComments(@Param("ID1") Integer bookID, @Param("ID2") Integer userID);
    //根据书号删除评论信息
    Integer deleteCommentsByBookID(@Param("ID1") Integer bookID);
    //根据用户号删除评论信息
    Integer deleteCommentsByUserID(@Param("ID2") Integer userID);
    //查看所有评论信息
    List<Comments> getAllComments();
    //根据图书ID获取评论信息
    List<Comments> getAllCommentsByBookID(@Param("ID1")Integer bookID);
    //根据用户ID获取评论信息
    List<Comments> getAllCommentsByUserID(@Param("ID2")Integer userID);
}
