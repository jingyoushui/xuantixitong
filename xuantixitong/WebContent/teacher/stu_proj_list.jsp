<%@ page language="java" contentType="text/html"
	import="dao.ViewSelectDao,entity.ViewSelect,java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div align="center">选题管理</div>
	<hr>
	<div style="height: 30px;" align="center">
		<form action="../view.do" method="post">
		<input type="hidden" name="selecttype" value="viewselect">
		<input type="hidden" name="select" value="view">
			学号：<input type="text" name="stu_id" value=${stu_id}> &nbsp 班级：<input type="text" name="class_id" value=${class_id}>
			<input type="hidden" name="tea_id" value="${uid}">&nbsp 课题编号：<input type="text" name="proj_id" value=${proj_id}> 
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
					<th>班级</th>
					<th>专业</th>
					<th>学院</th>
					
					<th>题号</th>
					<th>课题名称</th>
					<th>指导老师</th>
					<th>类型</th>
					<th>难度</th>
					<th>志愿</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<tbody>
					<c:forEach var="cus" items="${selproj}">
						<tr>
							<td>${cus.getStu_id()}</td>
							<td>${cus.getStu_name()}</td>
							<td>${cus.getClass_id()}</td>
							<td>${cus.getMajor_name()}</td>
							<td>${cus.getCollege_name()}</td>
							<td>${cus.getProj_id()}</td>
							<td>${cus.getProj_name()}</td>
							<td>${cus.getTea_id()}</td>
							<td>${cus.getProj_type()}</td>
							<td>${cus.getProj_type()}</td>
							<td>${cus.getZhiyuan()}</td>
							<td>${cus.getIs_pass()}</td>
							<td>
							<a href='../selproj.do?type=sel_topic&proj_id=${cus.getProj_id()}&stu_id=${cus.getStu_id()}&zhiyuan=${cus.getZhiyuan()}' style='text-decoration:none;'onclick='if(confirm(`是否通过`)==false)return false;'>通过</a>
							<a href='../selproj.do?type=sel_topic2&proj_id=${cus.getProj_id()}&stu_id=${cus.getStu_id()}&zhiyuan=${cus.getZhiyuan()}' style='text-decoration:none;'onclick='if(confirm(`是否通过`)==false)return false;'>不通过</a>
							</td>
					  </tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div><hr>
	<div align="center">
	${current}
	<a href="../view.do?select=view&id=${current-1}" style="text-decoration:none;" >上一页&nbsp&nbsp
	<a href="../view.do?select=view&&id=1" style="text-decoration:none;" >[1]&nbsp&nbsp</a><a href="../view.do?select=view&&id=2" style="text-decoration:none;">[2]&nbsp&nbsp</a>
	<a href="../view.do?select=view&&id=${current+1}" style="text-decoration:none;" >下一页&nbsp&nbsp
	</div>
	
</body>
</html>