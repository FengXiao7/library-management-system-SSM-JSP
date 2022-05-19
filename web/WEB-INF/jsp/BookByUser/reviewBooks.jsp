<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用JSTL标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>评论书籍</title>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
</head>
<body background="${pageContext.request.contextPath}/img/img_1.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header">
            <h1>
                <small>评论页</small>
            </h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 column">
        <a class="btn btn-info" href="${pageContext.request.contextPath}/user/allBook">返回</a>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <tr>
                <th>书籍名称</th>
                <td>${requestScope.book_details.getBookName()}</td>
            </tr>
            <tr>
                <th>书籍描述</th>
                <td>${requestScope.book_details.getDetail()}</td>
            </tr>
            <tr>
                <th>作者</th>
                <td>${requestScope.book_details.getBookAuthor()}</td>
            </tr>
        </table>
    </div>
</div>
<span style="color:blue; font-weight: bold">${people_review_book}</span>
<form action="${pageContext.request.contextPath}/user/Comment/${requestScope.book_details.getBookID()}/${sessionScope.userID}" method="post">
    <div class="form-group">
        <textarea class="form-control" name="bookComments" placeholder="请填写您的评论" required="required" rows="15" cols="25"></textarea>
    </div>
    <button id="submit" type="submit" class="btn btn-success">提交</button>
</form>
</body>
</html>
