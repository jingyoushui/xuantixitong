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
<

</style>
<script type="text/javascript">
$(function(){
	$("#id").blur(function(){
		txt=$("#id").val();
		if(txt==""){
			$("#msg").css("color","red");
			$("#msg").text("��Ų���Ϊ�գ�");
			$("#sub").attr('disabled',true); 
		}else{
			$.post("check.do",
					{type:"stuadd",id:txt},
					parseBackName
				);
		}
		
		
	});
});
function parseBackName(data){
	var flag=data;
	if(flag=="yes"){
		$("#msg").css("color","red");
		$("#msg").text("ѧ���Ѵ��ڣ�");
		$("#sub").attr('disabled',true); 
	}else if(flag=="no"){
		$("#msg").css("color","green");
		$("#msg").text("ѧ�ſ���");
		$("#sub").attr('disabled',false);  
	}
}
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
	<div align="center">ѧ����Ϣ���</div>
	<hr>
	<div align="center">
		<form action="add.do" method="post">
		<input type="hidden" name="useraddtype" value="student">
			<table border="2px" bordercolor="#1C7B75" class="t">
				<tr>
					<td>ѧ��ѧ��</td>
					<td><input type="text" name="stu_id" id="id"  placeholder="8λ����" required/><span id="msg"></span></td>
				</tr>
				<tr>
					<td>ѧ������</td>
					<td><input type="text" name="stu_name" required/></td>
				</tr>
				<tr>
					<td>��ϵ��ʽ</td>
					<td><input type="text" name="stu_phone" required/></td>
				</tr>
				<tr>
					<td>ѧ���Ա�</td>
					<td><select name="stu_sex" size=1 style="width: 200px;">
							<option value="��">��</option>
							<option value="Ů">Ů</option>
						</select></td>
				</tr>
				
					<td>�˺�����</td>
					<td><input type="password" id="pw1" name="stu_pwd1"  id="pw1" required/></td>
				</tr>
				<tr>
					<td>ȷ������</td>
					<td><input type="password" id="pw2" name="stu_pwd2" id="pw2"><span id="msg2"></span></td>
				</tr>
				<tr>
					<td>��ͥסַ</td>
					<td><input type="text" name="stu_address" required/></td>
				</tr>
				<tr>
					<td>����רҵ</td>
					<td><select id="major_id" name="major_id" size=1 style="width: 200px;" onchange=alert(getSelectValue('major_id'));>
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
					<td>�����༶</td>
					<td><select name="class_id" id="class_id"  size=1 style="width: 200px;">
						<script>
						
							for(var i=1;i<=5;i++){
								document.write("<option value="+getSelectValue('major_id')+"00"+i+">"+getSelectValue('major_id')+"00"+i+"</option>");
							}
							
						</script>
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