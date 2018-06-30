package servlet;

import java.io.IOException;  
import java.io.PrintWriter;  
import java.util.Date;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.Cookie;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  


public class CookiedServlet extends HttpServlet {  
  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        //�����������UTF-8������н���,���������������  
        PrintWriter out = response.getWriter();  
        //��ȡ��������ʷ��ʷ�����ʱ���ݹ�����cookie����  
        Cookie[] cookies = request.getCookies();  
        //����û��ǵ�һ�η��ʣ���ô�õ���cookies����null  
        if (cookies!=null) {  
            out.write("���ϴη��ʵ�ʱ���ǣ�");  
            for (int i = 0; i < cookies.length; i++) {  
                Cookie cookie = cookies[i];  
                if (cookie.getName().equals("lastAccessTime")) {  
                    Long lastAccessTime =Long.parseLong(cookie.getValue());  
                    Date date = new Date(lastAccessTime);  
                    out.write(date.toLocaleString());  
                }  
            }  
        }else {  
            out.write("��������һ�η��ʱ�վ��");  
        }  
          
        //�û����ʹ�֮�����������û��ķ���ʱ�䣬�洢��cookie�У�Ȼ���͵��ͻ��������  
        Cookie cookie = new Cookie("lastAccessTime", System.currentTimeMillis()+"");//����һ��cookie��cookie��������lastAccessTime  
        //��cookie������ӵ�response�����У����������������response�����е�����ʱ�ͻ��cookieҲ������ͻ��������  
        response.addCookie(cookie);  
    }  
  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
     doGet(request,response);  
    }  
  
}  