package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import dao.ProjectDao;
import entity.Proj_Info;
import other.IpTimeStamp;

/**
 * Servlet implementation class UploadServlet
 */

public class UploadServlet extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		//获取下载文件名  
		//String fileName = new String(request.getParameter("file").getBytes("ISO-8859-1"));
	    String fileName = request.getParameter("file");  
	    //新建一个smartUpload对象  
	    SmartUpload smartUpload = new SmartUpload();  
	    //初始化  
	    smartUpload.initialize(this.getServletConfig(), request, response);  
	    //设定contentDisposition为null以禁止浏览器自动打开文件  
	    //保证单击链接后是下载文件。  
	    smartUpload.setContentDisposition(null);  
	    //下载文件  
	    try {  
	      smartUpload.downloadFile("E:/eclipse-j2ee-workspace/xuantixitong/WebContent/upload/"+fileName);  
	    } catch (SmartUploadException e) {  
	      e.printStackTrace();  
	    }  

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		Proj_Info proj=new Proj_Info();
		ProjectDao projdao=new ProjectDao();

		SmartUpload smartUpload = new SmartUpload();
        // 初始化
        ServletConfig config = this.getServletConfig();
        smartUpload.initialize(config, request, response);
        
        IpTimeStamp IpTimeStamp=new IpTimeStamp(InetAddress.getLocalHost().getHostAddress());//ip调用有参数的构造方法  
        String a=IpTimeStamp.getIpTimeRand();
        String filepath="";
        try {
        	
            // 上传文件
            smartUpload.upload();
            // 得到上传的文件对象
            File smartFile = smartUpload.getFiles().getFile(0);
           
            // 保存文件
            smartFile.saveAs("E:/eclipse-j2ee-workspace/xuantixitong/WebContent/upload/"+a+"."+ smartFile.getFileExt(),
                    smartUpload.SAVE_PHYSICAL);
            String msg = "Upload Success!";
            request.setAttribute("msg", msg);
            filepath=a+"."+smartFile.getFileExt();
           
            //request.setAttribute("filepath", filepath);
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
        //
        response.setCharacterEncoding("gbk");
		
		String useraddtype = smartUpload.getRequest().getParameter("useraddtype");
		if (useraddtype.equals("projectadd")) {
			String proj_id = smartUpload.getRequest().getParameter("proj_id");
			String proj_name=smartUpload.getRequest().getParameter("proj_name");
			String proj_type = smartUpload.getRequest().getParameter("proj_type");

			String proj_grade = smartUpload.getRequest().getParameter("proj_grade");
			
			String proj_accessory = filepath;
			String tea_id = smartUpload.getRequest().getParameter("tea_id");
			out.println(proj_id);out.println(proj_name);out.println(proj_id);out.println(proj_accessory);
			proj.setProj_id(proj_id);
			proj.setProj_name(proj_name);
			proj.setProj_type(proj_type);
			proj.setProj_grade(proj_grade);
			proj.setProj_accessory(proj_accessory);
			proj.setTea_id(tea_id);
			proj.setProj_zhuang(0);
			int i = projdao.addProj_Info(proj);
			if (i != 0) {
				out.print("success添加成功");
				out.print("5s后自动返回");
			} else {
				out.print("fail添加失败");
				out.print("5s后自动返回");
			}
			response.setHeader("refresh", "5,teacher/proj_add.jsp");
			
		}if (useraddtype.equals("projectalter")) {
			String proj_id = smartUpload.getRequest().getParameter("proj_id");
			String proj_name=smartUpload.getRequest().getParameter("proj_name");
			String proj_type = smartUpload.getRequest().getParameter("proj_type");

			String proj_grade = smartUpload.getRequest().getParameter("proj_grade");
			
			String proj_accessory = filepath;
			String tea_id = smartUpload.getRequest().getParameter("tea_id");
			int proj_zhuang = Integer.parseInt(smartUpload.getRequest().getParameter("proj_zhuang"));
			proj.setProj_id(proj_id);
			proj.setProj_name(proj_name);
			proj.setProj_type(proj_type);
			proj.setProj_grade(proj_grade);
			proj.setProj_accessory(proj_accessory);
			proj.setTea_id(tea_id);
			proj.setProj_zhuang(proj_zhuang);
			int i = projdao.alterProj_Info(proj);
			if (i != 0) {
				out.print("success更新成功");
				
			} else {
				out.print("fail更新失败");
				
			}
			
		}
       // RequestDispatcher rd = request.getRequestDispatcher("teacher/proj_add.jsp");
        //rd.forward(request, response);
	}

}
