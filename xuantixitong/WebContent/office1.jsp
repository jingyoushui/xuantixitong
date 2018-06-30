<%@ page language="java" contentType="text/html"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div align="center">个人信息管理</div>
	<hr>
<div align="center">
<form>
	<table border="2px" bordercolor="#1C7B75" style="width: 95%; text-align: center; ">
		<tr>
			<th>用户ID</th><th>密码</th><th>所属学院</th><th>修改</th>
		</tr>
		<tr>
			<td>${uid}</td><td><input type="text" name="pwd" value="${pwd}"></td><td>${college}</td><td><input type="button" value="提交"></td>
		</tr>
	</table>
</form>
</div><hr>
</body>
</html>