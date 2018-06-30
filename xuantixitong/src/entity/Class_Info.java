package entity;

public class Class_Info {
	private String class_id,major_id;
	private int class_count;
	public Class_Info() {
		
	}
	public Class_Info(String class_id, String major_id, int class_count) {
		super();
		this.class_id = class_id;
		this.major_id = major_id;
		this.class_count = class_count;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getMajor_id() {
		return major_id;
	}
	public void setMajor_id(String major_id) {
		this.major_id = major_id;
	}
	public int getClass_count() {
		return class_count;
	}
	public void setClass_count(int class_count) {
		this.class_count = class_count;
	}
	
}
