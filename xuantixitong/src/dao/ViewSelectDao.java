package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import entity.ViewSelect;

public class ViewSelectDao {
	public List<ViewSelect> queryCustomers(int pageNum, String s0,String s1,String s2,String s3,String s4) {
		List<ViewSelect> clist = new ArrayList<ViewSelect>();
		int firstIndex=0;
		int pageSize=10;
		String sql="select * from(select a.*,rownum rn from(select * from view_sel_detail order by stu_id)a "+s0+s1+s2+s3+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		//String sql="select * from(select a.*,rownum rn from(select * from view_sel_detail order by stu_id)a where "+s1+s2+s3+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		//String sql="select * from(select a.*,rownum rn from(select * from view_sel_detail order by stu_id)a where rownum<=("+firstIndex+pageSize*pageNum+")) where rn>"+firstIndex+pageSize*(pageNum-1)+" "+s0+s1+s2+s3+s4;
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		System.out.println(sql);
		for(Object[] arr:dblist){
			ViewSelect cus=new ViewSelect();
			cus.setStu_id(arr[0].toString());
			cus.setStu_name(arr[1].toString());
			cus.setClass_id(arr[2].toString());
			cus.setMajor_name(arr[3].toString());
			cus.setCollege_name(arr[4].toString());
			cus.setProj_id(arr[5].toString());
			cus.setProj_name(arr[6].toString());
			cus.setTea_id(arr[7].toString());
			cus.setProj_type(arr[8].toString());
			cus.setProj_grade(arr[9].toString());
			clist.add(cus);
		}
		return clist;
	}
	public List<ViewSelect> queryCustomers2(int pageNum, String s0,String s1,String s2,String s3,String s4) {
		List<ViewSelect> clist = new ArrayList<ViewSelect>();
		int firstIndex=0;
		int pageSize=10;
		String sql="select * from(select a.*,rownum rn from(select * from view_sel_zhiyuan order by stu_id)a "+s0+s1+s2+s3+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		//String sql="select * from(select a.*,rownum rn from(select * from view_sel_zhiyuan order by stu_id)a where "+s1+s2+s3+s4+")where rownum<=("+firstIndex+pageSize*pageNum+") and rn>"+firstIndex+pageSize*(pageNum-1);
		//String sql="select * from(select a.*,rownum rn from(select * from view_sel_zhiyuan order by stu_id)a where rownum<=("+firstIndex+pageSize*pageNum+")) where rn>"+firstIndex+pageSize*(pageNum-1)+" "+s0+s1+s2+s3+s4;
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		System.out.println(sql);
		for(Object[] arr:dblist){
			ViewSelect cus=new ViewSelect();
			cus.setStu_id(arr[0].toString());
			cus.setStu_name(arr[1].toString());
			cus.setClass_id(arr[2].toString());
			cus.setMajor_name(arr[3].toString());
			cus.setCollege_name(arr[4].toString());
			cus.setProj_id(arr[5].toString());
			cus.setProj_name(arr[6].toString());
			cus.setTea_id(arr[7].toString());
			cus.setProj_type(arr[8].toString());
			cus.setProj_grade(arr[9].toString());
			cus.setZhiyuan(arr[10].toString());
			cus.setIs_pass(arr[11].toString());
			clist.add(cus);
		}
		return clist;
	}
}
