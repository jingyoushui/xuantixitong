package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;


import entity.Teacher;

public class TeacherDao {
	public List<Teacher> queryCustomers(int pageNum, String s0,String s1,String s2,String s3,String s4) {
		List<Teacher> clist = new ArrayList<Teacher>();
		int firstIndex=0;
		int pageSize=10;
		String sql="select * from(select a.*,rownum rn from(select * from tea_info order by tea_id)a "+s0+s1+s2+s3+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		//String sql="select * from(select a.*,rownum rn from(select * from tea_info order by tea_id)a where rownum<=("+firstIndex+pageSize*pageNum+")) where rn>"+firstIndex+pageSize*(pageNum-1)+" "+s0+s1+s2+s3+s4;
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		System.out.println(sql);
		for(Object[] arr:dblist){
			Teacher cus=new Teacher();
			cus.setTea_id(arr[0].toString());
			cus.setTea_name(arr[1].toString());
			cus.setTea_sex(arr[2].toString());
			cus.setTea_phone(arr[3].toString());
			cus.setTea_pwd(arr[4].toString());
			
			cus.setTea_lesson(arr[5].toString());
			cus.setMajor_id(arr[6].toString());
			
			clist.add(cus);
		}
		return clist;
	}
	public Teacher queryTeacherById(String id) throws Exception {
		Teacher tea = null;
		String sql = "select * from tea_info where tea_id='" + id + "'";
		System.out.println(sql);
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		if(dblist.size()>0){
			tea = new Teacher();
		    Object[] arr=dblist.get(0);
		    tea.setTea_id(arr[0].toString());
		    tea.setTea_name(arr[1].toString());
			tea.setTea_sex(arr[2].toString());
			tea.setTea_phone(arr[3].toString());
			tea.setTea_pwd(arr[4].toString());
			tea.setTea_lesson(arr[5].toString());
			tea.setMajor_id(arr[6].toString());
		}		
		return tea;
	}
	public List<Teacher> queryTeacherSelect(String sql) {//×éºÏ²éÑ¯
		List<Teacher> clist = new ArrayList<Teacher>();
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		for(Object[] arr:dblist){
			Teacher cus=new Teacher();
			cus.setTea_id(arr[0].toString());
			cus.setTea_name(arr[1].toString());
			cus.setTea_sex(arr[2].toString());
			cus.setTea_phone(arr[3].toString());
			cus.setTea_pwd(arr[4].toString());
			
			cus.setTea_lesson(arr[5].toString());
			cus.setMajor_id(arr[6].toString());
			
			clist.add(cus);
		}
		return clist;
	}
	public int addTeacher(Teacher tea) {
		String sql = "insert into tea_info values('" + tea.getTea_id() + "','" + tea.getTea_name() + "','" + tea.getTea_sex()+ "','"
				+ tea.getTea_phone() + "','"+tea.getTea_pwd() + "','"+tea.getTea_lesson() + "','"+tea.getMajor_id()+"')";
		/*String sql = "insert into customers values(?,?,?)";
		return SQLHelper.executeUpdateByParams(sql, cus.getId(),cus.getName(),cus.getPhone());
	    */
		return DBHelper.executeUpdate(sql);
	}
	public int deleteTeacher(String tea_id) {
		String sql="delete from tea_info where tea_id="+tea_id;
		return DBHelper.executeUpdate(sql);
	}
	public int alterTeacher(Teacher tea) {
		String sql="update tea_info set tea_name='"+tea.getTea_name()+
				"',tea_sex='"+tea.getTea_sex()+"',tea_phone='"+tea.getTea_phone()+"',tea_pwd='"+tea.getTea_pwd()+
				"',tea_lesson='"+tea.getTea_lesson()+"',major_id='"+tea.getMajor_id()+
				"' where tea_id='"+tea.getTea_id()+"'";
		return DBHelper.executeUpdate(sql);
	}
	public boolean isTeaExists(String id){
		boolean flag=false;
		String sql="select count(*) from tea_info where tea_id='"+id+"'";
		System.out.println(sql);
		Object obj=DBHelper.executeSingleQuery(sql);
		if(Integer.parseInt(obj.toString())>0) {
			flag=true;
		}
		System.out.println(sql);
		return flag;
	}
   
}
