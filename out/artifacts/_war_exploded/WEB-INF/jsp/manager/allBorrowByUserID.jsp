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
  <style type="text/css">
    ::-webkit-scrollbar{display: none;}
  </style>
  <title>根据用户名查借阅信息</title>
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
        <small>根据用户名查借阅信息</small>
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
        <th>借阅图书名</th>
        <th>借阅时间</th>
      </tr>
      </thead>
      <%--表的内容--%>
      <tbody>
      <c:forEach var="borrow" items="${applicationScope.AllBorrowByUserID}">
        <tr>
          <td>${borrow.userName}</td>
          <td>${borrow.bookName}</td>
          <td>${borrow.time}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
