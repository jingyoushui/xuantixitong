<%@ page language="java" contentType="text/html"
	import="dao.TeacherDao,entity.Teacher,java.util.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
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

<body>
	<div align="center">课题信息修改</div>
	<hr>
	<div align="center">
		<form action="upload.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="useraddtype" value="projectalter">
			<table border="2px" bordercolor="#1C7B75" class="t">
				<tr>
					<td>题号</td>
					<td><input type="text" name="proj_id" value="${proj.getProj_id()}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>课题名称</td>
					<td><input type="text" name="proj_name" value="${proj.getProj_name()}"></td>
				</tr>
				<tr>
					<td>类型</td>
					<td><input type="text" name="proj_type" value="${proj.getProj_type()}"></td>
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
					<td><input type="text" name="tea_id" required="" value="${proj.getTea_id()}"  readonly="readonly"></td>
				</tr>
				<tr>
					<td>状态</td>
					<td><select name="proj_zhuang" size=1 style="width: 200px;">
							<option value="0">未审核</option>
							<option value="1">审核通过</option>
							<option value="2">审核不通过</option>
						</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交" onclick=></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>