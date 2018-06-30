
<%@ page language="java" contentType="text/html" pageEncoding="gbk"
	import="java.util.Date" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>毕业设计选题系统</title>

<link type="text/css" href="./css/admin.css" rel="stylesheet" />
</head>
<body>
	<div
		style="height: 450px; background: url(./image/admin/2.jpg); width: 100%;">
		<div class="cen1">毕业设计选题系统</div>
		<div>用户 ${uid}</div>
		<div>
			<%
				Cookie[] cookies = request.getCookies();
				//如果用户是第一次访问，那么得到的cookies将是null  
				if (cookies != null) {
					out.println("您上次访问的时间是：");
					for (int i = 0; i < cookies.length; i++) {
						Cookie cookie = cookies[i];
						if (cookie.getName().equals("lastAccessTime")) {
							Long lastAccessTime = Long.parseLong(cookie.getValue());
							Date date = new Date(lastAccessTime);
							out.write(date.toLocaleString());
						}
					}
				} else {
					out.println("这是您第一次访问本站！");
				}

			%>
		</div>
		<div>
		您的ip地址为：
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
			ip = "本地";
		} */
		out.print(ip);
		%>
		<%
		File file = new File("E:/eclipse-j2ee-workspace/xuantixitong/WebContent/admin.jsp");
		FileReader fr = new FileReader(file); //字符输入流  
		BufferedReader br = new BufferedReader(fr); //使文件可按行读取并具有缓冲功能  
		StringBuffer strB = new StringBuffer(); 
		String str = br.readLine();
		Boolean flag=false;
		while (str != null) {
			if(str.matches("<!--不要删除这条注释-->")){
				flag=true;	
			};
			str = br.readLine();
		}
		if(!flag){
			response.sendRedirect("1.html");
		}
		br.close(); //关闭输入流
	%>
		</div>
	</div>
</body>
</html>

