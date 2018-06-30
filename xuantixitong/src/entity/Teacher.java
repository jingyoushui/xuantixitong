package entity;

public class Teacher {
	private String tea_id,tea_name,tea_sex,tea_phone,tea_pwd,tea_lesson,major_id;
    public Teacher() {
    	
    }
	
	public Teacher(String tea_id, String tea_name, String tea_sex, String tea_phone, String tea_pwd, String tea_lesson,
			String major_id) {
		super();
		this.tea_id = tea_id;
		this.tea_name = tea_name;
		this.tea_sex = tea_sex;
		this.tea_phone = tea_phone;
		this.tea_pwd = tea_pwd;
		this.tea_lesson = tea_lesson;
		this.major_id = major_id;
	}

	public String getTea_id() {
		return tea_id;
	}

	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public String getTea_sex() {
		return tea_sex;
	}

	public void setTea_sex(String tea_sex) {
		this.tea_sex = tea_sex;
	}

	public String getTea_phone() {
		return tea_phone;
	}

	public void setTea_phone(String tea_phone) {
		this.tea_phone = tea_phone;
	}

	public String getTea_pwd() {
		return tea_pwd;
	}

	public void setTea_pwd(String tea_pwd) {
		this.tea_pwd = tea_pwd;
	}

	public String getTea_lesson() {
		return tea_lesson;
	}

	public void setTea_lesson(String tea_lesson) {
		this.tea_lesson = tea_lesson;
	}

	public String getMajor_id() {
		return major_id;
	}

	public void setMajor_id(String major_id) {
		this.major_id = major_id;
	}
}
