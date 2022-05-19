<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>登录</title>
  <meta name="keywords" content=""/>
  <meta name="description" content=""/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
  <link href="css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>图书管理系统欢迎您！<sup></sup></h1>
<!--
表单内容
-->
<div class="login" style="margin-top:50px;">
  <div class="login" style="margin-top:50px;">
    <div class="header">
      <div class="switch" id="switch">
        <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7" style="align:center">快速登录</a>
        <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
      </div>
    </div>
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">
      <!--选择身份登录-->
      <div class="web_login" id="web_login">
        <div class="login-box">
          <div class="login_form">
            <form action="${pageContext.request.contextPath}/login/manager" accept-charset="utf-8" method="post">
              <input type="hidden" name="statu" value="1"/>
              <input type="hidden" name="to" value="log"/>
              <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="管理员登录" style="width:150px;" class="button_blue"/></div>
            </form><br>
            <form action="${pageContext.request.contextPath}/login/user" accept-charset="utf-8" method="post">

              <br>
              <br>
              <br>
              <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="用户登录" style="width:150px;" class="button_blue"/></div>
              <div class="cl"></div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <%--  <div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>--%>
  </div>
  <div class="recommend">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</div>
</body>
</html>