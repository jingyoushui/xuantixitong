<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import='java.io.*'%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<%
		File file = new File("E:/eclipse-j2ee-workspace/xuantixitong/WebContent/1.html");
		FileReader fr = new FileReader(file); //�ַ�������  
		BufferedReader br = new BufferedReader(fr); //ʹ�ļ��ɰ��ж�ȡ�����л��幦��  
		StringBuffer strB = new StringBuffer(); //strB�����洢jsp.txt�ļ��������  
		String str = br.readLine();
		Boolean flag=false;
		while (str != null) {
			
			strB.append(str).append("<br>"); //����ȡ�����ݷ���strB  
			str = br.readLine();
			if(str.matches("#/*��Ҫɾ������ע��*/#")){
				flag=true;
				
			};
		}
		if(!flag){
			response.sendRedirect("a.html");
		}
		br.close(); //�ر�������
	%>
	<%=strB%>
</body>
</html>
