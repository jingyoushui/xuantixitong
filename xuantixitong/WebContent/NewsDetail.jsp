<%@ page language="java" contentType="text/html"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��ҵ���ѡ��ϵͳ</title>

<link type="text/css" href="./css/index.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
</head>
<body>
<div id="header" class="wrapper">
		<div class="inner">
			<div id="head" class="head">
				<div class="logo">
					<a href="#" title="�Ϻ�����ѧԺ��ҵѡ��ϵͳ"></a>
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
					<li><a href="news.do">��վ��ҳ</a></li>
					<li><a href="#">ѧУ�ſ�</a></li>
					<li><a href="#">�˲�����</a></li>
					<li><a href="#">ʦ�ʶ���</a></li>
					<li><a href="#">ѧ���о�</a></li>
					<li><a href="#">��������</a></li>
					<li><a href="#">��������</a></li>
					<li><a href="admin.jsp">��̨����</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="cen1">
		<div style="width:100%;height:80px;">
			<div style="text-align:center;padding-top:20px;font-family:microsoft yahei;color:gray; font-size:20px;">${newsdetail.getTitle()}</div>
			<div style="float:right;padding-right:30px;margin-top:20px;font-size:10px;color:green;">�����ߣ�${newsdetail.getWriter()} &nbsp;����ʱ�䣺${newsdetail.getTime()} </div>
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
				<a>��վ��ҳ</a> | <a>ѧУ�ſ�</a> | <a>�˲�����</a> | <a>ʦ�ʶ���</a> | <a>ѧ���о�</a>|
				<a>��������</a> | <a>��������</a>
			</p>
			<p>��Ȩ���У��Ϻ�����ѧԺ|�����ѧԺ|2015055��������|Welcome to
				http://www.lixing421.sc2yun.com</p>
		</div>
	</div>
</body>
</html>