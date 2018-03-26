package rml.model;

public class timetable {
	
	private String id;
	private String trainid;
	private String stationid;
	private String stationname;
	private String intime;
	private String outtime;
	private String stoptime;
	private int numfortrain;
	private Train train;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTrainid() {
		return trainid;
	}
	public void setTrainid(String trainid) {
		this.trainid = trainid;
	}
	public String getStationid() {
		return stationid;
	}
	public void setStationid(String stationid) {
		this.stationid = stationid;
	}
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	public String getOuttime() {
		return outtime;
	}
	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}
	public String getStoptime() {
		return stoptime;
	}
	public void setStoptime(String stoptime) {
		this.stoptime = stoptime;
	}
	public int getNumfortrain() {
		return numfortrain;
	}
	public void setNumfortrain(int numfortrain) {
		this.numfortrain = numfortrain;
	}
	public String getStationname() {
		return stationname;
	}
	public void setStationname(String stationname) {
		this.stationname = stationname;
	}
	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}
	

}
