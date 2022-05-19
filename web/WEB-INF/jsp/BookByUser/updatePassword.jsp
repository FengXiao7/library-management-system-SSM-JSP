<%--
  Created by IntelliJ IDEA.
  User: 18284
  Date: 2021/5/29
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
    <title>用户修改密码界面</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#submit").click(function (){
                if($("#password0").val()===$("#OldPassWord").val()){
                    if($("#password1").val()===$("#password2").val()){
                        return true;
                    }else{
                        alert("密码不一致！");
                        return false;
                    }
                }
                alert("旧密码不正确！");
                return false;
            })
        })
    </script>
</head>
<body background="${pageContext.request.contextPath}/img/img_1.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<input type="hidden" id="OldPassWord" value="${sessionScope.user_s_old_password}">
<div class="container">
    <%--标题--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>用户修改密码界面</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 column">
            <a class="btn btn-info" href="${pageContext.request.contextPath}/user/allBook">返回</a>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/user/updatePassword/${sessionScope.userID}" method="post">
        <div class="form-group">
            <label for="password0">旧密码</label>
            <input type="text" class="form-control" id="password0"  value="" placeholder="请填写用户旧密码" required="required">
        </div>
        <div class="form-group">
            <label for="password1">新密码</label>
            <input type="text" class="form-control" id="password1"  name="userPassword" value="" placeholder="请填写用户新密码" required="required">
        </div>
        <div class="form-group">
            <label for="password2">确认新密码</label>
            <input type="text" class="form-control" id="password2" value="" placeholder="请确认用户新密码" required="required">
        </div>
        <input id="submit" type="submit" class="btn btn-success" value="确认修改">
    </form>
</div>
</body>
</html>
