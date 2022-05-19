<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2021/6/14
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>后台管理中心</title>
</head>
<body>
<!-- 导航栏部分 -->
<div class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <div class="navbar-brand">
                <span class="glyphicon glyphicon-fire"></span>
                图书借阅后台管理中心
            </div>
        </div>
        <ul class="nav navbar-nav nav-stacked navbar-right">
            <li>
                <a href="#" data-toggle="dropdown">
                    <small> ${sessionScope.ManagerName}</small>
                    <span class="caret"></span>
                </a>
                <ul class="nav nav-pills nav-stacked dropdown-menu">
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/login/manager" target="iframe_cont">
                            <span class="glyphicon glyphicon-off"></span> 退出登录
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
                    <a href="#collapseB" data-parent="#box" data-toggle="collapse" class="panel-title">图书管理</a>
                </div>
                <div class="panel-collapse collapse " id="collapseB">
                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="${pageContext.request.contextPath}/book/allBook" target="iframe_cont"><span
                                    class="glyphicon glyphicon-align-left"> </span> 图书列表</a></li>
                            <li><a href="${pageContext.request.contextPath}/book/toAddBook" target="iframe_cont"><span
                                    class="glyphicon glyphicon-folder-open"> </span>新增书籍</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-info Menu_list">
                <div class="panel-heading">
                    <a href="#collapseA" data-parent="#box" data-toggle="collapse" class="panel-title">人员管理</a>
                </div>
                <div class="panel-collapse collapse" id="collapseA">
                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="${pageContext.request.contextPath}/administrator/allUser" target="iframe_cont">
                                <span class="glyphicon glyphicon-user">用户列表</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/administrator/ViewUserOverBorrowingTime " target="iframe_cont"><span
                                    class="glyphicon glyphicon-user"> </span> 借阅逾期用户</a></li>
                            <li><a href="${pageContext.request.contextPath}/administrator/allManager" target="iframe_cont">
                                <span class="glyphicon glyphicon-user">管理员列表</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-info Menu_list">
                <div class="panel-heading">
                    <a href="#collapseD" data-parent="#box" data-toggle="collapse" class="panel-title">类别管理</a>
                </div>
                <div class="panel-collapse collapse" id="collapseD">
                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked">
<%--                            偷了个懒，用一张表存起来更好！不然每次新增新类别的书籍，就要手动加一个a标签--%>
                            <li><a href="${pageContext.request.contextPath}/administrator/queryBookType/小说" target="iframe_cont"><span
                                    class="glyphicon glyphicon-align-left"> </span>小说</a></li>
                            <li><a href="${pageContext.request.contextPath}/administrator/queryBookType/漫画" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span> 漫画</a></li>
                            <li><a href="${pageContext.request.contextPath}/administrator/queryBookType/科幻" target="iframe_cont"><span
                                    class="glyphicon glyphicon-align-left"> </span>科幻</a></li>
                            <li><a href="${pageContext.request.contextPath}/administrator/queryBookType/文学" target="iframe_cont"><span
                                    class="glyphicon glyphicon-align-left"> </span>文学</a></li>
                            <li><a href="${pageContext.request.contextPath}/administrator/queryBookType/知识" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span> 知识</a></li>
                            <li><a href="${pageContext.request.contextPath}/administrator/queryBookType/历史" target="iframe_cont">
                                <span class="glyphicon glyphicon-align-left"> </span> 历史</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-10">
        <iframe src="${pageContext.request.contextPath}/book/allBook" id="iframe_cont" name="iframe_cont" frameborder="0" width="100%"
                height="85%" >
        </iframe>
    </div>
</div>
</body>
</html>

