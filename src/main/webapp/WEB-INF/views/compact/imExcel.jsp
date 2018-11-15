<%--
  Created by IntelliJ IDEA.
  User: Da
  Date: 2018/9/19
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String importMsg = "";
    if (request.getSession().getAttribute("msg") != null) {
        importMsg = request.getSession().getAttribute("msg").toString();
    }
    request.getSession().setAttribute("msg", "");
%>
<head>
    <title>上传表格</title>

    <!-- Bootstrap4核心 CSS 文件 -->
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>

    <%-- jquery 核心 JS 文件 --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

    <style type="text/css">
        ul {
            list-style: none;
            height: 42px;
            position: relative;
        }

        ul li {
            float: left;
        }

        .outdiv {
            float: right;
            position: relative;
            top: 50%;
            margin-top: -18px;
        }
    </style>


    <script type="text/javascript">
        function check() {
            var excel_file = $("#excel_file").val();
            if (excel_file == "" || excel_file.length == 0) {
                alert("请选择文件路径！");
                return false;
            } else {
                return true;
            }
        }

        $(document).ready(function () {
            var msg = null;
            if ($("#importMsg").text() != null) {
                msg = $("#importMsg").text();
            }
            if (msg!=null && !msg.is('')) {
                alert(msg);
            }
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${pageContext.request.contextPath}/compact/imExcel">上传</a></li>
    <li><a href="${pageContext.request.contextPath}/compact/List">合同列表</a></li>
    <li><a href="${pageContext.request.contextPath}/echarts/checkCA">合同总金额</a></li>
    <li><a href="${pageContext.request.contextPath}/echarts/checkRS">回款详情</a></li>
    <div class="outdiv">
        <form action="${pageContext.request.contextPath}/user/logout">
            <input class="btn btn-large btn-primary" type="submit" value="退出登录"/>&nbsp;&nbsp;
        </form>
    </div>
</ul>

<form action="${pageContext.request.contextPath}/compact/download">
    <div style="margin: 30px;">
    <input id="excel_download" type="submit" value="下载Excel模板"/>
    </div>
</form>

<form action="${pageContext.request.contextPath}/compact/uploadExcel" method="post" enctype="multipart/form-data" onsubmit="return check();">
    <div style="margin: 30px;">
        <input id="excel_file" type="file" name="filename" accept="xlsx" size="80"/>
        <br/>
        <input id="excel_button" type="submit" value="导入Excel"/>
    </div>
    <font id="importMsg" color="red"><%=importMsg%>
    </font>
    <input type="hidden"/>
</form>


<!-- Bootstrap4核心 JavaScript 文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>

</body>
</html>
