package rml.model;

public class Change {
	
	private String id;
	private String changeuserid;
	private String bechangeuserid;
	private String changeticketid;
	private String bechangeticketid;
	private ticket changeticket;
	private ticket bechangeticket;
	private String reason;
	private String status;
	private String react;
	private String date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChangeuserid() {
		return changeuserid;
	}
	public void setChangeuserid(String changeuserid) {
		this.changeuserid = changeuserid;
	}
	public String getBechangeuserid() {
		return bechangeuserid;
	}
	public void setBechangeuserid(String bechangeuserid) {
		this.bechangeuserid = bechangeuserid;
	}
	public String getChangeticketid() {
		return changeticketid;
	}
	public void setChangeticketid(String changeticketid) {
		this.changeticketid = changeticketid;
	}
	public String getBechangeticketid() {
		return bechangeticketid;
	}
	public void setBechangeticketid(String bechangeticketid) {
		this.bechangeticketid = bechangeticketid;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReact() {
		return react;
	}
	public void setReact(String react) {
		this.react = react;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public ticket getChangeticket() {
		return changeticket;
	}
	public void setChangeticket(ticket changeticket) {
		this.changeticket = changeticket;
	}
	public ticket getBechangeticket() {
		return bechangeticket;
	}
	public void setBechangeticket(ticket bechangeticket) {
		this.bechangeticket = bechangeticket;
	}
	
	

}
