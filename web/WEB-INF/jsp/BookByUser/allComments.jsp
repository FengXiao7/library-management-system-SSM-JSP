<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用JSTL标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户评论信息</title>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
    <%--引用BootStarp--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body background="${pageContext.request.contextPath}/img/img_1.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div class="container">
    <%--标题--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>用户评论列表</small>
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
                <c:forEach var="Comment" items="${sessionScope.allCommentsByUser}">
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
</div>

</body>
</html>
