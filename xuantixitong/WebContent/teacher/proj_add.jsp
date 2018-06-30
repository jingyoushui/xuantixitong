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
			$.post("../check.do",
					{type:"projadd",id:txt},
					parseBackName
				);
		}
		
		
	});
});
function parseBackName(data){
	var flag=data;
	if(flag=="yes"){
		$("#msg").css("color","red");
		$("#msg").text("题号已存在！");
		$("#sub").attr('disabled',true); 
	}else if(flag=="no"){
		$("#msg").css("color","green");
		$("#msg").text("题号可用");
		$("#sub").attr('disabled',false);  
	}
}
</script>
<body>
	<div align="center">添加课题信息</div>
	<hr>
	<div align="center">
		<form action="../upload.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="useraddtype" value="projectadd">
			<table border="2px" bordercolor="#1C7B75" class="t">
				<tr>
					<td>题号</td>
					<td><input type="text" name="proj_id" id="id" placeholder="4位数字" required><span id="msg"></span></td>
				</tr>
				<tr>
					<td>课题名称</td>
					<td><input type="text" name="proj_name" ></td>
				</tr>
				<tr>
					<td>类型</td>
					<td><input type="text" name="proj_type" ></td>
				</tr>
				<tr>
					<td>难度</td>
					<td><select name="proj_grade" size=1 style="width: 200px;">
							<option value="简单">简单</option>
							<option value="中等">中等</option>
							<option value="困难">困难</option>
						</select></td>
				</tr>
				
					<td>课题文件</td>
					<td><input type="file"  id="file" name="proj_accessory" ></td>
				</tr>
				<tr>
					<td>老师工号</td>
					<td><input type="text" name="tea_id"  value="${tea.getTea_id()}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>状态</td>
					<td><select name="proj_zhuang" size=1 style="width: 200px;" disabled="true">
							<option value="0">未审核</option>
							<option value="1">审核通过</option>
							<option value="2">审核不通过</option>
						</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交" id="sub"></td>
				</tr>
			</table>

		</form>
		 ${msg}
	</div>

</body>
</html>