<%@ page language="java" contentType="text/html"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>毕业设计选题系统</title>

<link type="text/css" href="./css/index.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
</head>
<body>
<div id="header" class="wrapper">
		<div class="inner">
			<div id="head" class="head">
				<div class="logo">
					<a href="#" title="上海电力学院毕业选题系统"></a>
				</div>
				<div class="cen1_right">
					<div id="hoverclock" style="margin-top: 10px; margin-left: 35px;"></div>
					<link rel="stylesheet"
						href="http://hovertree.com/texiao/hoverclock/inc/jquery.hoverclock.css"
						media="screen" type="text/css" />
					<script
						src="http://hovertree.com/ziyuan/jquery/jquery-2.1.4.min.js"></script>
					<script
						src="http://hovertree.com/texiao/hoverclock/inc/jquery.hoverclock.js"></script>
					<script>
						$(function() {
							$("#hoverclock").hoverclock({
								"h_height" : "90",
								"h_width" : "90",
								"h_backColor" : "",
								"h_radius" : "50%",
								"h_linkText" : ""
							});
						})
					</script>

				</div>
			</div>
		</div>
	</div>
	<div class="wrapper" id="nav">
		<div class="inner">
			<div class="nav">

				<ul>
					<li><a href="news.do">网站首页</a></li>
					<li><a href="#">学校概况</a></li>
					<li><a href="#">人才培养</a></li>
					<li><a href="#">师资队伍</a></li>
					<li><a href="#">学术研究</a></li>
					<li><a href="#">优秀论文</a></li>
					<li><a href="#">关于我们</a></li>
					<li><a href="admin.jsp">后台管理</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="cen1">
		<div style="width:100%;height:80px;">
			<div style="text-align:center;padding-top:20px;font-family:microsoft yahei;color:gray; font-size:20px;">${newsdetail.getTitle()}</div>
			<div style="float:right;padding-right:30px;margin-top:20px;font-size:10px;color:green;">发布者：${newsdetail.getWriter()} &nbsp;发布时间：${newsdetail.getTime()} </div>
		</div>
		<table>
			<tr>
		<td style="width:10%;"> </td>
	
		<td style="line-height:40px">
		${newsdetail.getDetail()}
		</td>
		<td style="width:10%;"> </td>
		</tr>
	    </table>
	</div>
	<div id="footer">
		<div class="conent_bq">
			<p>
				<a>网站首页</a> | <a>学校概况</a> | <a>人才培养</a> | <a>师资队伍</a> | <a>学术研究</a>|
				<a>优秀论文</a> | <a>在线留言</a>
			</p>
			<p>版权所有：上海电力学院|计算机学院|2015055班李行行|Welcome to
				http://www.lixing421.sc2yun.com</p>
		</div>
	</div>
</body>
</html>