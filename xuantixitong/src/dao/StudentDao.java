package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;


import entity.Student;

public class StudentDao {
	public List<Student> queryCustomers(int pageNum, String s0,String s1,String s2,String s3,String s4) {
		List<Student> clist = new ArrayList<Student>();
		int firstIndex=0;
		int pageSize=10;
		String sql="select * from(select a.*,rownum rn from(select * from stu_info order by stu_id)a "+s0+s1+s2+s3+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		//String sql="select * from(select a.*,rownum rn from(select * from stu_info order by stu_id)a where rownum<=("+firstIndex+pageSize*pageNum+")) where rn>"+firstIndex+pageSize*(pageNum-1)+" "+s0+s1+s2+s3+s4;
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		System.out.println(sql);
		for(Object[] arr:dblist){
			Student cus=new Student();
			cus.setStu_id(arr[0].toString());
			cus.setStu_name(arr[1].toString());
			cus.setStu_phone(arr[2].toString());
			cus.setStu_sex(arr[3].toString());
			cus.setStu_pwd(arr[4].toString());
			cus.setStu_address(arr[5].toString());
			cus.setClass_id(arr[6].toString());
			cus.setMajor_id(arr[7].toString());
			
			
			clist.add(cus);
		}
		return clist;
	}
	public Student queryStudentById(String id) throws Exception {
		Student stu = null;
		String sql = "select * from stu_info where stu_id='" + id + "'";
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		if(dblist.size()>0){
			stu = new Student();
		    Object[] arr=dblist.get(0);
		    stu.setStu_id(arr[0].toString());
		    stu.setStu_name(arr[1].toString());
			stu.setStu_phone(arr[2].toString());
			stu.setStu_sex(arr[3].toString());
			stu.setStu_pwd(arr[4].toString());
			stu.setStu_address(arr[5].toString());
			stu.setClass_id(arr[6].toString());
			stu.setMajor_id(arr[7].toString());
			
		}		
		return stu;
	}
	public int addstudent(Student stu) {
		String sql = "insert into stu_info values('" + stu.getStu_id() + "','" + stu.getStu_name() + "','" + stu.getStu_phone()+ "','"
				+ stu.getStu_sex() + "','"+stu.getStu_pwd() + "','"+stu.getStu_address() + "','"+stu.getClass_id()+ "','"+stu.getMajor_id()+"')";
		/*String sql = "insert into customers values(?,?,?)";
		return SQLHelper.executeUpdateByParams(sql, cus.getId(),cus.getName(),cus.getPhone());
	    */
		System.out.println(sql);
		return DBHelper.executeUpdate(sql);
	}
	public int deleteStudent(String stu_id) {
		String sql="delete from stu_info where stu_id="+stu_id;
		return DBHelper.executeUpdate(sql);
	}
	public int alterstudent(Student stu) {
		String sql="update stu_info set stu_name='"+stu.getStu_name()+
				"',stu_sex='"+stu.getStu_sex()+"',stu_phone='"+stu.getStu_phone()+"',stu_pwd='"+stu.getStu_pwd()+
				"',stu_address='"+stu.getStu_address()+"',class_id='"+stu.getClass_id()+"',major_id='"+stu.getMajor_id()+
				"' where stu_id='"+stu.getStu_id()+"'";
		System.out.println(sql);
		return DBHelper.executeUpdate(sql);
	}
	public boolean isStuExists(String id){
		boolean flag=false;
		String sql="select count(*) from stu_info where stu_id='"+id+"'";
		System.out.println(sql);
		Object obj=DBHelper.executeSingleQuery(sql);
		if(Integer.parseInt(obj.toString())>0) {
			flag=true;
		}
		return flag;
	}
   
   
}
