<%--
  Created by IntelliJ IDEA.
  User: Da
  Date: 2018/11/13
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<%
    String importMsg = "";
    if (request.getSession().getAttribute("msg") != null) {
        importMsg = request.getSession().getAttribute("msg").toString();
    }
    request.getSession().setAttribute("msg", "");
%>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/linearicons/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/chartist/css/chartist-custom.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/static/images/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/static/images/favicon.png">
</head>
<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="${pageContext.request.contextPath}/compact/index"><img
                    src="${pageContext.request.contextPath}/static/images/logo-dark.png" alt="Management Logo"
                    class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <%--隐藏左侧栏--%>
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>

            <%--用户管理--%>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img
                                src="${pageContext.request.contextPath}/static/images/user.png" class="img-circle"
                                alt="Avatar"> <span>管理员</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <%--<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>--%>
                            <%--<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>--%>
                            <%--<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>--%>
                            <li><a href="${pageContext.request.contextPath}/user/logout"><i class="lnr lnr-exit"></i>
                                <span>Logout</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <%--首页--%>
                    <li><a href="${pageContext.request.contextPath}/compact/index" class="active"><i class="lnr lnr-home"></i> <span>Index</span></a></li>
                    <%--表格--%>
                    <li><a href="${pageContext.request.contextPath}/compact/List" class=""><i class="lnr lnr-dice"></i> <span>Tables</span></a></li>
                    <%--图标--%>
                    <li>
                        <a href="#subCharts" data-toggle="collapse" class="collapsed"><i class="lnr lnr-chart-bars"></i>
                            <span>Charts</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subCharts" class="collapse ">
                            <ul class="nav">
                                <li><a href="${pageContext.request.contextPath}/echarts/checkCA" class="">合同总额</a></li>
                                <li><a href="${pageContext.request.contextPath}/echarts/checkRS" class="">回款情况</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->

    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-headline">
                    <div class="panel-heading">
                        <h3 class="panel-title">上传报表</h3>
                    </div>
                    <div class="panel-body">
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
                    </div>
                </div>
                <div class="panel panel-headline">
                    <div class="panel-heading">
                        <h3 class="panel-title">下载模板</h3>
                    </div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/compact/download">
                            <div style="margin: 30px;">
                                <input id="excel_download" type="submit" value="下载Excel模板"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->

    <div class="clearfix"></div>
    <footer>
        <div class="container-fluid">
            <p class="copyright">Copyright &copy; 2018.<a href="http://www.zzjinhui.com/" target="_blank" title="金惠科技">金惠科技</a> All rights reserved.</p>
        </div>
    </footer>
</div>
<!-- END WRAPPER -->

<!-- Javascript -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/klorofil-common.js"></script>
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
</body>
</html>
