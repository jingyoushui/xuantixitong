package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.StudentDao;
import dao.TeacherDao;
import dao.UserDao;
import entity.Office;
import entity.Student;
import entity.Teacher;

public class UserServlet extends HttpServlet {
	UserDao user=new UserDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String uid=request.getParameter("uid");
		String pwd=request.getParameter("pwd");
		String type=request.getParameter("type");
		if(user.login(uid, pwd, type)) {
			out.print(uid+pwd+type);
			request.getSession().setAttribute("uid", uid);
			request.getSession().setAttribute("type", type);
			request.getSession().setAttribute("pwd", pwd);
			
			
			if(type.equals("admin")) {
				AdminDao dao=new AdminDao();
			    List<Office> clist=dao.queryAdminByid(uid);
			    for(Office cus:clist){
			    	
			    	request.getSession().setAttribute("college", cus.getCollege_id());
		        }
				
			}else if(type.equals("teacher")) {
				TeacherDao teadao = new TeacherDao();
				Teacher tea = new Teacher();
				try {
					tea = teadao.queryTeacherById(uid);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("tea", tea);
				request.getSession().setAttribute("college", tea.getMajor_id());
			}else if(type.equals("student")) {
				StudentDao studao = new StudentDao();
				Student stu = new Student();
				try {
					stu = studao.queryStudentById(uid);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("stu", stu);
				request.getSession().setAttribute("college",stu.getMajor_id());
			}
			response.sendRedirect("main.jsp");
		}else if(type.equals("admin")){
			response.sendRedirect("admin.jsp?msg=Account or password error");
		}else {
			response.sendRedirect("login.jsp?msg=Account or password error");
		}
		
		
		
	}

}
