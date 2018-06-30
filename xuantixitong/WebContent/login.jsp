<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>毕业设计选题系统</title>

<link type="text/css" href="./css/index.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
</head>
<%
if(request.getParameter("msg")!=null){
	String msg=request.getParameter("msg");
	pageContext.setAttribute("msg", msg);
}

%>

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
	
	<div class="wrapper" id="slider-wrapper">
		<div id="demo01" class="flexslider">
			<ul class="slides">
				<%
					String a[] = {"1", "2", "3", "4", "5", "6", "7", "8",};
					for (String i : a) {
						out.print("<li><img src='./image/index/" + i + ".jpg' height='348' width='1000' /></li> ");
					}
				%>
			</ul>
		</div>
		<script type="text/javascript" src="./js/slider.js"></script>
		<script type="text/javascript">
			$(function() {

				$('#demo01').flexslider({
					animation : "slide",
					direction : "horizontal",
					easing : "swing"
				});
			});
		</script>

	</div>

	<div class="cen">
		<div class="cenleft">
			<div class="deng"></div>
			<div class="deng1">
				<form action="login.do" method="post">
					<div class="login1">
						账号：<input type="text" name="uid">
					</div>
					<div class="login1">
						密码：<input type="password" name="pwd">
					</div>
					<div class="login1">
						类别： <select name="type" size=1>
							<option value="student">学生</option>
							<option value="teacher">教师</option>
						</select>
					</div>
					<div class="login1">
						<input type="submit" value="" class="login2"><span style="color:red;">${msg}</span>
					</div>
				</form>


			</div>
			<div class="deng2">
				<div class="d"></div>
				<span>校园风光</span>
			</div>

			<div style="padding-left:10px;padding-top:15px;">
			<iframe src='1.jsp' width='100%' height='220' ></iframe>
			</div>
	        


		</div>
		<div class="cenright">
			<div class="cenright-top">
				<a href="#">校园新闻</a>
			</div>
			<div class="cenright-cen"></div>
			<div class="cenright-cen1">
			<table>
			<c:forEach var="cus" items="${newslist}">
						<tr>
							<td style="width:75%;"><a href="news.do?type=newsdetail&id=${cus.getId()}">${cus.getId()}.${cus.getTitle()}</a></td>
							<td><a href="news.do?type=newsdetail&id=${cus.getId()}">${cus.getTime()}</a></td>
							</tr>
					</c:forEach>
			</table>
			</div>
			<div class="cenright-top">
				<a href="#">优秀论文</a>
			</div>
			<div class="cenright-cen">
			<div class="cenright-cen1">
			<table>
			<c:forEach var="cus" items="${newslist}">
						<tr>
							<td style="width:75%;"><a href="news.do?type=newsdetail&id=${cus.getId()}">${cus.getId()}.${cus.getTitle()}</a></td>
							<td><a href="news.do?type=newsdetail&id=${cus.getId()}">${cus.getTime()}</a></td>
							</tr>
					</c:forEach>
			</table>
			</div>
			</div>
			
		</div>



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


</html>