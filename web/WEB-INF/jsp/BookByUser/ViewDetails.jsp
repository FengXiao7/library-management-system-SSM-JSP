<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用JSTL标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>书籍详细信息</title>
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
                <small>书籍详细信息</small>
            </h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 column">
        <a class="btn btn-info" href="${pageContext.request.contextPath}/user/allBook">返回</a>
    </div>
</div>
<span style="color: red;font-weight: bold">${the_book_has_never_been_reviewed}</span>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <tr>
                <th>书籍编号</th>
                <td>${applicationScope.ViewDetails.getBookID()}</td>
            </tr>
            <tr>
                <th>书籍名称</th>
                <td>${applicationScope.ViewDetails.getBookName()}</td>
            </tr>
            <tr>
                <th>书籍数量</th>
                <td>${applicationScope.ViewDetails.getBookCounts()}</td>
            </tr>
            <tr>
                <th>书籍描述</th>
                <td>${applicationScope.ViewDetails.getDetail()}</td>
            </tr>
            <tr>
                <th>书籍类别</th>
                <td>${applicationScope.ViewDetails.getBookType()}</td>
            </tr>
            <tr>
                <th>出版社</th>
                <td>${applicationScope.ViewDetails.getPress()}</td>
            </tr>
            <tr>
                <th>作者</th>
                <td>${applicationScope.ViewDetails.getBookAuthor()}</td>
            </tr>
            <tr>
                <th>出版日期</th>
                <td>${applicationScope.ViewDetails.getBookDate()}</td>
            </tr>
            <tr>
                <th>页数</th>
                <td>${applicationScope.ViewDetails.getBookPage()}</td>
            </tr>
        </table>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">

            <%--表头--%>
            <thead>
            <tr>
                <th>评论人</th>
                <th>图书</th>
                <th>评论</th>
                <th>评论时间</th>
            </tr>
            </thead>
            <%--表的内容--%>
            <tbody>
            <c:forEach var="Comment" items="${book_review_information}">
                <tr>
                    <td>${Comment.userName}</td>
                    <td>${Comment.bookName}</td>
                    <td>${Comment.bookComments}</td>
                    <td>${Comment.commentsDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
