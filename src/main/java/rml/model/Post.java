package rml.model;

public class Post {
	
	private String id;
	private String title;
	private String type;
	private String content;
	private String publicUser;
	private String date;
	private String publicUserId;
	private int clicknum;
	private String trainid;
	
	
	public int getClicknum() {
		return clicknum;
	}
	public void setClicknum(int clicknum) {
		this.clicknum = clicknum;
	}
	public String getTrainid() {
		return trainid;
	}
	public void setTrainid(String trainid) {
		this.trainid = trainid;
	}
	public String getPublicUserId() {
		return publicUserId;
	}
	public void setPublicUserId(String publicUserId) {
		this.publicUserId = publicUserId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPublicUser() {
		return publicUser;
	}
	public void setPublicUser(String publicUser) {
		this.publicUser = publicUser;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

}
