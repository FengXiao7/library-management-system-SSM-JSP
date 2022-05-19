<%--
  Created by IntelliJ IDEA.
  User: 18284
  Date: 2021/5/28
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>根据用户名查评论信息</title>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body background="${pageContext.request.contextPath}/img/img_3.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<%--标题--%>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header">
            <h1>
                <small>根据用户名查评论信息</small>
                <small style="color:red;font-weight: bold">${this_user_has_never_reviewed_the_book}</small>
            </h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 column">
        <a class="btn btn-info" href="${pageContext.request.contextPath}/manager/allUser">返回</a>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <%--表头--%>
            <thead>
            <tr>
                <th>用户姓名</th>
                <th>评论图书名</th>
                <th>评论内容</th>
                <th>评论时间</th>
            </tr>
            </thead>
            <%--表的内容--%>
            <tbody>
            <c:forEach var="comments" items="${user_comments_about_the_book_information}">
                <tr>
                    <td>${comments.userName}</td>
                    <td>${comments.bookName}</td>
                    <td>${comments.bookComments}</td>
                    <td>${comments.commentsDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
