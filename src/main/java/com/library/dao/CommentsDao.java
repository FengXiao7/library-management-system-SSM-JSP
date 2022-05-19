package com.library.dao;

import com.library.pojo.Borrow;
import com.library.pojo.Comments;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-06-12-19:59
 */
public interface CommentsDao {
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
