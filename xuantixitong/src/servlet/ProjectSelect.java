package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ProjectDao;


public class ProjectSelect extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proj_id1 = request.getParameter("switch1");
		String proj_id2 = request.getParameter("switch2");
		String proj_id3 = request.getParameter("switch3");
		String proj_id=request.getParameter("proj_id");
		String stu_id = request.getParameter("stu_id");
		String type = request.getParameter("type");
		PrintWriter out = response.getWriter();
		out.println(proj_id1);
		out.println(proj_id2);
		out.println(proj_id3);
		out.println(stu_id);
		ProjectDao dao = new ProjectDao();
		if(type.equals("sel")) {
		
			int a = dao.addProjSelectZhiyuan(stu_id,proj_id1,1,0);
			int b = dao.addProjSelectZhiyuan(stu_id,proj_id2,2,0);
			int c = dao.addProjSelectZhiyuan(stu_id,proj_id3,3,0);
			if (a!= 0&&b!=0&&c!=0) {
				out.print("success添加成功");
			} else {
				out.print("fail您已选过该题");
			}
			response.setHeader("refresh", "5,student/stu_select_proj.jsp");
		}else if(type.equals("sel_topic")) {
			int zhiyuan=Integer.parseInt(request.getParameter("zhiyuan"));
			int i=dao.addProjSelect(proj_id,stu_id);
			dao.alterProjSelectZhiyuan(stu_id, zhiyuan,1);
			if (i!=0) {
				out.print("success通过");
			} else {
				out.print("fail不通过");
			}
			response.setHeader("refresh", "5,teacher/stu_proj_list.jsp");
			
		}else if(type.equals("sel_topic2")) {
			int zhiyuan=Integer.parseInt(request.getParameter("zhiyuan"));
			
			int i=dao.alterProjSelectZhiyuan(stu_id, zhiyuan,2);
			if (i!=0) {
				out.print("success");
			} else {
				out.print("fail");
			}
			
			response.setHeader("refresh", "5,teacher/stu_proj_list.jsp");
			
		}else  if(type.equals("del")) {
			int i = dao.deleteProjSelect(proj_id1,stu_id);
			if (i != 0) {
				out.println(proj_id1 +stu_id+ "删除成功");
				out.print("5s后自动返回");
			} else {
				out.println(proj_id1 +stu_id + "删除失败");
				out.print("5s后自动返回");
			}
			response.setHeader("refresh", "5,student/select_stu_proj.jsp");
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
