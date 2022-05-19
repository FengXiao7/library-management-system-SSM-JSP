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
  <title>用户超时未归还列表</title>
  <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
        <small>用户超时未归还列表</small>
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
        <th>借阅图书</th>
        <th>借阅时间</th>
        <th>未归还天数</th>
      </tr>
      </thead>

      <tbody>
      <c:forEach var="info" items="${sessionScope.ViewUserOverBorrowingTime}">
        <tr>
          <td>${info.userName}</td>
          <td>${info.bookName}</td>
          <td>${info.borrowTime}</td>
          <td>${info.overDay}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
