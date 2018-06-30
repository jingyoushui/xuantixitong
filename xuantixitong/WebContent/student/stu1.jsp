<%@ page language="java" contentType="text/html"
	import="dao.TeacherDao,entity.Teacher,java.util.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="../js/jquery.min.js"></script>
</head>
<style type="text/css">
.t{
	width: 95%; 
	text-align: center;
}
.t tr{
	height:40px;
}
.t td input{
	width:200px;
}
<

</style>

<script type="text/javascript">
$(function(){
	$("#pw2").blur(function(){
		pw1=$("#pw1").val();
		pw2=$("#pw2").val();
		if(pw1!=pw2){
			$("#msg").css("color","red");
			$("#msg").text("两次密码不一致");
			$("#sub").attr('disabled',true); 
			
		}else if(pw1==pw2){
			$("#msg").css("color","green");
			$("#msg").text("密码一致");
		    $("#sub").attr('disabled',false);  
		}
		
	});
});


function getSelectValue(name){
	var obj=document.getElementById(name);
	return obj.value;
}
</script>
<body>
	<div align="center">个人信息管理</div>
	<hr>
	<div align="center">
		<form action="../add.do" method="post">
		 <input type="hidden" name="useraddtype" value="studentalter">
		 <input type="hidden" name="alter" value="stu1">
			<table border="2px" bordercolor="#1C7B75" class="t">
				<tr>
					<td>学生学号</td>
					<td><input type="text" name="stu_id" value="${stu.getStu_id()}" readonly="readonly" ></td>
				</tr>
				<tr>
					<td>学生姓名</td>
					<td><input type="text" name="stu_name" value="${stu.getStu_name()}"></td>
				</tr>
				<tr>
					<td>联系方式</td>
					<td><input type="text" name="stu_phone" value="${stu.getStu_phone()}"/></td>
				</tr>
				<tr>
					<td>学生性别</td>
					<td><select name="stu_sex" size=1 style="width: 200px;">
							<option value="男">男</option>
							<option value="女">女</option>
						</select></td>
				</tr>
				
					<td>账号密码</td>
					<td><input type="password" id="pw1" name="stu_pwd1" value="${stu.getStu_pwd()}" id="pw1" required/></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="password" id="pw2" name="stu_pwd2" id="pw2"><span id="msg"></span></td>
				</tr>
				<tr>
					<td>家庭住址</td>
					<td><input type="text" name="stu_address" value="${stu.getStu_address()}"/></td>
				</tr>
			<tr>
					<td>所属专业</td>
					<td><select id="major_id" name="major_id" size=1 style="width: 200px;" onchange=alert(getSelectValue('major_id'));>
							<%
							for(int i=1;i<=5;i++){
								for(int j=1;j<=5;j++){
									out.print("<option value=00"+i+"00"+j+">00"+i+"00"+j+"</option>"); 
								}
							}
							
							
							%>
						</select></td>
				<tr>
					<td>所属班级</td>
					<td><select name="class_id" id="class_id"  size=1 style="width: 200px;">
						<script>
						
							for(var i=1;i<=5;i++){
								document.write("<option value="+getSelectValue('major_id')+"00"+i+">"+getSelectValue('major_id')+"00"+i+"</option>")
							}
							
						</script>
						</select></td>
				</tr>
				</tr>
				
				<tr>
					<td colspan="2"><input type="submit" value="提交" onclick=></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>