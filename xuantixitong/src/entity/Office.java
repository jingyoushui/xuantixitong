package entity;

public class Office {
	private String office_id,office_pwd,college_id;
	public Office() {
		
	}
	public Office(String office_id, String office_pwd, String college_id) {
		super();
		this.office_id = office_id;
		this.office_pwd = office_pwd;
		this.college_id = college_id;
	}
	public String getOffice_id() {
		return office_id;
	}
	public void setOffice_id(String office_id) {
		this.office_id = office_id;
	}
	public String getOffice_pwd() {
		return office_pwd;
	}
	public void setOffice_pwd(String office_pwd) {
		this.office_pwd = office_pwd;
	}
	public String getCollege_id() {
		return college_id;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}
	

}
