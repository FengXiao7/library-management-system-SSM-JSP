<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        //这个地方，用户修改名字不能重名，还在想咋解决
        $(function (){
            $("#submit").click(function (){
                if($("#userSex").val()!='男'&&$("#userSex").val()!='女'){
                    alert("用户性别请填男或者女！")
                    return false;
                }else{
                    const reg = /^[+]{0,1}(\d+)$/;//正整数包含0
                    if(!reg.test($("#userAge").val())){
                        alert("用户年龄请输入正整数！")
                        return false;
                    }else{
                        const reg1 = /^1\d{10}$/;//11位数，1开头
                        if(!reg1.test($("#userPhone").val())){
                            alert("电话号码格式有误，请重填！")
                            return false;
                        }else{
                            return true;
                        }
                    }
                }
            })
        })
    </script>
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
                    <small>用户完善个人信息界面</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 column">
            <a class="btn btn-info" href="${pageContext.request.contextPath}/user/allBook">返回</a>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/user/ImprovePersonalInformation/${sessionScope.userID}" method="post">
        <div class="form-group">
            <label for="userName">用户名</label>
            <input type="text" class="form-control" id="userName"  name="userName" value="${PersonalInformation.getUserName()}" required="required">
        </div>
        <div class="form-group">
            <label for="userPhone">用户电话</label>
            <input type="text" class="form-control" id="userPhone"  name="userPhone" value="${PersonalInformation.getUserPhone()}" required="required">
        </div>
        <div class="form-group">
            <label for="userSex">用户性别</label>
            <input type="text" class="form-control" id="userSex"  name="userSex" value="${PersonalInformation.getUserSex()}" required="required">
        </div>
        <div class="form-group">
            <label for="userAge">用户年龄</label>
            <input type="text" class="form-control" id="userAge"  name="userAge" value="${PersonalInformation.getUserAge()}" required="required">
        </div>
        <input id="submit" type="submit" class="btn btn-success" value="确认修改">
    </form>
</div>
</body>
</html>
