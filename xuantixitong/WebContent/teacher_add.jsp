<%@ page language="java" contentType="text/html"
	import="dao.TeacherDao,entity.Teacher,java.util.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
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
	$("#id").blur(function(){
		txt=$("#id").val();
		if(txt==""){
			$("#msg").css("color","red");
			$("#msg").text("题号不能为空！");
			$("#sub").attr('disabled',true); 
		}else{
			$.post("check.do",
					{type:"teaadd",id:txt},
					parseBackName2
				);
		}
		
		
	});
});
function parseBackName2(data){
	var flag=data;
	if(flag=="yes"){
		$("#msg").css("color","red");
		$("#msg").text("工号已存在！");
		$("#sub").attr('disabled',true); 
	}else if(flag=="no"){
		$("#msg").css("color","green");
		$("#msg").text("工号可用");
		$("#sub").attr('disabled',false);  
	}
}
$(function(){
	$("#pw2").blur(function(){
		pw1=$("#pw1").val();
		pw2=$("#pw2").val();
		if(pw1!=pw2){
			$("#msg2").css("color","red");
			$("#msg2").text("两次密码不一致");
			$("#sub").attr('disabled',true); 
			
		}else if(pw1==pw2){
			$("#msg2").css("color","green");
			$("#msg2").text("密码一致");
		    $("#sub").attr('disabled',false);  
		}
		
	});
});
</script>
<body>
	<div align="center">教师信息添加</div>
	<hr>
	<div align="center">
		<form action="add.do" method="post">
		<input type="hidden" name="useraddtype" value="teacher">
			<table border="2px" bordercolor="#1C7B75" class="t">
				<tr>
					<td>教师工号</td>
					<td><input type="text" name="tea_id" id="id"  placeholder="8位数字" required/><span id="msg"></span></td>
				</tr>
				<tr>
					<td>教师姓名</td>
					<td><input type="text" name="tea_name" required/></td>
				</tr>
				<tr>
					<td>教师性别</td>
					<td><select name="tea_sex" size=1 style="width: 200px;">
							<option value="男">男</option>
							<option value="女">女</option>
						</select></td>
				</tr>
				<tr>
					<td>联系方式</td>
					<td><input type="text" name="tea_phone" required/></td>
				</tr>
				<tr>
					<td>账号密码</td>
					<td><input type="password" id="pw1" name="tea_pwd1"   id="pw1" required/></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="password" id="pw2" name="tea_pwd2" id="pw2"><span id="msg2"></span></td>
				</tr>
				<tr>
					<td>主教课程</td>
					<td><input type="text" name="tea_lesson" required/></td>
				</tr>
				<tr>
					<td>所属专业</td>
					<td><select name="major_id" size=1 style="width: 200px;">
							<%
							for(int i=1;i<=5;i++){
								for(int j=1;j<=5;j++){
									out.print("<option value=00"+i+"00"+j+">00"+i+"00"+j+"</option>"); 
								}
							}
							
							
							%>
						</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交" id="sub"></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>