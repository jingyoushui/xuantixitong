package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import dao.StudentDao;
import dao.TeacherDao;
import entity.Proj_Info;

public class CheckServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProjectDao projdao=new ProjectDao();
		TeacherDao teadao=new TeacherDao();
		StudentDao studao = new StudentDao();
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		
		if(type.equals("projadd")){
			
			if(projdao.isProjExists(id)) {
				response.getWriter().print("yes");
			}else {
				response.getWriter().print("no");
			}
		}else if(type.equals("teaadd")){
			
			if(teadao.isTeaExists(id)) {
				response.getWriter().print("yes");
			}else {
				response.getWriter().print("no");
			}
		}else if(type.equals("stuadd")){
			
			if(studao.isStuExists(id)) {
				response.getWriter().print("yes");
			}else {
				response.getWriter().print("no");
			}
		}
	}

}
