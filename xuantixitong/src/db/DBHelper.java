package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBHelper {
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static String user = "c##lixingxing", pwd = "1234";
	private static Connection conn;
	static {
		try {
			Class.forName(driver);
		} catch (Exception ex) {
            ex.printStackTrace();
		}
	}
	public static void closeConnection(){
		try {
		  if(conn!=null && !conn.isClosed())
		    conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public static List<Object[]> executeQueryList(String sql){
		List<Object[]> list=new ArrayList<Object[]>();
		ResultSet rs=null;
		try {
		    conn = DriverManager.getConnection(url, user, pwd);
			Statement cmd = conn.createStatement();
			rs=cmd.executeQuery(sql);
			ResultSetMetaData metaRs= rs.getMetaData();
			int colsNum=metaRs.getColumnCount();
			while(rs.next()){
				Object[] arr=new Object[colsNum];
				for(int i=0;i<arr.length;i++)
					arr[i]=rs.getObject(i+1);
				list.add(arr);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	public static ResultSet executeQuery(String sql){
		ResultSet rs=null;
		try {
		    conn = DriverManager.getConnection(url, user, pwd);
			Statement cmd = conn.createStatement();
			rs=cmd.executeQuery(sql);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}
	public static int executeUpdateByParams(String sql,Object... params){//可变参数
		int r=0;
		try {
			 Connection conn = DriverManager.getConnection(url, user, pwd);
			 PreparedStatement cmd=conn.prepareStatement(sql);
			 for(int i=0;i<params.length;i++){
				if(params[i] instanceof String)
					cmd.setString(i+1, params[i].toString());
				else if(params[i] instanceof Integer)
					cmd.setInt(i+1, (Integer)params[i]);
				else if(params[i] instanceof Double)
					cmd.setDouble(i+1, (Double)params[i]);
				else
					cmd.setObject(i+1, params[i]);
			 }
			 r=cmd.executeUpdate();
			 conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return r;
	}
	public static int executeUpdate(String sql){
		int r=0;
		try {
			Connection conn = DriverManager.getConnection(url, user, pwd);
			Statement cmd = conn.createStatement();
			r=cmd.executeUpdate(sql);
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return r;
	}
	public static Object executeSingleQuery(String sql){
		Object obj=null;
		try {
			Connection conn = DriverManager.getConnection(url, user, pwd);
			Statement cmd = conn.createStatement();
			ResultSet rs=cmd.executeQuery(sql);
			if(rs.next())
				obj=rs.getObject(1);
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return obj;
	}
}