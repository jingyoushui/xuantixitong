package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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

public class UserSelectServlet extends HttpServlet {
	TeacherDao dao = new TeacherDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setCharacterEncoding("gbk");
			String selecttype = request.getParameter("selecttype");
			int id=1;
			if(request.getParameter("id")!=null){
			    id=Integer.parseInt(request.getParameter("id"));
			    request.getSession().setAttribute("current", id);
			}else{
			    request.getSession().setAttribute("current", 1);
			}
			
			String s1=request.getSession().getAttribute("s1")+"";
			String s2=request.getSession().getAttribute("s2")+"";
			String s3=request.getSession().getAttribute("s3")+"";
			String s4=request.getSession().getAttribute("s4")+"";
			String s0=request.getSession().getAttribute("s0")+"";
			if(selecttype.equals("teacherselect")) {
				TeacherDao dao = new TeacherDao();
				List<Teacher> clist = dao.queryCustomers(id,s0,s1,s2,s3,s4);
				request.getSession().setAttribute("clist", clist);
				response.sendRedirect("teacher_select.jsp");
			}if(selecttype.equals("stu_select")) {
				String s=request.getSession().getAttribute("uid")+"";
				ProjectDao dao = new ProjectDao();
				List<Proj_Info> clist3 = dao.queryProject(s,id,s0,s1,s2,s4);
				request.getSession().setAttribute("clist3", clist3);
				response.sendRedirect("student/stu_select_proj.jsp");
			}else if(selecttype.equals("studentselect")) {
				
				StudentDao dao = new StudentDao();
				List<Student> clist2 = dao.queryCustomers(id,s0,s1,s2,s3,s4);
				request.getSession().setAttribute("clist2", clist2);
				response.sendRedirect("student_select.jsp");
			}else if(selecttype.equals("projectselect")) {
				ProjectDao dao = new ProjectDao();
				List<Proj_Info> clist3 = dao.queryCustomers(id,s0,s1,s2,s3,s4);
				request.getSession().setAttribute("clist3", clist3);
				String select = request.getParameter("selectpage");
				if(select.equals("stuproject")) {
					response.sendRedirect("student/stu_select_proj.jsp");
				}else if(select.equals("project")) {
					response.sendRedirect("teacher/proj_select.jsp");
				}else {
					response.sendRedirect("project_admin.jsp");
				}
			}
			
		

	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String selecttype = request.getParameter("selecttype");
		if (selecttype.equals("teacherselect")) {
			teacher_select(request,response);
			response.sendRedirect("teacher_select.jsp");
		}else if (selecttype.equals("studentselect")) {
			student_select(request,response);
			response.sendRedirect("student_select.jsp");
		}else if (selecttype.equals("projectselect")) {
			project_select(request,response);
			String select = request.getParameter("selectpage");
			if(select.equals("project")) {
				response.sendRedirect("teacher/proj_select.jsp");
			}else {
				response.sendRedirect("project_admin.jsp");
			}
			
		}else if (selecttype.equals("stu_select_proj")) {
			
			stu_select_proj(request,response);
			
			response.sendRedirect("student/stu_select_proj.jsp");
			
		}
	}
	private void teacher_select(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		String tea_id = request.getParameter("tea_id");
		String tea_name = request.getParameter("tea_name");
		String tea_lesson =request.getParameter("tea_lesson");
		String major_id = request.getParameter("major_id");
		
		request.getSession().setAttribute("tea_id", tea_id);
		request.getSession().setAttribute("tea_name", tea_name);
		
		request.getSession().setAttribute("tea_lesson", tea_lesson);
		request.getSession().setAttribute("major_id", major_id);
		
		String s0 = "where ";
		String s1 = "";
		String s2 = "";
		String s3 = "";
		String s4 = "";
		if (!tea_id.equals("")) {
			s1 = "tea_id='" + tea_id+"'";
		}
		if (tea_id.equals("") && !tea_name.equals("")) {
			s2 = "tea_name='" + tea_name+"'";
		} else if (!tea_id.equals("") && !tea_name.equals("")) {
			s2 = " and tea_name='" + tea_name+"'";
		}
		if (!(tea_id.equals("") && tea_name.equals("")) && !tea_lesson.equals("")) {
			s3 = " and tea_lesson='" + tea_lesson+"'";
		} else if (tea_id.equals("") && tea_name.equals("") && !tea_lesson.equals("")) {
			s3 = " tea_lesson='" + tea_lesson+"'";
		}
		if (!(tea_id.equals("") && tea_name.equals("") && tea_lesson.equals("")) && !major_id.equals("")) {
			s4 = " and major_id='" + major_id+"'";
		} else if (tea_id.equals("") && tea_name.equals("") && tea_lesson.equals("") && !major_id.equals("")) {
			s4 = "major_id='" + major_id+"'";
		}
		if (tea_id.equals("") && tea_name.equals("") && tea_lesson.equals("") && major_id.equals("")) {
			s0 ="";
		}
		request.getSession().setAttribute("s0", s0);
		request.getSession().setAttribute("s1", s1);
		request.getSession().setAttribute("s2", s2);
		request.getSession().setAttribute("s3", s3);
		request.getSession().setAttribute("s4", s4);
		int id=1;
		if(request.getParameter("id")!=null){
		    id=Integer.parseInt(request.getParameter("id"));
		    request.getSession().setAttribute("current", id);
		}else{
		    request.getSession().setAttribute("current", 1);
		}
		TeacherDao dao = new TeacherDao();
		List<Teacher> clist = dao.queryCustomers(id,s0,s1,s2,s3,s4);
		request.getSession().setAttribute("clist", clist);
		
	}
	public void student_select(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String stu_id = request.getParameter("stu_id");
		
		String stu_name = request.getParameter("stu_name");
		
		String class_id = request.getParameter("class_id");
		String major_id = request.getParameter("major_id");
		
		request.getSession().setAttribute("stu_id", stu_id);
		request.getSession().setAttribute("stu_name", stu_name);
		request.getSession().setAttribute("class_id", class_id);
		request.getSession().setAttribute("major_id", major_id);
		
		String s0 = "where ";
		String s1 = "";
		String s2 = "";
		String s3 = "";
		String s4 = "";
		if (!stu_id.equals("")) {
			s1 = "stu_id='" + stu_id+"'";
		}
		if (stu_id.equals("") && !stu_name.equals("")) {
			s2 = "stu_name='" + stu_name+"'";
		} else if (!stu_id.equals("") && !stu_name.equals("")) {
			s2 = " and stu_name='" + stu_name+"'";
		}
		if (!(stu_id.equals("") && stu_name.equals("")) && !class_id.equals("")) {
			s3 = " and class_id='" + class_id+"'";
		} else if (stu_id.equals("") && stu_name.equals("") && !class_id.equals("")) {
			s3 = " class_id='" + class_id+"'";
		}
		if (!(stu_id.equals("") && stu_name.equals("") && class_id.equals("")) && !major_id.equals("")) {
			s4 = " and major_id='" + major_id+"'";
		} else if (stu_id.equals("") && stu_name.equals("") && class_id.equals("") && !major_id.equals("")) {
			s4 = "major_id='" + major_id+"'";
		}
		if (stu_id.equals("") && stu_name.equals("") && class_id.equals("") && major_id.equals("")) {
			s0 ="";
		}

		String sql = "select * from stu_info "+s0 + s1 + s2 + s3 + s4;
		request.getSession().setAttribute("s0", s0);
		request.getSession().setAttribute("s1", s1);
		request.getSession().setAttribute("s2", s2);
		request.getSession().setAttribute("s3", s3);
		request.getSession().setAttribute("s4", s4);
		int id=1;
		if(request.getParameter("id")!=null){
		    id=Integer.parseInt(request.getParameter("id"));
		    request.getSession().setAttribute("current", id);
		}else{
		    request.getSession().setAttribute("current", 1);
		}
		StudentDao dao = new StudentDao();
		List<Student> clist2 = dao.queryCustomers(id,s0,s1,s2,s3,s4);
		request.getSession().setAttribute("clist2", clist2);
		
	}
	public void project_select(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String proj_id = request.getParameter("proj_id");
		String proj_grade = request.getParameter("proj_grade");
		String tea_id = request.getParameter("tea_id");
		String proj_type =request.getParameter("proj_type");
		
		request.getSession().setAttribute("proj_id", proj_id);
		request.getSession().setAttribute("proj_grade", proj_grade);
		request.getSession().setAttribute("tea_id", tea_id);
		request.getSession().setAttribute("proj_type", proj_type);
		
		String s0 = "where ";
		String s1 = "";
		String s2 = "";
		String s3 = "";
		String s4 = "";
		if (!proj_id.equals("")) {
			s1 = "proj_id='" + proj_id+"'";
		}
		if (proj_id.equals("") && !proj_type.equals("")) {
			s2 = "proj_type='" + proj_type+"'";
		} else if (!proj_id.equals("") && !proj_type.equals("")) {
			s2 = " and proj_type='" + proj_type+"'";
		}
		if (!(proj_id.equals("") && proj_type.equals("")) && !tea_id.equals("")) {
			s3 = " and tea_id='" + tea_id+"'";
		} else if (proj_id.equals("") && proj_type.equals("") && !tea_id.equals("")) {
			s3 = " tea_id='" + tea_id+"'";
		}
		if (!(proj_id.equals("") && proj_type.equals("") && tea_id.equals("")) && !proj_grade.equals("")) {
			s4 = " and proj_grade='" + proj_grade+"'";
		} else if (proj_id.equals("") && proj_type.equals("") && tea_id.equals("") && !proj_grade.equals("")) {
			s4 = "proj_grade='" + proj_grade+"'";
		}
		if (proj_id.equals("") && proj_type.equals("") && tea_id.equals("") && proj_grade.equals("")) {
			s0 ="";
		}

		String sql = "select * from proj_info "+s0 + s1 +s2 + s3 + s4;
		request.getSession().setAttribute("s0", s0);
		request.getSession().setAttribute("s1", s1);
		request.getSession().setAttribute("s2", s2);
		request.getSession().setAttribute("s3", s3);
		request.getSession().setAttribute("s4", s4);
		int id=1;
		if(request.getParameter("id")!=null){
		    id=Integer.parseInt(request.getParameter("id"));
		    request.getSession().setAttribute("current", id);
		}else{
		    request.getSession().setAttribute("current", 1);
		}
		ProjectDao dao = new ProjectDao();
		List<Proj_Info> clist3 = dao.queryCustomers(id,s0,s1,s2,s3,s4);
		request.getSession().setAttribute("clist3", clist3);
	}
	public void stu_select_proj(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String proj_id = request.getParameter("proj_id");
		
		
		
		String proj_grade = request.getParameter("proj_grade");
		String tea_id = request.getParameter("tea_id");
		String proj_type = request.getParameter("proj_type");
		
		request.getSession().setAttribute("proj_id", proj_id);
		request.getSession().setAttribute("proj_grade", proj_grade);
		request.getSession().setAttribute("tea_id", tea_id);
		request.getSession().setAttribute("proj_type", proj_type);
		
		String s0 = "where ";
		String s1 = "";
		String s2 = "";
		String s3 = "";
		String s4 = "";
		if (!proj_id.equals("")) {
			s1 = "proj_id='" + proj_id+"'";
		}
		if (proj_id.equals("") && !proj_type.equals("")) {
			s2 = "proj_type='" + proj_type+"'";
		} else if (!proj_id.equals("") && !proj_type.equals("")) {
			s2 = " and proj_type='" + proj_type+"'";
		}
		if (!(proj_id.equals("") && proj_type.equals(""))&&!proj_grade.equals("")){
			s4 = " and proj_grade='" + proj_grade+"'";
		} else if (proj_id.equals("") && proj_type.equals("") && !proj_grade.equals("")) {
			s4 = "proj_grade='" + proj_grade+"'";
		}
		if (proj_id.equals("") && proj_type.equals("")&& proj_grade.equals("")) {
			s0 ="";
		}
		request.getSession().setAttribute("s0", s0);
		request.getSession().setAttribute("s1", s1);
		request.getSession().setAttribute("s2", s2);
		request.getSession().setAttribute("s4", s4);
		int id=1;
		if(request.getParameter("id")!=null){
		    id=Integer.parseInt(request.getParameter("id"));
		    request.getSession().setAttribute("current", id);
		}else{
			request.getSession().setAttribute("current", 1);
		}
	    s3=request.getSession().getAttribute("uid")+"";
		ProjectDao dao = new ProjectDao();
		List<Proj_Info> clist3 = dao.queryProject(s3,id,s0,s1,s2,s4);
		request.getSession().setAttribute("clist3", clist3);
	}
}
