package entity;

public class Major {
	private String major_id,major_name,college_id;
	public Major() {
		
	}
	public Major(String major_id, String major_name, String college_id) {
		super();
		this.major_id = major_id;
		this.major_name = major_name;
		this.college_id = college_id;
	}
	public String getMajor_id() {
		return major_id;
	}
	public void setMajor_id(String major_id) {
		this.major_id = major_id;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public String getCollege_id() {
		return college_id;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}
	
}
