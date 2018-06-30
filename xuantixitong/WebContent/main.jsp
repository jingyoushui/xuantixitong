<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>毕业设计选题系统</title>

<link type="text/css" href="./css/main.css" rel="stylesheet" />
</head>
<body>

	<div class="top">
		<div class="top1"></div>
		<div class="top2"></div>
		<div class="top3"></div>
	</div>
	<div class="left"></div>

	<div class="cen">
		<div>
			<div class="cen-top"></div>
		 <div class="cen-top1">
				当前登录用户：${uid} &nbsp  用户类型：${type}  &nbsp 所属学院：${college}<span class="s"><img
					alt="" src="./image/main/top_2.gif"> <a href="login.jsp">首页</a>&nbsp
					&nbsp <img alt="" src="./image/main/top_7.gif"> <a
					href="login.jsp">退出</a> </span>
			</div>
			<div class="cen-top2"></div>
		</div>
		<div class='cen3'>
			<%
				if (session.getAttribute("type").equals("admin")) {
					out.print("<iframe src='test.jsp' width='100%' height='460' ></iframe>");
				} else if (session.getAttribute("type").equals("teacher")) {
					out.print("<iframe src='test2.jsp' width='100%' height='460' ></iframe>");

				} else if (session.getAttribute("type").equals("student")) {
					out.print("<iframe src='test3.jsp' width='100%' height='460' ></iframe>");
				}
			%>
		</div>
	</div>
	<div class="right"></div>

	<div class="footer">
		<div class="footer1"></div>
		<div class="footer2"></div>
		<div class="footer3"></div>
	</div>
</body>
</html>