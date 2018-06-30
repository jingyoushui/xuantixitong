package servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BufferedImage bfi = new BufferedImage(80,25,BufferedImage.TYPE_INT_RGB);
		Graphics g = bfi.getGraphics();
		g.fillRect(0, 0, 80, 25);

		//��֤���ַ���Χ
		char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
		Random r = new Random(); 
		int index;  
		StringBuffer sb = new StringBuffer(); //�����ַ���
		for(int i=0; i<4; i++){
			index = r.nextInt(ch.length);
			g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
			Font font = new Font("����", 30, 20);
			g.setFont(font);
			g.drawString(ch[index]+"", (i*20)+2, 23);
			sb.append(ch[index]);
		}
		
		// ������
	    int area = (int) (0.02 * 80 * 25);
	    for(int i=0; i<area; ++i){
	        int x = (int)(Math.random() * 80);
	        int y = (int)(Math.random() * 25);
	        bfi.setRGB(x, y, (int)(Math.random() * 255));
	    }
		
	  //������֤���еĸ�����
	    for (int i = 0; i < 6; i++) {  
		      //�����ȡ�����ߵ������յ�
		      int xstart = (int)(Math.random() * 80);
		      int ystart = (int)(Math.random() * 25);
		      int xend = (int)(Math.random() * 80);
		      int yend = (int)(Math.random() * 25);
		      g.setColor(interLine(1, 255));
		      g.drawLine(xstart, ystart, xend, yend);
		    }
	    HttpSession session = request.getSession();  //���浽session
		session.setAttribute("verificationCode", sb.toString());
		ImageIO.write(bfi, "JPG", response.getOutputStream());  //д�������
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	/**
	   * ��ȡ�������ɫֵ��r,g,b��ȡֵ��Low��High֮��
	   * @param L ������
	   * @param R ������
	   * @return ���������ɫֵ
	   */
	  private static Color interLine(int Low, int High){
	    if(Low > 255)
	    	Low = 255;
	    if(High > 255)
	    	High = 255;
	    if(Low < 0)
	    	Low = 0;
	    if(High < 0)
	    	High = 0;
	    int interval = High - Low; 
	    int r = Low + (int)(Math.random() * interval);
	    int g = Low + (int)(Math.random() * interval);
	    int b = Low + (int)(Math.random() * interval);
	    return new Color(r, g, b);
	  }

}