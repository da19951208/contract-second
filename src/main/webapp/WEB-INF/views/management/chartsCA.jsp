<%--
  Created by IntelliJ IDEA.
  User: Da
  Date: 2018/11/14
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ChartsCA</title>
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
                    <li><a href="${pageContext.request.contextPath}/compact/index" class=""><i class="lnr lnr-home"></i> <span>Index</span></a></li>
                    <%--表格--%>
                    <li><a href="${pageContext.request.contextPath}/compact/List" class=""><i class="lnr lnr-dice"></i> <span>Tables</span></a></li>
                    <%--图标--%>
                    <li>
                        <a href="#subCharts" data-toggle="collapse" class="collapsed"><i class="lnr lnr-chart-bars"></i>
                            <span>Charts</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subCharts" class="collapse ">
                            <ul class="nav">
                                <li><a href="${pageContext.request.contextPath}/echarts/checkCA" class="active">合同总额</a></li>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">CA Chart</h3>
                            </div>
                            <div class="panel-body">
                                <!-- 显示Echarts图表 -->
                                <div style="height:400px;min-height:100px;margin:0 auto;" id="CA"></div>
                            </div>
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
<script src="${pageContext.request.contextPath}/static/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/klorofil-common.js"></script>
<!-- ECharts 核心 JS 文件 -->
<script src="${pageContext.request.contextPath}/static/js/echarts.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function() {
        //初始化echarts实例
        var CAChart = echarts.init(document.getElementById('CA'));

        // 指定图表的配置项和数据
        var option = {
            // 指定图表的配置项和数据
            title: {
                text: '合同总金额'     //图表标题
            },

            tooltip: {
                trigger: 'axis',   //坐标轴触发提示框，多用于柱状、折线图中
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },

            dataZoom: [
                {
                    type: 'slider',	    //支持鼠标滚轮缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100,
                    handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                    handleSize: '80%',
                    show:true
                },
                {
                    type: 'inside',	    //支持单独的滑动条缩放
                    start: 0,			//默认数据初始缩放范围为10%到90%
                    end: 100,
                }
            ],

            color:[
                '#3398DB',	//颜色
            ],

            toolbox: {      //工具栏
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },

            xAxis : [   //X轴
                {
                    type : 'category',
                    data : [],  //先设置数据值为空，后面用Ajax获取动态数据填入
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis : [   //Y轴
                {
                    type : 'value',
                    name : '合同总额',
                    axisLabel : {
                        formatter: '{value} ¥'	//控制输出格式
                    }
                }
            ],
            series : [  //系列（内容）列表
                {
                    name:'合同额',
                    type:'bar',     //柱状图表示
                    barWidth: '40%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data:[]     //数据值通过Ajax动态获取
                }
            ]
        };
        CAChart.showLoading();  //数据加载完之前先显示一段简单的loading动画

        var sale_persons = [];
        var contract_amounts = [];    //合同额（存放服务器返回的合同额）

        $.ajax({	//使用JQuery内置的Ajax方法
            type : "post",		//post请求方式
            async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : "${pageContext.request.contextPath}/echarts/recordCA",	//请求发送到ShowInfoIndexServlet处
            dataType : "json",		//返回数据形式为json

            success : function(result) {
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result != null && result.length > 0) {
                    for(var i=0;i<result.length;i++){

                        sale_persons.push(result[i].salePerson);//挨个取出合同额等值并填入前面声明的合同等数组
                        contract_amounts.push(result[i].contractAmount);
                    }
                    CAChart.hideLoading();	//隐藏加载动画

                    CAChart.setOption({		//载入数据
                        xAxis: {
                            data: sale_persons	//填入X轴数据
                        },
                        series: [	//填入系列（内容）数据
                            {
                                // 根据名字对应到相应的系列
                                name: '合同额',
                                data: contract_amounts
                            },
                        ]
                    });

                }
                else {
                    //返回的数据为空时显示提示信息
                    alert("图表请求数据为空，可能服务器暂未录入合同，您可以稍后再试！");
                    CAChart.hideLoading();
                }

            },
            error : function(errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败，可能是服务器开小差了");
                CAChart.hideLoading();
            }
        })

        CAChart.setOption(option);	//载入图表

    });
</script>
</body>
</html>
