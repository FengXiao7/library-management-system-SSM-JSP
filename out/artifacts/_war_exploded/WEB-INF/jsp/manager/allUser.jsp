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
    <title>用户列表</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
</head>
<body background="${pageContext.request.contextPath}/img/img_3.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">


<%--标题--%>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header">
            <h1>
                <small>用户列表</small>
            </h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 column">
        <a class="btn btn-info" href="${pageContext.request.contextPath}/book/allBook">返回</a>
        <%--        <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/ViewUserOverBorrowingTime">查看用户超时未归还情况</a>--%>
    </div>
    <span style="color: red;font-weight: bold">${errorNotFoundUser}</span>
    <form action="${pageContext.request.contextPath}/manager/queryUser" method="post" class="form-inline">
        <input type="text" name="queryUserName"  placeholder="请输入要查询的用户名称" class="form-control">
        <input type="submit" value="查询" class="btn btn-primary">
    </form>
</div>

<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <%--表头--%>
            <thead>
            <tr>
                <th>用户姓名</th>
                <th>情况</th>
            </tr>
            </thead>
            <%--表的内容--%>
            <tbody>
            <c:forEach var="user" items="${applicationScope.allUser}">
                <tr>
                    <td>${user.getUserName()}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/manager/AllBorrowByUserID/${user.getUserID()}">借阅情况</a>&nbsp;|&nbsp;
                        <a href="${pageContext.request.contextPath}/manager/AllCommentByUserID/${user.getUserID()}">评论情况</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
