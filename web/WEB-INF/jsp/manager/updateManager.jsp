<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改管理员</title>

    <%--引用BootStarp--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="../../../js/jquery-3.5.1.js"></script>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
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
                    <small>修改管理员</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 column">
            <a class="btn btn-info" href="${pageContext.request.contextPath}/administrator/allManager">返回</a>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/administrator/updateManager" method="post">
        <div class="form-group">
            <label for="Name">管理员名称</label>
            <input type="text" class="form-control" id="Name" name="Name" value="${QueryOneManager.name}" required="required">
        </div>
        <div class="form-group">
            <label for="password">管理员密码</label>
            <input type="text" class="form-control" id="password" name="password" value="${QueryOneManager.password}" required="required">
        </div>
        <input type="hidden" name="managerID" value="${QueryOneManager.managerID}"/>
        <input type="submit" class="btn btn-default" value="修改">
    </form>
</div>
</body>
</html>
