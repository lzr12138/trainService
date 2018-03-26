package rml.model;

public class Train {
	
	private String id;
	private String startstation;
	private String endstation;
	private String startstationname;
	private String endstationname;
	private String starttime;
	private String endtime;
	private String runtime;
	private int cellnum;
	
	public int getCellnum() {
		return cellnum;
	}
	public void setCellnum(int cellnum) {
		this.cellnum = cellnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStartstation() {
		return startstation;
	}
	public void setStartstation(String startstation) {
		this.startstation = startstation;
	}
	public String getEndstation() {
		return endstation;
	}
	public void setEndstation(String endstation) {
		this.endstation = endstation;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getStartstationname() {
		return startstationname;
	}
	public void setStartstationname(String startstationname) {
		this.startstationname = startstationname;
	}
	public String getEndstationname() {
		return endstationname;
	}
	public void setEndstationname(String endstationname) {
		this.endstationname = endstationname;
	}

}
