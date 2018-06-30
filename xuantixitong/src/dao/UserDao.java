package dao;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import entity.Teacher;
public class UserDao {
    public boolean login(String uid,String pwd,String type) {
    	boolean r=false;
    	String sql="";
    	if(type.equals("student")) {
    		 sql = "select stu_pwd from stu_info where stu_id="+uid;
    		
    	}else if(type.equals("teacher")){
    		 sql = "select tea_pwd from tea_info where tea_id="+uid;
    		 
    		 
    	}else if(type.equals("admin")){
   		 sql = "select office_pwd from office_info where office_id='"+uid+"'";
   		 System.out.println(sql);
    	}
    	List<Object[]> dblist=DBHelper.executeQueryList(sql);
    	if(!dblist.isEmpty()) {
    		for(Object[] arr:dblist){
    			if(arr[0].toString().equals(pwd)) {
    				r=true;
    			}
    		}
    	}
    
    	
    	return r;
    }
   
}
