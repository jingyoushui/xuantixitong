<%@ page language="java" contentType="text/html"
	import="dao.StudentDao,entity.Student,java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div align="center">学生信息查询</div>
	<hr>
	<div style="height: 30px;" align="center">
		<form action="select.do" method="post">
		<input type="hidden" name="selecttype" value="studentselect">
			学号：<input type="text" name="stu_id" value=${stu_id}> &nbsp 姓名：<input type="text" name="stu_name" value=${stu_name}>
			&nbsp 班级：<input type="text" name="class_id" value=${class_id}>&nbsp 专业：<input type="text" name="major_id" value=${major_id}> 
			&nbsp <input type="submit" value="查询">
		</form>
	</div>
	<hr>
	<div align="center">
		<form>
			<table border="2" bordercolor="#1C7B75" style="width: 95%; text-align: center; ">
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>电话</th>
					<th>性别</th>
					<th>密码</th>
					<th>家庭住址</th>
					<th>班级</th>
					<th>专业</th>
					<th>操作</th>
				</tr>
				<tbody>
					<c:forEach var="cus" items="${clist2}">
						<tr>
							<td>${cus.getStu_id()}</td>
							<td>${cus.getStu_name()}</td>
							<td>${cus.getStu_phone()}</td>
							<td>${cus.getStu_sex()}</td>
							<td>${cus.getStu_pwd()}</td>
							<td>${cus.getStu_address()}</td>
							<td>${cus.getClass_id()}</td>
							<td>${cus.getMajor_id()}</td>
							
							<td><a href='add.do?type=studelete&stu_id=${cus.getStu_id()}' style='text-decoration:none;'onclick='if(confirm(`是否删除`)==false)return false;'>删除</a>
								<a href='add.do?type=stualert&stu_id=${cus.getStu_id()}' style='text-decoration:none;'  onclick='if(confirm(`是否修改`)==false)return false;'>&nbsp修改</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div><hr>
	<div align="center">
	${current}
	<a href="select.do?selecttype=studentselect&id=${current-1}"  style="text-decoration:none;" >上一页&nbsp&nbsp
	<a href="select.do?selecttype=studentselect&id=1" style="text-decoration:none;" >[1]&nbsp&nbsp</a><a href="select.do?selecttype=studentselect&id=2" style="text-decoration:none;">[2]&nbsp&nbsp</a>
	<a href="select.do?selecttype=studentselect&id=${current+1}" style="text-decoration:none;" >下一页&nbsp&nbsp
	</div>
	
</body>
</html>