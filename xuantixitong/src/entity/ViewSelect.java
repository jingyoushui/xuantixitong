package entity;

public class ViewSelect {
	private String stu_id,stu_name,class_id, major_name,college_name,proj_id,proj_name,
	tea_id,proj_type,proj_grade,zhiyuan,is_pass;
	
	public ViewSelect() {
		
	}
	public ViewSelect(String stu_id, String stu_name, String class_id, String major_name, String college_name,
			String proj_id, String proj_name, String tea_id, String proj_type, String proj_grade,String zhiyuan,String is_pass) {
		super();
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.class_id = class_id;
		this.major_name = major_name;
		this.college_name = college_name;
		this.proj_id = proj_id;
		this.proj_name = proj_name;
		this.tea_id = tea_id;
		this.proj_type = proj_type;
		this.proj_grade = proj_grade;
		this.zhiyuan = zhiyuan;
		this.is_pass = is_pass;
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

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public String getMajor_name() {
		return major_name;
	}

	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}

	public String getCollege_name() {
		return college_name;
	}

	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}

	public String getProj_id() {
		return proj_id;
	}

	public void setProj_id(String proj_id) {
		this.proj_id = proj_id;
	}

	public String getProj_name() {
		return proj_name;
	}

	public void setProj_name(String proj_name) {
		this.proj_name = proj_name;
	}

	public String getTea_id() {
		return tea_id;
	}

	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}

	public String getProj_type() {
		return proj_type;
	}

	public void setProj_type(String proj_type) {
		this.proj_type = proj_type;
	}

	public String getProj_grade() {
		return proj_grade;
	}

	public void setProj_grade(String proj_grade) {
		this.proj_grade = proj_grade;
	}
	public String getZhiyuan() {
		return zhiyuan;
	}
	public void setZhiyuan(String zhiyuan) {
		this.zhiyuan = zhiyuan;
	}
	public String getIs_pass() {
		return is_pass;
	}
	public void setIs_pass(String is_pass) {
		this.is_pass = is_pass;
	}

}
