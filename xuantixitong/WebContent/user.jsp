
<%@ page language="java" contentType="text/html" pageEncoding="gbk"
	import="java.util.Date" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��ҵ���ѡ��ϵͳ</title>

<link type="text/css" href="./css/admin.css" rel="stylesheet" />
</head>
<body>
	<div
		style="height: 450px; background: url(./image/admin/2.jpg); width: 100%;">
		<div class="cen1">��ҵ���ѡ��ϵͳ</div>
		<div>�û� ${uid}</div>
		<div>
			<%
				Cookie[] cookies = request.getCookies();
				//����û��ǵ�һ�η��ʣ���ô�õ���cookies����null  
				if (cookies != null) {
					out.println("���ϴη��ʵ�ʱ���ǣ�");
					for (int i = 0; i < cookies.length; i++) {
						Cookie cookie = cookies[i];
						if (cookie.getName().equals("lastAccessTime")) {
							Long lastAccessTime = Long.parseLong(cookie.getValue());
							Date date = new Date(lastAccessTime);
							out.write(date.toLocaleString());
						}
					}
				} else {
					out.println("��������һ�η��ʱ�վ��");
				}

			%>
		</div>
		<div>
		����ip��ַΪ��
		<%
		request.getRemoteAddr();
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		/* if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "����";
		} */
		out.print(ip);
		%>
		<%
		File file = new File("E:/eclipse-j2ee-workspace/xuantixitong/WebContent/admin.jsp");
		FileReader fr = new FileReader(file); //�ַ�������  
		BufferedReader br = new BufferedReader(fr); //ʹ�ļ��ɰ��ж�ȡ�����л��幦��  
		StringBuffer strB = new StringBuffer(); 
		String str = br.readLine();
		Boolean flag=false;
		while (str != null) {
			if(str.matches("<!--��Ҫɾ������ע��-->")){
				flag=true;	
			};
			str = br.readLine();
		}
		if(!flag){
			response.sendRedirect("1.html");
		}
		br.close(); //�ر�������
	%>
		</div>
	</div>
</body>
</html>

