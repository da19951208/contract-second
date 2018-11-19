<%--
  Created by IntelliJ IDEA.
  User: Da
  Date: 2018/11/14
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ita" uri="http://itheima.com/commons/" %>
<!-- 这个是重点！！！jstl使用获取数据的前提-->
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>
    <title>Table</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/linearicons/style.css">
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
                    <li><a href="${pageContext.request.contextPath}/compact/index" class=""><i
                            class="lnr lnr-home"></i> <span>Index</span></a></li>
                    <%--表格--%>
                    <li><a href="${pageContext.request.contextPath}/compact/List" class="active"><i
                            class="lnr lnr-dice"></i> <span>Tables</span></a></li>
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
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel">
                    <%--条件查询--%>
                        <form id="search" action="${pageContext.request.contextPath}/compact/List" method="post">
                            <div>
                                <label>签署年度：</label><input id="contractSignYear" name="contractSignYear" type="text"
                                                           maxlength="50" class="input-mini"/>
                                <label>项目编码：</label><input id="itemCoding" name="itemCoding" type="text" maxlength="50"
                                                           class="input-mini"/>
                                <label>销售人员：</label><input id="salePerson" name="salePerson" type="text" maxlength="50"
                                                           class="input-mini"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
                                                               value="查询"/>
                            </div>
                        </form>
                </div>
                <div class="panel panel-headline">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <!-- BASIC TABLE -->
                                <div class="panel-heading">
                                    <h3 class="panel-title">合同详情</h3>
                                </div>
                                <div class="panel-body" style="overflow: auto">
                                    <c:if test="${empty page.rows}">
                                        <div class="alert alert-warning" role="alert">
                                            <span class="glyphicon glyphicon-info-sign" aria-hidden="true">
                                            </span>没有查询到相关信息，请<a href="${pageContext.request.contextPath}/compact/index"
                                                                 type="button" class="btn btn-primary btn-sm">上传信息！</a>
                                        </div>
                                    </c:if>
                                    <%--合同详情表--%>
                                    <c:if test="${!empty page.rows}">
                                        <table id="compactTable"
                                               class="table table-striped table-bordered table-condensed">
                                            <tr>
                                                <th>合同签署年度</th>
                                                <th>项目编码</th>
                                                <th>销售人员</th>
                                                <th>项目名称</th>
                                                <th>合同额</th>
                                                <th>2015年开票金额</th>
                                                <th>2015年回款金额</th>
                                                <th>2016年开票金额</th>
                                                <th>2016年回款日期</th>
                                                <th>2016年回款金额</th>
                                                <th>2017年开票金额</th>
                                                <th>2017年回款日期</th>
                                                <th>2017年回款金额</th>
                                                <th>2018年开票日期</th>
                                                <th>2018年开票金额</th>
                                                <th>2018年回款日期</th>
                                                <th>2018年回款金额</th>
                                                <th>开票应收款</th>
                                                <th>开票合计</th>
                                                <th>未开票金额</th>
                                                <th>回款合计</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${page.rows}" var="compact">
                                                <tr>
                                                    <td>${compact.contractSignYear}</td>
                                                    <td>${compact.itemCoding}</td>
                                                    <td>${compact.salePerson}</td>
                                                    <td>${compact.projectName}</td>
                                                    <td>${compact.contractAmount}</td>
                                                    <td>${compact.invoiceAmount2015}</td>
                                                    <td>${compact.recoveredAmount2015}</td>
                                                    <td>${compact.invoiceAmount2016}</td>
                                                    <td>${compact.recoveredAmountDate2016}</td>
                                                    <td>${compact.recoveredAmount2016}</td>
                                                    <td>${compact.invoiceAmount2017}</td>
                                                    <td>${compact.recoveredAmountDate2017}</td>
                                                    <td>${compact.recoveredAmount2017}</td>
                                                    <td>${compact.invoiceAmount2018}</td>
                                                    <td>${compact.invoiceAmountDate2018}</td>
                                                    <td>${compact.recoveredAmount2018}</td>
                                                    <td>${compact.recoveredAmountDate2018}</td>
                                                    <td>${compact.due}</td>
                                                    <td>${compact.invoiceAmount}</td>
                                                    <td>${compact.unbilledAmount}</td>
                                                    <td>${compact.receivableTotal}</td>
                                                    <td>
                                                        <button type="button"><a href="${pageContext.request.contextPath}/compact/delete?id=${compact.id}"
                                                           onclick="return confirmx('要删除该合同信息吗？', this.href)">删除</a></button>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </table>
                                        <div class="col-md-12 text-right">
                                            <ita:page url="${pageContext.request.contextPath }/compact/List"></ita:page>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <!-- END BASIC TABLE -->
                        </div>
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
            <p class="copyright">Copyright &copy; 2018.<a href="http://www.zzjinhui.com/" target="_blank" title="金惠科技">金惠科技</a>
                All rights reserved.</p>
        </div>
    </footer>
</div>
<!-- END WRAPPER -->

<!-- Javascript -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/klorofil-common.js"></script>
</body>
</html>
