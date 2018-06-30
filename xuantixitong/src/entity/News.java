package entity;

public class News {
	private String title;
	private String detail;
	private String writer,time;
	private int id;
	public News() {
		
	}
	public News(String title, String detail, String writer, String time,int id) {
		super();
		this.title = title;
		this.detail = detail;
		this.writer = writer;
		this.time = time;
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
