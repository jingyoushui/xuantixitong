<%@ page language="java" contentType="text/html"
	import="dao.ViewSelectDao,entity.ViewSelect,java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div align="center">ѡ�����</div>
	<hr>
	<div style="height: 30px;" align="center">
		<form action="../view.do" method="post">
		<input type="hidden" name="selecttype" value="viewselect">
		<input type="hidden" name="select" value="stuview">
		<input type="hidden" name="stu_id" value=${uid}> <input type="hidden" name="class_id" >
			��ʦ���ţ�<input type="text" name="tea_id" value="${tea_id}">&nbsp �����ţ�<input type="text" name="proj_id" value=${proj_id}> 
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
					<th>�༶</th>
					<th>רҵ</th>
					<th>ѧԺ</th>
					
					<th>���</th>
					<th>��������</th>
					<th>ָ����ʦ</th>
					<th>����</th>
					<th>�Ѷ�</th>
					
					<th>־Ը</th>
					<th>״̬</th>
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
							<td>${cus.getProj_grade()}</td>
							<td>${cus.getZhiyuan()}</td>
							<td>${cus.getIs_pass()}</td>
							<!-- <td><a href='../selproj.do?type=del&proj_id=${cus.getProj_id()}&stu_id=${uid}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ɾ��`)==false)return false;'>ɾ��</a>
							</td> -->
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div><hr>
	<div align="center">���ͨ��</div>
	<div align="center">
		<form>
			<table border="2" bordercolor="#1C7B75" style="width: 95%; text-align: center; ">
				<tr>
					<th>ѧ��</th>
					<th>����</th>
					<th>�༶</th>
					<th>רҵ</th>
					<th>ѧԺ</th>
					
					<th>���</th>
					<th>��������</th>
					<th>ָ����ʦ</th>
					<th>����</th>
					<th>�Ѷ�</th>
				</tr>
				<tbody>
					<c:forEach var="cus" items="${selproj2}">
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
							<td>${cus.getProj_grade()}</td>
							<!-- <td><a href='../selproj.do?type=del&proj_id=${cus.getProj_id()}&stu_id=${uid}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ɾ��`)==false)return false;'>ɾ��</a>
							</td> -->
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div><hr>
	
	<div align="center">
	${current}
	<a href="../view.do?select=stuview&id=${current-1}" style="text-decoration:none;" >��һҳ&nbsp&nbsp
	<a href="../view.do?select=stuview&id=1" style="text-decoration:none;" >[1]&nbsp&nbsp</a><a href="../view.do?select=stuview&id=2" style="text-decoration:none;">[2]&nbsp&nbsp</a>
	<a href="../view.do?select=stuview&id=${current+1}" style="text-decoration:none;" >��һҳ&nbsp&nbsp
	</div>
	
</body>
</html>