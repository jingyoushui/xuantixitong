<%@ page language="java" contentType="text/html"
	import="dao.StudentDao,entity.Student,java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div align="center">ѧ����Ϣ��ѯ</div>
	<hr>
	<div style="height: 30px;" align="center">
		<form action="select.do" method="post">
		<input type="hidden" name="selecttype" value="studentselect">
			ѧ�ţ�<input type="text" name="stu_id" value=${stu_id}> &nbsp ������<input type="text" name="stu_name" value=${stu_name}>
			&nbsp �༶��<input type="text" name="class_id" value=${class_id}>&nbsp רҵ��<input type="text" name="major_id" value=${major_id}> 
			&nbsp <input type="submit" value="��ѯ">
		</form>
	</div>
	<hr>
	<div align="center">
		<form>
			<table border="2" bordercolor="#1C7B75" style="width: 95%; text-align: center; ">
				<tr>
					<th>ѧ��</th>
					<th>����</th>
					<th>�绰</th>
					<th>�Ա�</th>
					<th>����</th>
					<th>��ͥסַ</th>
					<th>�༶</th>
					<th>רҵ</th>
					<th>����</th>
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
							
							<td><a href='add.do?type=studelete&stu_id=${cus.getStu_id()}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ɾ��`)==false)return false;'>ɾ��</a>
								<a href='add.do?type=stualert&stu_id=${cus.getStu_id()}' style='text-decoration:none;'  onclick='if(confirm(`�Ƿ��޸�`)==false)return false;'>&nbsp�޸�</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div><hr>
	<div align="center">
	${current}
	<a href="select.do?selecttype=studentselect&id=${current-1}"  style="text-decoration:none;" >��һҳ&nbsp&nbsp
	<a href="select.do?selecttype=studentselect&id=1" style="text-decoration:none;" >[1]&nbsp&nbsp</a><a href="select.do?selecttype=studentselect&id=2" style="text-decoration:none;">[2]&nbsp&nbsp</a>
	<a href="select.do?selecttype=studentselect&id=${current+1}" style="text-decoration:none;" >��һҳ&nbsp&nbsp
	</div>
	
</body>
</html>