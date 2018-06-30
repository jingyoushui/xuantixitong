package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import entity.Office;
import entity.Student;

public class AdminDao {
	public List<Office> queryAdmin() {
		List<Office> clist = new ArrayList<Office>();
		String sql = "select * from tea_info";
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		for(Object[] arr:dblist){
			Office cus=new Office();
			cus.setOffice_id(arr[0].toString());
			cus.setOffice_pwd(arr[1].toString());
			cus.setCollege_id(arr[2].toString());
			clist.add(cus);
		}
		return clist;
	}
	public List<Office> queryAdminByid(String id) {
		List<Office> clist = new ArrayList<Office>();
		String sql = "select * from office_info where office_id='"+id+"'";
		List<Object[]> dblist=DBHelper.executeQueryList(sql);
		for(Object[] arr:dblist){
			Office cus=new Office();
			cus.setOffice_id(arr[0].toString());
			cus.setOffice_pwd(arr[1].toString());
			cus.setCollege_id(arr[2].toString());
			clist.add(cus);
		}
		return clist;
	}
	public int alterAdmin(String pwd,String id) {
		String sql="update office_info set office_pwd="+pwd+" where office_id="+id;
		System.out.println(sql);
		return DBHelper.executeUpdate(sql);
	}

}
