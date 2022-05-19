
<!--用户界面-->
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <title>借阅中心</title>
</head>
<body>
<!-- 导航栏部分 -->
<div class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <div class="navbar-brand">
                <span class="glyphicon glyphicon-book"></span>
                借阅中心
            </div>
        </div>
        <ul class="nav navbar-nav nav-stacked navbar-right">
            <li>
                <a href="#" data-toggle="dropdown">
                    <small>${sessionScope.userName}</small>
                    <span class="caret"></span>
                </a>
                <ul class="nav nav-pills nav-stacked dropdown-menu">
                    <li class="divider"></li>
                    <li>
                        <a href=" ${pageContext.request.contextPath}/login/user" target="iframe_cont">
                            <span class="glyphicon glyphicon-user"></span> 退出登录
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a id="LogOutUser" href="${pageContext.request.contextPath}/user/LogOutUser/${sessionScope.userID}"
                           onclick="return confirm('你确定要注销用户吗？此操作将删除您的所有借阅信息，评论以及个人信息！！！');"><!--</a>-->
                            <span class="glyphicon glyphicon-off"></span> 注销用户
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<!-- 页面部分 -->
<div class="row">
    <div class="col-sm-2">
        <div class="panel-group Menu_list" id="box">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <a href="#collapseB" data-parent="#box" data-toggle="collapse" class="panel-title">书库</a>
                </div>

                <div class="panel-collapse collapse in" id="collapseB">
                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a id="getAllBook" href="${pageContext.request.contextPath}/user/allBook" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span>所有</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/queryBookType/小说" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span>小说</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/queryBookType/漫画" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span>漫画</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/queryBookType/科幻" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span>科幻</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/queryBookType/文学" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span>文学</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/queryBookType/知识" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span>知识</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/queryBookType/历史" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span>历史</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-info Menu_list">
                <div class="panel-heading">
                    <a href="#collapseA" data-parent="#box" data-toggle="collapse" class="panel-title">借阅管理</a>
                </div>
                <div class="panel-collapse collapse" id="collapseA">
                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="${pageContext.request.contextPath}/user/allBorrow/${sessionScope.userID}" target="iframe_cont"><span
                                    class="glyphicon glyphicon glyphicon-align-left"></span>我的借阅记录</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/allComments/${sessionScope.userID}" target="iframe_cont"><span
                                    class="glyphicon glyphicon glyphicon-align-left"></span>我的评论</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--预留菜单-->
            <div class="panel panel-info Menu_list">
                <div class="panel-heading">
                    <a href="#collapseC" data-parent="#box" data-toggle="collapse" class="panel-title">个人信息</a>
                </div>
                <div class="panel-collapse collapse" id="collapseC">
                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="${pageContext.request.contextPath}/user/ToUpdatePassword/${sessionScope.userID}" target="iframe_cont"><span class="glyphicon glyphicon-align-left"> </span>修改密码</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/ToImprovePersonalInformation/${sessionScope.userID}" target="iframe_cont"><span class="glyphicon glyphicon-folder-open"> </span> 个人资料</a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-10">

        <iframe src="${pageContext.request.contextPath}/user/allBook" id="iframe_cont" name="iframe_cont" frameborder="0" width="100%"
                height="85%">

        </iframe>

    </div>
</div>
</body>
</html>
