<%@ page language="java" contentType="text/html"
	import="dao.ProjectDao,entity.Proj_Info,java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div align="center">���Կ������</div>
	<hr>
	<div style="height: 30px;" align="center">
		<form action="select.do" method="post">
		<input type="hidden" name="selecttype" value="projectselect">
		<input type="hidden" name="selectpage" value="projectall">
		
			�����ţ�<input type="text" name="proj_id" value=${proj_id}> &nbsp �������ף�<input type="text" name="proj_grade" value=${proj_grade}>
			&nbsp ��ʦ��ţ�<input type="text" name="tea_id" value=${tea_id}>&nbsp �������ͣ�<input type="text" name="proj_type" value=${proj_type}> 
			&nbsp <input type="submit" value="��ѯ">
		</form>
	</div>
	<hr>
	<div align="center">
		<form>
			<table border="2" bordercolor="#1C7B75" style="width: 95%; text-align: center; ">
				<tr>
					<th>���</th>
					<th>��������</th>
					<th>����</th>
					<th>�Ѷ�</th>
					<th>�����ļ�</th>
					<th>��ʦ����</th>
					<th>״̬</th>
					<th>����</th>
				</tr>
				<tbody>
					<c:forEach var="cus" items="${clist3}">
						<tr>
							<td>${cus.getProj_id()}</td>
							<td>${cus.getProj_name()}</td>
							<td>${cus.getProj_type()}</td>
							<td>${cus.getProj_grade()}</td>
							<td><a href="upload.do?&file=${cus.getProj_accessory()}">����</a></td>
							<td>${cus.getTea_id()}</td>
							<td>${cus.getProj_zhuang()}</td>
							
						
							<td><a href='add.do?type=projdelete&proj_id=${cus.getProj_id()}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ɾ��`)==false)return false;'>ɾ��</a>
								<a href='add.do?type=projalert&proj_id=${cus.getProj_id()}' style='text-decoration:none;'  onclick='if(confirm(`�Ƿ��޸�`)==false)return false;'>&nbsp�޸�</a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</form>
	</div><hr>
	<div align="center">
	${current}
	<a href="select.do?selectpage=projectall&selecttype=projectselect&id=${current-1}" style="text-decoration:none;" >��һҳ&nbsp&nbsp
	<a href="select.do?selectpage=projectall&selecttype=projectselect&id=1" style="text-decoration:none;" >[1]&nbsp&nbsp</a><a href="select.do?selectpage=projectall&selecttype=projectselect&id=2" style="text-decoration:none;">[2]&nbsp&nbsp</a>
	<a href="select.do?selectpage=projectall&selecttype=projectselect&id=${current+1}" style="text-decoration:none;" >��һҳ&nbsp&nbsp
	</div>
	
</body>
</html>