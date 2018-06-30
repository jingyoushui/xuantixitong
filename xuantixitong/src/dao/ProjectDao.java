package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import entity.Proj_Info;
import entity.Proj_Info;

public class ProjectDao {
	public List<Proj_Info> queryCustomers(int pageNum, String s0,String s1,String s2,String s3,String s4) {
		List<Proj_Info> clist = new ArrayList<Proj_Info>();
		int firstIndex=0;
		int pageSize=10;
		String sql="select * from(select a.*,rownum rn from(select * from proj_info order by proj_id)a "+s0+s1+s2+s3+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		System.out.println(sql);
		for(Object[] arr:dblist){
			Proj_Info cus=new Proj_Info();
			cus.setProj_id(arr[0].toString());
			cus.setProj_name(arr[1].toString());
			cus.setProj_type(arr[2].toString());
			cus.setProj_grade(arr[3].toString());
			cus.setProj_accessory(arr[4].toString());
			
			cus.setTea_id(arr[5].toString());
			cus.setProj_zhuang(Integer.parseInt(arr[6].toString()));
			
			clist.add(cus);
		}
		return clist;
	}
	public List<Proj_Info> queryProject(String s3,int pageNum, String s0,String s1,String s2,String s4) {
		List<Proj_Info> clist = new ArrayList<Proj_Info>();
		int firstIndex=0;
		int pageSize=10;
		           
		String sql="select * from(select a.*,rownum rn from(select * from proj_info where tea_id in(select tea_id from tea_info where major_id =( select major_id from stu_info where stu_id="+s3+")) order by proj_id)a "+s0+s1+s2+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		//String sql="select * from(select a.*,rownum rn from(select * from proj_info where tea_id in(select tea_id from tea_info where major_id =( select major_id from stu_info where stu_id="+s3+")) order by proj_id)a where rownum<=("+firstIndex+pageSize*pageNum+")) where rn>"+firstIndex+pageSize*(pageNum-1)+" "+s0+s1+s2+s4;
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		System.out.println("queryProject  "+sql);
		for(Object[] arr:dblist){
			Proj_Info cus=new Proj_Info();
			cus.setProj_id(arr[0].toString());
			cus.setProj_name(arr[1].toString());
			cus.setProj_type(arr[2].toString());
			cus.setProj_grade(arr[3].toString());
			cus.setProj_accessory(arr[4].toString());
			
			cus.setTea_id(arr[5].toString());
			cus.setProj_zhuang(Integer.parseInt(arr[6].toString()));
			
			clist.add(cus);
		}
		return clist;
	}
	public Proj_Info queryProj_InfoById(String id) throws Exception {
		Proj_Info proj = null;
		String sql = "select * from proj_info where proj_id='" + id + "'";
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		if(dblist.size()>0){
			proj = new Proj_Info();
		    Object[] arr=dblist.get(0);
		    proj.setProj_id(arr[0].toString());
			proj.setProj_name(arr[1].toString());
			proj.setProj_type(arr[2].toString());
			proj.setProj_grade(arr[3].toString());
			proj.setProj_accessory(arr[4].toString());
			
			proj.setTea_id(arr[5].toString());
			proj.setProj_zhuang(Integer.parseInt(arr[6].toString()));
		}		
		return proj;
	}
	public List<Proj_Info> queryProj_InfoSelect(String sql) {//组合查询
		List<Proj_Info> clist = new ArrayList<Proj_Info>();
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		for(Object[] arr:dblist){
			Proj_Info proj=new Proj_Info();
			proj.setProj_id(arr[0].toString());
			proj.setProj_name(arr[1].toString());
			proj.setProj_type(arr[2].toString());
			proj.setProj_grade(arr[3].toString());
			proj.setProj_accessory(arr[4].toString());
			
			proj.setTea_id(arr[5].toString());
			proj.setProj_zhuang(Integer.parseInt(arr[6].toString()));
			
			clist.add(proj);
		}
		return clist;
	}
	public int addProj_Info(Proj_Info proj) {
		String sql = "insert into proj_info values('" + proj.getProj_id() + "','" + proj.getProj_name() + "','" + proj.getProj_type()+ "','"
				+ proj.getProj_grade() + "','"+proj.getProj_accessory() + "','"+proj.getTea_id() + "','"+proj.getProj_zhuang()+"')";
		/*String sql = "insert into customers values(?,?,?)";
		return SQLHelper.executeUpdateByParams(sql, cus.getId(),cus.getName(),cus.getPhone());
	    */
		return DBHelper.executeUpdate(sql);
	}
	public int deleteProj_Info(String proj_id) {
		String sql="delete from proj_info where proj_id="+proj_id;
		return DBHelper.executeUpdate(sql);
	}
	public int alterProj_Info(Proj_Info proj) {
		String sql="update proj_info set proj_name='"+proj.getProj_name()+
				"',proj_type='"+proj.getProj_type()+"',proj_grade='"+proj.getProj_grade()+"',proj_accessory='"+proj.getProj_accessory()+"',Proj_zhuang='"+proj.getProj_zhuang()+
				"' where proj_id='"+proj.getProj_id()+"'";
		System.out.println(sql);
	
		return DBHelper.executeUpdate(sql);
	}
	
	//选课信息添加
	public int addProjSelect(String s1,String s2) {
		//String sql = "insert into sel_topic_info values(?,?)"+s1+","+s2;
		
		String sql = "insert into sel_topic_info values(?,?)";
		System.out.println(sql);
		return DBHelper.executeUpdateByParams(sql, s1,s2);
	    
		//return DBHelper.executeUpdate(sql);
	}
	public int alterProjSelectZhiyuan(String s1,int s2,int s3) {
		String sql="update proj_zhiyuan set is_pass="+s3+
				" where stu_id='"+s1+"' and zhiyuan="+s2;
		System.out.println(sql);
		return DBHelper.executeUpdate(sql);
	}
	public int addProjSelectZhiyuan(String s1,String s2,int s3,int s4) {
		//String sql = "insert into sel_topic_info values(?,?)"+s1+","+s2;
		
		String sql = "insert into proj_zhiyuan values(?,?,?,?)";
		System.out.println(sql);
		return DBHelper.executeUpdateByParams(sql, s1,s2,s3,s4);
	    
		//return DBHelper.executeUpdate(sql);
	}
	public int deleteProjSelect(String proj_id,String stu_id) {
		String sql="delete from sel_topic_info where proj_id="+proj_id +"and stu_id="+stu_id;
		return DBHelper.executeUpdate(sql);
	}
	public boolean isProjExists(String id){
		boolean flag=false;
		String sql="select count(*) from proj_info where proj_id='"+id+"'";
		System.out.println(sql);
		Object obj=DBHelper.executeSingleQuery(sql);
		if(Integer.parseInt(obj.toString())>0) {
			flag=true;
		}
		return flag;
	}
   
}
