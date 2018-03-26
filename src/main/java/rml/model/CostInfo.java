package rml.model;

public class CostInfo {
	
	private String id;
	private String userid;
	private String username;
	private String goodsid;
	private String goodsname;
	private String ticketid;
	private String trainid;
	private int sum;
	private double total;
	private String date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTicketid() {
		return ticketid;
	}
	public void setTicketid(String ticketid) {
		this.ticketid = ticketid;
	}
	public String getTrainid() {
		return trainid;
	}
	public void setTrainid(String trainid) {
		this.trainid = trainid;
	}
	
}
