package rml.dao;

import java.util.List;
import java.util.Map;

import rml.model.Cell;
import rml.model.Chair;
import rml.model.Change;
import rml.model.Station;
import rml.model.Train;
import rml.model.ticket;
import rml.model.timetable;

public interface TrainMapper {
	
	List<Train> allTrainForFirst();
	
	List<Train> allTrain(Map<String,Object> map);
	
	int getCount(Map<String ,Object> map);
	
	Train selectTrainById(String trainid);
	
	List<Cell> selectCellByTrainId(String trainid);
	
	Station getStation(String stationid);
	
	List<ticket> selectTicketByUserIdBuy(String userid);
	
	List<timetable> selectStationByTrainId(String trainid);
	
	List<timetable> selectTrainByTStationId(String stationid);
	
	Cell selectCellById(String cellid);
	
	List<Chair> selectChairByCellId(String cellid);
	
	List<Train> getStart(String stationid);
	
	List<Train> getEnd(String stationid);
	
	List<ticket> getTicketByTrainUserId(String trainid, String userid);
	
	void insertTicket(ticket ticket);
	
	Integer getCellRecord(String trainid,int cellid, String date);
	
	int getChairRecord(String trainid,int cellid,int chairid, String date);
	
	Chair selectChairById(String chairid);
	
	List<ticket> getTicketByChairidUserId(String trainid,int cellid,int chairid, String date);
	
	void insertChange(Change change);
	
	List<ticket> selectTicketByUserId(Map<String,Object> map);
	
	int getCountuser(Map<String,Object> map);
	
	ticket selectTicketById(String id);
	
	void deleteChairByCellId(String id);
	
	void deleteCellByTrainId(String id);
	
	void deleteTrainById(String id);
	
	List<Station> getAllStation();
	
	void deleteTimetableByTrainId(String trainid);
	
	void insertCell(Cell cell);
	
	void insertChair(Chair chair);
	
	void insertTrain(Train train);
	
	List<timetable> getTimetableByTrainid(Map<String,Object> map);
	
	List<timetable> selectTimetableByTrainid(String trainid);
	
	int getTimeCount(Map<String,Object> map);
	
	void insertTimeTable(timetable ti);
	
	List<Station> getAllStationForUI(Map<String,Object> map);
	
	int getStationCount(Map<String,Object> map);
	
	void insertStation(Station station);
	
	void updateStation(Station station);
	
	void deleteTimetableById(String id);
	
}
