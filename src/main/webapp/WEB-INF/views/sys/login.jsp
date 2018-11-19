<%--
  Created by IntelliJ IDEA.
  User: Da
  Date: 2018/11/12
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录页面</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Erise Login Form Responsive web template, Bootstrap Web Templates, Flat Web Templates,
     Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        } </script>
    <!-- //for-mobile-apps -->
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet" type="text/css" media="all"/>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic' rel='stylesheet'
          type='text/css'>


</head>
<body>
<!-- main -->
<div class="main">
    <%--<h1>Login Form</h1>--%>
    <div class="main-info">
        <div class="main-pos">
            <span></span>
        </div>
        <div class="main-info1">
            <h3>Sign In</h3>
            <form action="${pageContext.request.contextPath}/user/checkLogin" method="post">
                <input type="text" name="username" placeholder="Username" required=" ">
                <input type="password" name="password" placeholder="Password" required=" ">
                <input type="submit" value="Login">

                <%--<div class="ckeck-bg">--%>
                    <%--<div class="checkbox-form">--%>
                        <%--<div class="check">--%>
                            <%--<label class="checkbox">--%>
                                <%--<input type="checkbox" name="checkbox" checked="">--%>
                                <%--<i> </i>Remember my Password--%>
                            <%--</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="check-sub">--%>
                    <%--<input type="submit" value="Login">--%>
                <%--</div>--%>
            </form>
            <i> </i>
            <font color="red" >
                <%-- 提示信息--%>
                <span id="message" style="text-align: center;display:block;">${msg}</span>
            </font>
            <p>Forgot your password? <a href="#">Click Here</a></p>

        </div>

    </div>

    <div class="copy-right">
        <p>© 2018 Sign In Form. All rights reserved | Design by <a href="http://www.zzjinhui.com/">金惠科技</a></p>
    </div>
</div>
<!-- //main -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
</body>
</html>
