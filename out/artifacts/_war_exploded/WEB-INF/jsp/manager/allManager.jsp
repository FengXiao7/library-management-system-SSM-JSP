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
    <title>管理员列表</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#add").click(function (){
                if($("#msg").val()=="冯成祥"){
                    return;
                }
                alert("增加管理员功能只对超级管理员开放！")
                return false;
            })
        })
        $(function (){
            $(".modify").click(function (){
                if($("#msg").val()=="冯成祥"){
                    return;
                }
                alert("修改管理员信息功能只对超级管理员开放！")
                return false;
            })
        })
        $(function (){
            $(".delete").click(function (){
                if($("#msg").val()=="冯成祥"){
                    return;
                }
                alert("删除管理员功能只对超级管理员开放！")
                return false;
            })
        })
    </script>
    <style type="text/css">
        ::-webkit-scrollbar{display: none;}
    </style>
</head>
<body background="${pageContext.request.contextPath}/img/img_3.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<input type="hidden" id="msg" value="${sessionScope.SuperManager}">

<%--标题--%>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="page-header">
            <h1>
                <small>管理员列表</small>
            </h1>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 column">
        <a id="add" class="btn btn-primary" href="${pageContext.request.contextPath}/manager/toAddManager">新增管理员</a>
        <a class="btn btn-info" href="${pageContext.request.contextPath}/book/allBook">返回</a>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <%--表头--%>
            <thead>
            <tr>
                <th>管理员姓名</th>
                <th>管理员密码</th>
                <th>操作</th>
            </tr>
            </thead>
            <%--表的内容--%>
            <tbody>
            <c:forEach var="manager" items="${ManagerList}">
                <tr>
                    <td>${manager.getName()}</td>
                    <td>${manager.getPassword()}</td>
                    <td>
                            <%--                        注意要用class绑定事件，因为有多个a标签--%>
                        <a class="modify" href="${pageContext.request.contextPath}/manager/toUpdate/${manager.getManagerID()}">修改</a>&nbsp;|&nbsp;
                        <a class="delete" href="${pageContext.request.contextPath}/manager/delete/${manager.getManagerID()}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
