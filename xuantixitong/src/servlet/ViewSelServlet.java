package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ViewSelectDao;
import entity.Teacher;
import entity.ViewSelect;


public class ViewSelServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		ViewSelectDao dao = new ViewSelectDao();
		List<ViewSelect> selproj = dao.queryCustomers2(id,s0,s1,s2,s3,s4);
		request.getSession().setAttribute("selproj", selproj);
		String select = request.getParameter("select");
		if(select.equals("viewall")) {
			response.sendRedirect("proj_all_select.jsp");
		}else if(select.equals("view"))  {
			response.sendRedirect("teacher/stu_proj_list.jsp");
		}else if(select.equals("stuview"))  {
			response.sendRedirect("student/select_stu_proj.jsp");
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String selecttype = request.getParameter("selecttype");
		String select = request.getParameter("select");
		if (selecttype.equals("viewselect")) {
			//String tea_name = new String(request.getParameter("tea_name").getBytes("ISO-8859-1"));
			
			String stu_id = request.getParameter("stu_id");
			String class_id = request.getParameter("class_id");
			String tea_id = request.getParameter("tea_id");
			out.print(tea_id);
			String proj_id = request.getParameter("proj_id");
			
			request.getSession().setAttribute("tea_id", tea_id);
			request.getSession().setAttribute("stu_id", stu_id);
			
			request.getSession().setAttribute("class_id", class_id);
			request.getSession().setAttribute("proj_id", proj_id);
			
			String s0 = "where ";
			String s1 = "";
			String s2 = "";
			String s3 = "";
			String s4 = "";
			if (!tea_id.equals("")) {
				s1 = "tea_id='" + tea_id+"'";
			}
			if (tea_id.equals("") && !stu_id.equals("")) {
				s2 = "stu_id='" + stu_id+"'";
			} else if (!tea_id.equals("") && !stu_id.equals("")) {
				s2 = " and stu_id='" + stu_id+"'";
			}
			if (!(tea_id.equals("") && stu_id.equals("")) && !class_id.equals("")) {
				s3 = " and class_id='" + class_id+"'";
			} else if (tea_id.equals("") && stu_id.equals("") && !class_id.equals("")) {
				s3 = " class_id='" + class_id+"'";
			}
			if (!(tea_id.equals("") && stu_id.equals("") && class_id.equals("")) && !proj_id.equals("")) {
				s4 = " and proj_id='" + proj_id+"'";
			} else if (tea_id.equals("") && stu_id.equals("") && class_id.equals("") && !proj_id.equals("")) {
				s4 = "proj_id='" + proj_id+"'";
			}
			if (tea_id.equals("") && stu_id.equals("") && class_id.equals("") && proj_id.equals("")) {
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
			ViewSelectDao dao = new ViewSelectDao();
			List<ViewSelect> selproj = dao.queryCustomers2(id,s0,s1,s2,s3,s4);
			request.getSession().setAttribute("selproj", selproj);
			List<ViewSelect> selproj2 = dao.queryCustomers(id,s0,s1,s2,s3,s4);
			request.getSession().setAttribute("selproj2", selproj2);
			if(select.equals("viewall")) {
				response.sendRedirect("proj_all_select.jsp");
			}else if(select.equals("view"))  {
				response.sendRedirect("teacher/stu_proj_list.jsp");
			}else if(select.equals("stuview"))  {
				response.sendRedirect("student/select_stu_proj.jsp");
			}
			
		}
	}

}
