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
  <title>根据书号查看评论信息</title>
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
        <small>根据书号查看评论信息</small>
        <small style="color: red;font-weight: bold">${the_book_has_never_been_reviewed}</small>
      </h1>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-6 column">
    <a class="btn btn-info" href="${pageContext.request.contextPath}/book/allBook">返回</a>
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
