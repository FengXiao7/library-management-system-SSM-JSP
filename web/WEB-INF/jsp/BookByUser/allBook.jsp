<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用JSTL标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部书籍</title>

    <%--引用BootStarp--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>

</head>
<body background="${pageContext.request.contextPath}/img/img_1.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<%--显示书籍已经借阅过的情况--%>

<div class="container">
    <%--标题--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表</small>
                    <small style="color:red;font-weight: bold">${sessionScope.HaveBorrow}</small>
                    <small style="color:red;font-weight: bold">${sessionScope.EXCEED_THE_NUMBER_OF_BORROWINGS}</small>
                    <small style="color:red;font-weight: bold">${sessionScope.MORE_THAN_3_MONTHS}</small>
                    <small style="color:red;font-weight: bold">${sessionScope.BorrowMsg}</small>
                    <small style="color:red;font-weight: bold">${sessionScope.DuplicateName}</small>
                    <small style="color:red;font-weight: bold">${you_have_not_reviewed_any_books}</small>
                </h1>
            </div>
        </div>
    </div>

    <%--增加--%>
    <div class="row">
        <div class="col-md-6 column" style="float: right">
            <span style="color: red;font-weight: bold">${errorNotFound}</span>
            <form action="${pageContext.request.contextPath}/user/queryBookName" method="post" class="form-inline">
                <input type="text" name="queryBookName"  placeholder="请输入要查询书籍的名称" class="form-control">
                <input type="submit" value="查询" class="btn btn-success">
            </form>
        </div>
    </div>

    <%--展示页面：表格，修改，删除--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">

                <%--表头--%>
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>作者</th>
                    <th>书籍类型</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
                </tr>
                </thead>
                <%--表的内容--%>
                <tbody>
                <c:forEach var="book" items="${applicationScope.BookList}">
                    <tr>
                        <td>${book.getBookID()}</td>
                        <td>${book.getBookName()}</td>
                        <td>${book.getBookCounts()}</td>
                        <td>${book.getBookAuthor()}</td>
                        <td>${book.getBookType()}</td>
                        <td>                                                    <%--获取图书ID和用户ID--%>  <%--用户ID在登录阶段存在session里的--%>
                            <a  href="${pageContext.request.contextPath}/user/Borrow/${book.getBookID()}/${sessionScope.userID}">借阅</a>
                            <a  href="${pageContext.request.contextPath}/user/ViewDetails/${book.getBookID()}">查看细节</a>
                            <a  href="${pageContext.request.contextPath}/user/ToComment/${book.getBookID()}/${sessionScope.userID}">评论</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
