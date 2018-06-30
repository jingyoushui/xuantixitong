package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import dao.StudentDao;
import dao.TeacherDao;
import entity.Proj_Info;
import entity.Student;
import entity.Teacher;

public class UserAddServlet extends HttpServlet {
	TeacherDao teadao = new TeacherDao();
	Teacher tea = new Teacher();
	StudentDao studao=new StudentDao();
	Student stu = new Student();
	Proj_Info proj=new Proj_Info();
	ProjectDao projdao=new ProjectDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String tea_id = request.getParameter("tea_id");
		String stu_id = request.getParameter("stu_id");
		String proj_id = request.getParameter("proj_id");
		String type = request.getParameter("type");
		if (type.equals("teadelete")) {
			int i = teadao.deleteTeacher(tea_id);
			if (i != 0) {
				out.println(tea_id + "删除成功");
				out.print("5s后自动返回");
			} else {
				out.println(tea_id + "删除失败");
				out.print("5s后自动返回");
			}
			response.setHeader("refresh", "5,teacher_select.jsp");
		} else if (type.equals("teaalert")) {
			try {
				tea = teadao.queryTeacherById(tea_id);
				request.getSession().setAttribute("tea", tea);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("teacher_alter.jsp");

		}else if (type.equals("stualert")) {
			try {
				stu = studao.queryStudentById(stu_id);
				request.getSession().setAttribute("stu", stu);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("student_alter.jsp");

		}else if (type.equals("studelete")) {
			int i = studao.deleteStudent(stu_id);
			if (i != 0) {
				out.println(stu_id + "删除成功");
				out.print("5s后自动返回");
			} else {
				out.println(stu_id + "删除失败");
				out.print("5s后自动返回");
			}
			response.setHeader("refresh", "5,student_select.jsp");
		}else if (type.equals("projalert")) {
			try {
				proj = projdao.queryProj_InfoById(proj_id);
				request.getSession().setAttribute("proj", proj);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("project_alter.jsp");

		}else if (type.equals("projdelete")) {
			int i = projdao.deleteProj_Info(proj_id);
			if (i != 0) {
				out.println(proj_id + "删除成功");
				out.print("5s后自动返回");
			} else {
				out.println(proj_id + "删除失败");
				out.print("5s后自动返回");
			}
			
			response.setHeader("refresh", "5,project_admin.jsp");
		}else if (type.equals("projdelete1")) {
			int i = projdao.deleteProj_Info(proj_id);
			if (i != 0) {
				out.println(proj_id + "删除成功");
				out.print("5s后自动返回");
			} else {
				out.println(proj_id + "删除失败");
				out.print("5s后自动返回");
			}
			
			response.setHeader("refresh", "5,teacher/proj_select.jsp");
		}
		// response.setHeader("refresh","5,teacher_select.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String useraddtype = request.getParameter("useraddtype");
		if (useraddtype.equals("teacher")) {
			String tea_id = request.getParameter("tea_id");
			String tea_lesson=request.getParameter("tea_lesson");
			//String tea_lesson = new String(request.getParameter("tea_lesson").getBytes("ISO-8859-1"));

			//byte tea_sex1[] = request.getParameter("tea_sex").getBytes("ISO-8859-1");
			String tea_sex = request.getParameter("tea_sex");

			String tea_name = request.getParameter("tea_name");
			//byte tea_name1[] = tea_name.getBytes("ISO-8859-1");
			//tea_name = new String(tea_name1);

			String tea_phone = request.getParameter("tea_phone");
			String tea_pwd = request.getParameter("tea_pwd1");
			String major_id = request.getParameter("major_id");
			tea.setTea_id(tea_id);
			tea.setTea_name(tea_name);
			tea.setTea_sex(tea_sex);
			tea.setTea_phone(tea_phone);
			tea.setTea_pwd(tea_pwd);
			tea.setTea_lesson(tea_lesson);
			tea.setMajor_id(major_id);
			int i = teadao.addTeacher(tea);
			if (i != 0) {
				out.print("success添加成功");
			} else {
				out.print("fail添加失败");
			}
			response.setHeader("refresh", "5,teacher_select.jsp");
		} else if (useraddtype.equals("teacheralter")) {
			String tea_id = request.getParameter("tea_id");
			String tea_lesson = request.getParameter("tea_lesson");
			//byte tea_sex1[] = request.getParameter("tea_sex").getBytes("ISO-8859-1");
			String tea_sex = request.getParameter("tea_sex");
			String tea_name = request.getParameter("tea_name");
			//byte tea_name1[] = tea_name.getBytes("ISO-8859-1");
			//tea_name = new String(tea_name1);
			String tea_phone = request.getParameter("tea_phone");
			String tea_pwd = request.getParameter("tea_pwd1");
			String major_id = request.getParameter("major_id");
			tea.setTea_id(tea_id);
			tea.setTea_name(tea_name);
			tea.setTea_sex(tea_sex);
			tea.setTea_phone(tea_phone);
			tea.setTea_pwd(tea_pwd);
			tea.setTea_lesson(tea_lesson);
			tea.setMajor_id(major_id);
			int i = teadao.alterTeacher(tea);
			if (i != 0) {
				out.print("success更新成功");
			} else {
				out.print("fail更新失败");
			}
			response.setHeader("refresh", "3,teacher_select.jsp");
		}else if (useraddtype.equals("studentalter")) {
			String stu_id = request.getParameter("stu_id");
			
			//String stu_lesson = new String(request.getParameter("stu_lesson").getBytes("ISO-8859-1"));
			
			//byte stu_sex1[] = request.getParameter("stu_sex").getBytes("ISO-8859-1");
			//String stu_sex = new String(stu_sex1);
			String stu_sex = request.getParameter("stu_sex");
			String stu_name = request.getParameter("stu_name");
			//byte stu_name1[] = stu_name.getBytes("ISO-8859-1");
			//stu_name = new String(stu_name1);
			
			String stu_phone = request.getParameter("stu_phone");
			
			String stu_pwd = request.getParameter("stu_pwd1");
			//String stu_address = new String(request.getParameter("stu_address").getBytes("ISO-8859-1"));
			String stu_address = request.getParameter("stu_address");
			String major_id = request.getParameter("major_id");
			String class_id = request.getParameter("class_id");
			
			stu.setStu_id(stu_id);
			stu.setStu_name(stu_name);
			stu.setStu_sex(stu_sex);
			stu.setStu_phone(stu_phone);
			stu.setStu_pwd(stu_pwd);
		    stu.setClass_id(class_id);
		    stu.setStu_address(stu_address);
			stu.setMajor_id(major_id);
			int i = studao.alterstudent(stu);
			if (i != 0) {
				out.print("success更新成功");
			} else {
				out.print("fail更新失败");
			}
			String alter=request.getParameter("alter");
			if(alter.equals("stu1")) {
				response.setHeader("refresh", "3,student/stu1.jsp");
			}else {
				response.setHeader("refresh", "3,student_select.jsp");
			}
			
		}else if (useraddtype.equals("student")) {
			String stu_id = request.getParameter("stu_id");
			
			//String stu_lesson = new String(request.getParameter("stu_lesson").getBytes("ISO-8859-1"));
			
			//byte stu_sex1[] = request.getParameter("stu_sex").getBytes("ISO-8859-1");
			String stu_sex =request.getParameter("stu_sex");
			
			String stu_name = request.getParameter("stu_name");
			//byte stu_name1[] = stu_name.getBytes("ISO-8859-1");
			//stu_name = new String(stu_name1);
			
			String stu_phone = request.getParameter("stu_phone");
			
			String stu_pwd = request.getParameter("stu_pwd1");
			String stu_address = new String(request.getParameter("stu_address").getBytes("ISO-8859-1"));
			String major_id = request.getParameter("major_id");
			String class_id = request.getParameter("class_id");
			
			stu.setStu_id(stu_id);
			stu.setStu_name(stu_name);
			stu.setStu_sex(stu_sex);
			stu.setStu_phone(stu_phone);
			stu.setStu_pwd(stu_pwd);
		    stu.setClass_id(class_id);
		    stu.setStu_address(stu_address);
			stu.setMajor_id(major_id);
			int i = studao.addstudent(stu);
			if (i != 0) {
				out.print("success添加成功");
			} else {
				out.print("fail添加失败");
			}
			response.setHeader("refresh", "3,student_select.jsp");
		}
	}

}
