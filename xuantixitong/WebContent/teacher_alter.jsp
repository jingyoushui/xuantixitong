<%@ page language="java" contentType="text/html"
	import="dao.TeacherDao,entity.Teacher,java.util.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
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
	$("#pw2").blur(function(){
		pw1=$("#pw1").val();
		pw2=$("#pw2").val();
		if(pw1!=pw2){
			$("#msg2").css("color","red");
			$("#msg2").text("�������벻һ��");
			$("#sub").attr('disabled',true); 
			
		}else if(pw1==pw2){
			$("#msg2").css("color","green");
			$("#msg2").text("����һ��");
		    $("#sub").attr('disabled',false);  
		}
		
	});
});
</script>

<body>
	<div align="center">��ʦ��Ϣ�޸�</div>
	<hr>
	<div align="center">
		<form action="add.do" method="post">
		<input type="hidden" name="useraddtype" value="teacheralter">
			<table border="2px" bordercolor="#1C7B75" class="t">
				<tr>
					<td>��ʦ����</td>
					<td><input type="text" name="tea_id" value="${tea.getTea_id()}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>��ʦ����</td>
					<td><input type="text" name="tea_name" value="${tea.getTea_name()}"></td>
				</tr>
				<tr>
					<td>��ʦ�Ա�</td>
					<td><select name="tea_sex" size=1 style="width: 200px;">
							<option value="��">��</option>
							<option value="Ů">Ů</option>
						</select></td>
				</tr>
				<tr>
					<td>��ϵ��ʽ</td>
					<td><input type="text" name="tea_phone" value="${tea.getTea_phone()}"></td>
				</tr>
				<tr>
					<td>�˺�����</td>
					<td><input type="password" name="tea_pwd1" value="${tea.getTea_pwd()}"  id="pw1" required/></td>
				</tr>
				<tr>
					<td>ȷ������</td>
					<td><input type="password" name="tea_pwd2" id="pw2"><span id="msg2"></span></td>
				</tr>
				<tr>
					<td>���̿γ�</td>
					<td><input type="text" name="tea_lesson" value="${tea.getTea_lesson()}"></td>
				</tr>
				<tr>
					<td>����רҵ</td>
					<td><select name="major_id" size=1 style="width: 200px;">
							<%
							for(int i=1;i<=5;i++){
								for(int j=1;j<=5;j++){
									out.print("<option value=00"+i+"00"+j+">00"+i+"00"+j+"</option>"); 
								}
							}
							
							
							%>
						</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="�ύ" id="sub"></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>