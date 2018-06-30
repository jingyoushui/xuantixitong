<%@ page language="java" contentType="text/html"
	import="dao.ProjectDao,entity.Proj_Info,java.util.*"
	pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
<%


%>
 <style>
    .text {
        display: none;
    }
    .on{
        color:#333;
    }
    .off{
        color:#eee;
    }
    .circle {
        position: absolute;
        display: inline-block;
    }

    #radio ~label {
        background-color: grey;
    }

    #radio ~label .circle {
        left: 0;
        transition: all 0.3s;
        --webkit-transition: all 0.3s;
    }

    #radio ~label .on {
        display: none;
    }

    #radio ~ label .off {
        display: inline-block;
    }

    #radio:checked ~ label {
        background: lime;
    }

    #radio:checked ~label .circle {
        left: 50px;
    }
    #radio:checked ~label .on {
        display: inline-block;
        left:0px;
        
    }

    #radio:checked ~ label .off {
        display: none;
    }

    label {
        display: inline-block;
        position: relative;
        height: 30px;
        width: 80px;
        border-top-left-radius: 15px 50%;
        border-bottom-left-radius: 15px 50%;
        border-top-right-radius: 15px 50%;
        border-bottom-right-radius: 15px 50%;
        box-shadow: 0 0 2px black;
    }

    label .circle {
        display: inline-block;
        height: 26px;
        width: 26px;
        border-radius: 50%;
        border: 2px solid #333;
        background-color: #eee;
    }

    label .text1 {
        text-indent: -30px;
        line-height: 28px;
        font-size: 18px;
        font-family: sans-serif;
        text-shadow: 0 0 2px #ddd;
      
    }
    label .text2 {
        text-indent: 30px;
        line-height: 28px;
        font-size: 18px;
        font-family: sans-serif;
        text-shadow: 0 0 2px #ddd;
      
    }
    
    </style>
   <script type="text/javascript">
   		$(function(){
   			$("#btn").click(function(){
   				$.post("../selproj.do",
   					{type:sel,stu_id:$("#uid").val(),switch1:$("input[name='switch1']:checked").val(),switch2:$("input[name='switch2']:checked").val(),switch3:$("input[name='switch3']:checked").val()},
   					function(data){
   						
   					}
   				
   				);   				
   			});  			
   		});
   
   </script> 
   
</head>
<body>
	<div align="center">ѡ��Ǽ�</div>
	<hr>
	<div style="height: 30px;" align="center">
		<form action="../select.do" method="post">
			<input type="hidden" name="selecttype" value="stu_select_proj">
			<input type="hidden" name="selectpage" value="stuproject">
			�����ţ�<input type="text" name="proj_id" value="${proj_id}">
			&nbsp �������ƣ�<input type="text" name="proj_name" value="${proj_name}">
			&nbsp �������ף�<input type="text" name="proj_grade" value="${proj_grade}">
			<input type="hidden" name="coll" value="${uid}">&nbsp �������ͣ�<input
				type="text" name="proj_type" value="${proj_type}"> &nbsp <input
				type="submit" value="��ѯ">
		</form>
	</div>
	<hr>
	<div align="center">
		<form action="../selproj.do" method="get">
			<table border="2" bordercolor="#1C7B75"
				style="width: 95%; text-align: center;">
				<tr>
					<th>���</th>
					<th>��������</th>
					<th>����</th>
					<th>�Ѷ�</th>
					<th>�����ļ�</th>
					<th>��ʦ����</th>
					<th>��һ־Ը</th>
					<th>�ڶ�־Ը</th>
					<th>����־Ը</th>
				</tr>
				<tbody>
					<c:forEach var="cus" items="${clist3}">
						<tr>
							<td>${cus.getProj_id()}</td>
							<td>${cus.getProj_name()}</td>
							<td>${cus.getProj_type()}</td>
							<td>${cus.getProj_grade()}</td>
							<td><a href="../upload.do?&file=${cus.getProj_accessory()}">����</a></td>
							<td>${cus.getTea_id()}</td>
							<td>
							<input type="hidden" name="stu_id" id="uid" value="${uid}">
							<input type="hidden" name="type" id="uid" value="sel">
							<input type="radio" id="radio" name="switch1" value="${cus.getProj_id()}">
								<label for="radio" class="radio"> <span class="circle"></span>
									<span class="text1 on">ON</span> <span class="text2 off">OFF</span>
								</label>
							</td>
							<td><input type="radio" id="radio" name="switch2" value="${cus.getProj_id()}">
								<label for="radio" class="radio"> <span class="circle"></span>
									<span class="text1 on">ON</span> <span class="text2 off">OFF</span>
								</label>
							</td>
							<td><input type="radio" id="radio" name="switch3" value="${cus.getProj_id()}">
								<label for="radio" class="radio"> <span class="circle"></span>
									<span class="text1 on">ON</span> <span class="text2 off">OFF</span>
								</label>
							</td>
							

							<!-- <td><a href='../selproj.do?type=sel&proj_id=${cus.getProj_id()}&stu_id=${uid}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ѡ��`)==false)return false;'>ѡ��</a>
							</td>
							<td><a href='../selproj.do?type=sel&proj_id=${cus.getProj_id()}&stu_id=${uid}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ѡ��`)==false)return false;'>ѡ��</a>
							</td>
							<td><a href='../selproj.do?type=sel&proj_id=${cus.getProj_id()}&stu_id=${uid}' style='text-decoration:none;'onclick='if(confirm(`�Ƿ�ѡ��`)==false)return false;'>ѡ��</a>
							</td> -->
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<input type="submit" value="�ύ"/>
			<!--  <button id="btn">�ύ</button>-->
		</form>
	</div>
	<hr>
	<div align="center">
		${current} <a
			href="../select.do?selecttype=stu_select&id=${current-1}"
			style="text-decoration: none;">��һҳ&nbsp&nbsp <a
			href="../select.do?selecttype=stu_select&id=1"
			style="text-decoration: none;">[1]&nbsp&nbsp</a><a
			href="../select.do?selecttype=stu_select&id=2"
			style="text-decoration: none;">[2]&nbsp&nbsp</a> <a
			href="../select.do?selecttype=stu_select&id=${current+1}"
			style="text-decoration: none;">��һҳ&nbsp&nbsp 
	</div>

</body>
</html>