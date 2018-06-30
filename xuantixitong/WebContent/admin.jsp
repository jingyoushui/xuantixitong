<!--不要删除这条注释-->
<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理</title>
<link type="text/css" href="./css/admin.css" rel="stylesheet" />
</head>
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<script type="text/javascript">
	 function reload(){
		document.getElementById("image").src="<%=request.getContextPath() %>/imageServlet?date="+new Date().getTime();
		$("#checkcode").val("");   // 将验证码清空
	} 
	 
	 function verificationcode(){
		 var text=$.trim($("#checkcode").val());
		 $.post("${pageContext.request.contextPath}/verificationServlet",{op:text},function(data){
			 data=parseInt($.trim(data));
			 if(data>0){
				 $("#span").text("验证成功!").css("color","black");
			 }else{
				 $("#span").text("验证失败!").css("color","red");
				 reload();  //验证失败后需要更换验证码
			 }
		 });
		 $("#checkcode").val(""); // 将验证码清空
	 }
</script>
<%
if(request.getParameter("msg")!=null){
	String msg=request.getParameter("msg");
	pageContext.setAttribute("msg", msg);
}

%>
<body>
	<div class="cen">
		<div class="cen1">毕业设计选题系统</div>
		<div class="cen2">
			<form action="login.do" method="post">
				<input type="hidden" name="type" value="admin">
				<div class="login1">管理员登陆</div>
				<div class="login1">
					账号：<input type="text" name="uid">
				</div>
				<div class="login1">
					密码：<input type="password" name="pwd">
				</div>
				<div class="login1">
					验证码：<input type="text" name="op" id="checkcode" style="width: 50px;"/>
					<img  src="<%=request.getContextPath() %>/imageServlet" alt="验证码" id="image" />
					<br><a href="javascript:reload();"><label>换一张</label></a><span id="span"></span>
				</div>
				<div class="login1">
					<input type="submit" value="" class="login2" onclick="javascript:verificationcode()"><span style="color:red;">${msg}</span>
				</div>
				
			</form>
		</div>
	</div>

</body>
</html>