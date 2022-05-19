<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用JSTL标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>新增管理员</title>
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
                    <small>新增管理员</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 column">
            <a class="btn btn-info" href="${pageContext.request.contextPath}/manager/allManager">返回</a>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/manager/addManager" method="post">
        <div class="form-group">
            <label for="Name">管理员名称</label>
            <input type="text" class="form-control" id="Name" name="Name" required="required">
        </div>
        <div class="form-group">
            <label for="password">管理员密码</label>
            <input type="password" class="form-control" id="password" name="password"required="required">
        </div>
        <button type="submit" class="btn btn-default">增加</button>
    </form>
</div>

</body>
</html>
