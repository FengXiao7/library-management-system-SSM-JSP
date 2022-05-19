<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用JSTL标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部书籍</title>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
    <%--引用BootStarp--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body background="${pageContext.request.contextPath}/img/img_3.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">


<div class="container">
    <%--标题--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">

        <br>
        <br>
        <br>
        <div class="col-md-6 column">
            <span style="color: red;font-weight: bold">${errorNotFoundBook}</span>
            <form action="${pageContext.request.contextPath}/book/queryBook" method="post" class="form-inline">
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
                    <th>查看并修改</th>
                    <th>删除</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;情况</th>
                </tr>
                </thead>
                <%--表的内容--%>
                <tbody>
                <c:forEach var="book" items="${applicationScope.BookList}">
                    <tr>
                        <td>${book.getBookID()}</td>
                        <td>${book.getBookName()}</td>
                        <td>${book.getBookCounts()}</td>
                        <td><a href=" ${pageContext.request.contextPath}/book/toUpdate/${book.getBookID()}">详细信息</a></td>
                        <td><a href=" ${pageContext.request.contextPath}/book/deleteBook/${book.getBookID()}"
                               onclick="return confirm('你确定要删除这本书吗？此操作将删除该书的所有借阅信息，评论信息和书籍的详细信息！！！');">删除</a></td>
                        <td>
                            <a href=" ${pageContext.request.contextPath}/manager/AllBorrowByBookID/${book.getBookID()}">借阅情况</a>&nbsp;|&nbsp;
                            <a href=" ${pageContext.request.contextPath}/manager/AllCommentByBookID/${book.getBookID()}">评论情况</a>
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