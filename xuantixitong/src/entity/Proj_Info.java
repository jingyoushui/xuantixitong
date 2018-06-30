package entity;

public class Proj_Info {
	private String proj_id,proj_name,proj_type,proj_grade,proj_accessory,tea_id;
	private int proj_zhuang;
	public Proj_Info() {
		
	}
	public Proj_Info(String proj_id, String proj_name, String proj_type, String proj_grade, String proj_accessory,
			String tea_id, int proj_zhuang) {
		super();
		this.proj_id = proj_id;
		this.proj_name = proj_name;
		this.proj_type = proj_type;
		this.proj_grade = proj_grade;
		this.proj_accessory = proj_accessory;
		this.tea_id = tea_id;
		this.proj_zhuang = proj_zhuang;
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
	public String getProj_accessory() {
		return proj_accessory;
	}
	public void setProj_accessory(String proj_accessory) {
		this.proj_accessory = proj_accessory;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public int getProj_zhuang() {
		return proj_zhuang;
	}
	public void setProj_zhuang(int proj_zhuang) {
		this.proj_zhuang = proj_zhuang;
	}
	
}
