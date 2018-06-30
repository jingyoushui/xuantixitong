package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewsDao;
import entity.News;
import entity.Student;
import entity.Teacher;

public class NewsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		News news = new News();
		NewsDao dao = new NewsDao();
		if (request.getParameter("type") != null) {
			String type = request.getParameter("type");
			if (type.equals("news")) {
				String title = request.getParameter("title");
				String detail = request.getParameter("detail");
				String writer = request.getParameter("writer");
				Date time = new Date();
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				out.println(df.format(time));
				out.println(title);
				out.println(detail);
				out.println(writer);
				news.setTitle(title);
				news.setDetail(detail);
				news.setWriter(writer);
				news.setTime(df.format(time) + "");
				int i = dao.addNews(news);
				if (i != 0) {
					out.print("success添加成功");
				} else {
					out.print("fail添加失败");
				}

			}else if(type.equals("newsdetail")) {
				int id=Integer.parseInt(request.getParameter("id"));
				News newsdetail = dao.queryNewsById(id);
				request.getSession().setAttribute("newsdetail", newsdetail);
				response.sendRedirect("NewsDetail.jsp");
					
				
				
			}
		}else {
			
			List<News> newslist = dao.queryNews();
			request.getSession().setAttribute("newslist", newslist);
			out.println("1111");
			response.sendRedirect("login.jsp");
		}

	}

}
