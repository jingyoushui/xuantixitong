<!--��Ҫɾ������ע��-->
<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��̨����</title>
<link type="text/css" href="./css/admin.css" rel="stylesheet" />
</head>
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<script type="text/javascript">
	 function reload(){
		document.getElementById("image").src="<%=request.getContextPath() %>/imageServlet?date="+new Date().getTime();
		$("#checkcode").val("");   // ����֤�����
	} 
	 
	 function verificationcode(){
		 var text=$.trim($("#checkcode").val());
		 $.post("${pageContext.request.contextPath}/verificationServlet",{op:text},function(data){
			 data=parseInt($.trim(data));
			 if(data>0){
				 $("#span").text("��֤�ɹ�!").css("color","black");
			 }else{
				 $("#span").text("��֤ʧ��!").css("color","red");
				 reload();  //��֤ʧ�ܺ���Ҫ������֤��
			 }
		 });
		 $("#checkcode").val(""); // ����֤�����
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
		<div class="cen1">��ҵ���ѡ��ϵͳ</div>
		<div class="cen2">
			<form action="login.do" method="post">
				<input type="hidden" name="type" value="admin">
				<div class="login1">����Ա��½</div>
				<div class="login1">
					�˺ţ�<input type="text" name="uid">
				</div>
				<div class="login1">
					���룺<input type="password" name="pwd">
				</div>
				<div class="login1">
					��֤�룺<input type="text" name="op" id="checkcode" style="width: 50px;"/>
					<img  src="<%=request.getContextPath() %>/imageServlet" alt="��֤��" id="image" />
					<br><a href="javascript:reload();"><label>��һ��</label></a><span id="span"></span>
				</div>
				<div class="login1">
					<input type="submit" value="" class="login2" onclick="javascript:verificationcode()"><span style="color:red;">${msg}</span>
				</div>
				
			</form>
		</div>
	</div>

</body>
</html>