package entity;

public class Student {
	private String stu_id,stu_name,stu_phone,stu_sex,stu_pwd,stu_address,class_id,major_id;
	public Student() {
		
	}
	public Student(String stu_id, String stu_name, String stu_phone, String stu_sex, String stu_pwd, String stu_address,
			String class_id, String major_id) {
		super();
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_phone = stu_phone;
		this.stu_sex = stu_sex;
		this.stu_pwd = stu_pwd;
		this.stu_address = stu_address;
		this.class_id = class_id;
		this.major_id = major_id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_phone() {
		return stu_phone;
	}
	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}
	public String getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public String getStu_pwd() {
		return stu_pwd;
	}
	public void setStu_pwd(String stu_pwd) {
		this.stu_pwd = stu_pwd;
	}
	public String getStu_address() {
		return stu_address;
	}
	public void setStu_address(String stu_address) {
		this.stu_address = stu_address;
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
	
}
