package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import entity.News;
import entity.Student;


public class NewsDao {
	public int addNews(News news) {
		String sql = "insert into news values('" + news.getTitle() + "','" + news.getDetail() + "','" + news.getWriter()+ "','"
				+ news.getTime()+"',null)";
		return DBHelper.executeUpdate(sql);
	}
	public List<News> queryNews() {
		List<News> clist = new ArrayList<News>();
		String sql="select  * from news where rownum<=8 order by id desc";
		System.out.println(sql);
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
	
		for(Object[] arr:dblist){
			News cus=new News();
			cus.setTitle(arr[0].toString());
			cus.setDetail(arr[1].toString());
			cus.setWriter(arr[2].toString());
			cus.setTime(arr[3].toString());
			cus.setId(Integer.parseInt(arr[4].toString()));
			
			clist.add(cus);
		}
		return clist;
	}
	public News queryNewsById(int id){
		News n = null;
		String sql = "select * from news where id=" + id;
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		if(dblist.size()>0){
			n = new News();
		    Object[] arr=dblist.get(0);
		    n.setTitle(arr[0].toString());
		    n.setDetail(arr[1].toString());
			n.setWriter(arr[2].toString());
			n.setTime(arr[3].toString());
		
		}		
		return n;
	}

}
