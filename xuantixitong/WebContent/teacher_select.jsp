<%@ page language="java" contentType="text/html"
	import="dao.TeacherDao,entity.Teacher,java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">��ʦ��Ϣ��ѯ</div>
	<hr>
	<div style="height: 30px;" align="center">
		<form action="select.do" method="post">
		<input type="hidden" name="selecttype" value="teacherselect">
			��ʦ���ţ�<input type="text" name="tea_id" value=${tea_id}> &nbsp ��ʦ������<input type="text" name="tea_name" value=${tea_name}>
			&nbsp ���̿γ̣�<input type="text" name="tea_lesson" value=${tea_lesson}> &nbsp ����רҵ��<input type="text" name="major_id" value=${major_id}>
			&nbsp <input type="submit" value="��ѯ">
		</form>
	</div>
	<hr>
	<div align="center">
		<form>
			<table border="2" bordercolor="#1C7B75" style="width: 95%; text-align: center; ">
				<tr>
					<th>�û�ID</th>
					<th>�û���</th>
					<th>�Ա�</th>
					<th>�绰</th>
					<th>����</th>
					<th>���̿γ�</th>
					<th>רҵ</th>
					<th>����</th>
				</tr>
				<tbody>
				<c:forEach var="cus" items="${clist}">
					
						<tr>
							<td>${cus.getTea_id()}</td>
							<td>${cus.getTea_name()}</td>
							<td>${cus.getTea_sex()}</td>
							<td>${cus.getTea_phone()}</td>
							<td>${cus.getTea_pwd()}</td>
							<td>${cus.getTea_lesson()}</td>
							<td>${cus.getMajor_id()}</td>
						
							<td><a href='add.do?type=teadelete&tea_id=${cus.getTea_id()}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ɾ��`)==false)return false;'>ɾ��</a>
							<a href='add.do?type=teaalert&tea_id=${cus.getTea_id()}' style='text-decoration:none;'  onclick='if(confirm(`�Ƿ��޸�`)==false)return false;'>&nbsp�޸�</a>
							</td>
						</tr>
						 
					
				</c:forEach>
				</tbody>
			</table>
		</form>
	</div><hr>
	<div align="center">
	${current}
	<a href="select.do?selecttype=teacherselect&id=${current-1}" style="text-decoration:none;" >��һҳ&nbsp&nbsp
	<a href="select.do?selecttype=teacherselect&id=1" style="text-decoration:none;" >[1]&nbsp&nbsp</a><a href="select.do?selecttype=teacherselect&id=2" style="text-decoration:none;">[2]&nbsp&nbsp</a>
	<a href="select.do?selecttype=teacherselect&id=${current+1}" style="text-decoration:none;" >��һҳ&nbsp&nbsp
	</div>
	
</body>
</html>