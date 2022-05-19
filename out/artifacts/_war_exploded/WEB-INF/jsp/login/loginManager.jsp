<%--
  Created by IntelliJ IDEA.
  User: 18284
  Date: 2021/5/29
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%--    <script type="text/javascript" src="../js/jquery.min.js"></script>--%>
    <%--    <script type="text/javascript" src="../js/login.js"></script>--%>
    <script type="text/javascript">
        if (window != top){
            top.location.href = location.href;
        }
    </script>
        <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>


</head>
<body background="${pageContext.request.contextPath}/img/img.png"
      style=" background-repeat:no-repeat ; font-family:'Microsoft Yahei';
font-size: 12px; margin: 0;">

<h1>管理员登录<sup></sup></h1>
<!--
表单内容
-->
<div class="login" style="margin-top:50px;">
    <div class="login" style="margin-top:50px;">
        <div class="header">
            <div class="switch" id="switch">
                <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" style="align-content: center" tabindex="7">快速登录</a>
                <%--               <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>--%>
                <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
            </div>
        </div>


        <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">
            <!--登录-->
            <div class="web_login" id="web_login">
                <div class="login-box">
                    <div class="login_form">
                        <form action="${pageContext.request.contextPath}/manager/JudgingManagerExists" accept-charset="utf-8" method="post">
                            <div class="uinArea" id="uinArea">
                                <label class="input-tips" for="Name">姓名</label>
                                <div class="inputOuter" id="uArea">

                                    <input type="text" id="Name" name="Name" class="inputstyle" required="required"/>
                                </div>
                            </div>
                            <div class="pwdArea" id="pwdArea">
                                <label class="input-tips" for="password">密码</label>
                                <div class="inputOuter" id="pArea">

                                    <input type="password" id="password" name="password" class="inputstyle" required="required"/>
                                    <span style="color: red;font-weight: bold">${ManagerNotExist}</span>
                                    <span style="color: red;font-weight: bold">${ManagerErrorPassword}</span>
                                </div>
                            </div>
                            <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
                        </form>
                        <br>
                        <div style="margin-left:143px;margin-top:35px;">
                            <a href="${pageContext.request.contextPath}/login/user">用户登录</a>
                        </div>
                    </div>
                    <br>

                </div>

            </div>
            <!--登录end-->
        </div>

    </div>
    <div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>

</div>
</body>
</html>
