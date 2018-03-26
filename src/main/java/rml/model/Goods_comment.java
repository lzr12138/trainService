package rml.model;

public class Goods_comment {
	
	private String id ;
	private String goods_id;
	private String comment_date;
	private String comment_user;
	private String content;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_user() {
		return comment_user;
	}
	public void setComment_user(String comment_user) {
		this.comment_user = comment_user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
