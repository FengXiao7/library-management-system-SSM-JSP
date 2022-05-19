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
  <link href="../css/login.css" rel="stylesheet" type="text/css"/>
  <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

  <script type="text/javascript">
    $(function (){
      $("#submit").click(function (){
        if($("#password1").val()===$("#password2").val()){
          return true;
        }else{
          alert("密码不一致！");
          return false;
        }
      })
    })
  </script>
</head>
<body>
<h1>图书管理系统<sup></sup></h1>
<div class="login" style="margin-top:50px;">

  <div class="login" style="margin-top:50px;">

    <div class="header">
      <div class="switch" id="switch">
        <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>
        <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
      </div>
    </div>
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 10px;">
    </div>

    <!--注册-->
    <%--   <div class="qlogin" id="qlogin" style="display: none; ">--%>
    <div class="web_login">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;font-weight: bold;font-size: 20px">${UserAlreadyExists}</span>
      <form action="${pageContext.request.contextPath}/user/UserRegister" method="post">

        <ul class="reg_form" id="reg-ul">
          <div id="userCue" class="cue">快速注册请注意格式</div>
          <li>
            <label for="Name" class="input-tips2">用户名</label>
            <div class="inputOuter2">
              <input type="text" id="Name" name="userName" maxlength="16" class="inputstyle2" required="required"/>
            </div>
          </li>
          <li>
            <label for="password1" class="input-tips2">密码：</label>
            <div class="inputOuter2">
              <input type="password" id="password1" name="userPassword" maxlength="16" class="inputstyle2" required="required"/>
            </div>
          </li>
          <li>
            <label for="password2" class="input-tips2">确认密码：</label>
            <div class="inputOuter2">
              <input type="password" id="password2" name="" maxlength="16" class="inputstyle2" required="required"/>
            </div>
          </li>
<%--          <li>--%>
<%--            <label for="captcha_img" class="input-tips2">验证码：</label>--%>
<%--            <div class="inputOuter2">--%>
<%--              <img id="captcha_img" border="1" src="../validateImg.jsp" width="120" height="40"/>--%>
<%--              <a href="javascript:void (0)"--%>
<%--                 onclick="document.getElementById('captcha_img').src='../validateImg.jsp?r='+Math.random()"--%>
<%--                 ;>看不清？</a>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--          <li>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name="authcode" value="" maxlength="16" class="inputstyle2" required="required">--%>
<%--          </li>--%>

          <li>
            <div class="inputArea">
              <input type="submit" id="submit" style="margin-top:10px;margin-left:85px;"
                     class="button_blue" value="同意并注册"/>
              <a href="${pageContext.request.contextPath}/login/user" class="zcxy" target="_blank">返回登录</a>
            </div>
            <div class="cl"></div>
        </ul>
      </form>
    </div>
  </div>
  <!--注册end-->
  <div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</div>
<%--  <div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>--%>

</div>
</body>
</html>