package rml.model;

public class Reply {
	
	private String id;
	private String comment_id;
	private String reply_username;
	private String content;
	private String be_reply_username;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getReply_username() {
		return reply_username;
	}
	public void setReply_username(String reply_username) {
		this.reply_username = reply_username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBe_reply_username() {
		return be_reply_username;
	}
	public void setBe_reply_username(String be_reply_username) {
		this.be_reply_username = be_reply_username;
	}

}
