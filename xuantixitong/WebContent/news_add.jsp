<%@ page language="java" contentType="text/html"
	 pageEncoding="gbk"%>
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
	<div align="center">վ���������</div>
	<hr>
	<div align="center">
		<form action="news.do" method="post">
		<input type="hidden" name="type" value="news">
		<input type="hidden" name="writer" value=${uid}>
			<table border="2px" bordercolor="#1C7B75" class="t">
				<tr>
					<td>���ű���</td>
					<td><input type="text" name="title" style="width:500px;height:30px;" required/></td>
				</tr>
				<tr>
					<td>��������</td>
					<td><textarea rows="15" cols="80" name="detail"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="�ύ" onclick=></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>