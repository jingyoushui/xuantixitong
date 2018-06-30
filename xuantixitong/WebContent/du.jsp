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
		FileReader fr = new FileReader(file); //字符输入流  
		BufferedReader br = new BufferedReader(fr); //使文件可按行读取并具有缓冲功能  
		StringBuffer strB = new StringBuffer(); //strB用来存储jsp.txt文件里的内容  
		String str = br.readLine();
		Boolean flag=false;
		while (str != null) {
			
			strB.append(str).append("<br>"); //将读取的内容放入strB  
			str = br.readLine();
			if(str.matches("#/*不要删除这条注释*/#")){
				flag=true;
				
			};
		}
		if(!flag){
			response.sendRedirect("a.html");
		}
		br.close(); //关闭输入流
	%>
	<%=strB%>
</body>
</html>
