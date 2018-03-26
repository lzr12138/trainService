package rml.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rml.dao.TrainMapper;
import rml.model.Cell;
import rml.model.Chair;
import rml.model.Change;
import rml.model.Station;
import rml.model.Train;
import rml.model.ticket;
import rml.model.timetable;

@Service("trainService")
public class TrainServiceImpl implements TrainServiceI{
	
	private TrainMapper trainMapper;

	public TrainMapper getTrainMapper() {
		return trainMapper;
	}

	@Autowired
	public void setTrainMapper(TrainMapper trainMapper) {
		this.trainMapper = trainMapper;
	}

	@Override
	public List<Train> allTrainForFirst() {
		return trainMapper.allTrainForFirst();
	}

	@Override
	public List<Train> allTrain(Map<String,Object> map) {
		return trainMapper.allTrain(map);
	}

	@Override
	public Train selectTrainById(String trainid) {
		return trainMapper.selectTrainById(trainid);
	}

	@Override
	public List<Cell> selectCellByTrainId(String trainid) {
		return trainMapper.selectCellByTrainId(trainid);
	}

	@Override
	public Station getStation(String stationid) {
		return trainMapper.getStation(stationid);
	}

	@Override
	public List<timetable> selectStationByTrainId(String trainid) {
		return trainMapper.selectStationByTrainId(trainid);
	}

	@Override
	public List<timetable> selectTrainByTStationId(String stationid) {
		return trainMapper.selectTrainByTStationId(stationid);
	}

	@Override
	public Cell selectCellById(String cellid) {
		return trainMapper.selectCellById(cellid);
	}

	@Override
	public List<Chair> selectChairByCellId(String cellid) {
		return trainMapper.selectChairByCellId(cellid);
	}

	@Override
	public List<Train> getStart(String stationid) {
		return trainMapper.getStart(stationid);
	}

	@Override
	public List<Train> getEnd(String stationid) {
		return trainMapper.getEnd(stationid);
	}

	@Override
	public List<ticket> getTicketByTrainUserId(String trainid, String userid) {
		return trainMapper.getTicketByTrainUserId(trainid, userid);
	}

	@Override
	public void insertTicket(ticket ticket) {
		trainMapper.insertTicket(ticket);
	}

	@Override
	public Integer getCellRecord(String trainid,int cellid, String date) {
		return trainMapper.getCellRecord(trainid,cellid,date);
	}

	@Override
	public int getChairRecord(String trainid, int cellid, int chairid, String date) {
		return trainMapper.getChairRecord(trainid, cellid, chairid, date);
	}

	@Override
	public Chair selectChairById(String chairid) {
		return trainMapper.selectChairById(chairid);
	}

	@Override
	public List<ticket> getTicketByChairidUserId(String trainid, int cellid, int chairid, String date) {
		return trainMapper.getTicketByChairidUserId(trainid,cellid,chairid,date);
	}

	@Override
	public void insertChange(Change change) {
		trainMapper.insertChange(change);
	}

	@Override
	public List<ticket> selectTicketByUserId(Map<String,Object> map) {
		return trainMapper.selectTicketByUserId(map);
	}

	@Override
	public ticket selectTicketById(String id) {
		return trainMapper.selectTicketById(id);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return trainMapper.getCount(map);
	}

	@Override
	public void deleteChairByCellId(String id) {
		trainMapper.deleteChairByCellId(id);
	}

	@Override
	public void deleteCellByTrainId(String id) {
		trainMapper.deleteCellByTrainId(id);
	}

	@Override
	public void deleteTrainById(String id) {
		trainMapper.deleteTrainById(id);
	}

	@Override
	public int getCountuser(Map<String, Object> map) {
		return trainMapper.getCountuser(map);
	}

	@Override
	public List<ticket> selectTicketByUserIdBuy(String userid) {
		return trainMapper.selectTicketByUserIdBuy(userid);
	}

	@Override
	public List<Station> getAllStation() {
		return trainMapper.getAllStation();
	}

	@Override
	public void deleteTimetableByTrainId(String trainid) {
		trainMapper.deleteTimetableByTrainId(trainid);
	}

	@Override
	public void insertCell(Cell cell) {
		trainMapper.insertCell(cell);
	}

	@Override
	public void insertChair(Chair chair) {
		trainMapper.insertChair(chair);
	}

	@Override
	public void insertTrain(Train train) {
		trainMapper.insertTrain(train);
	}

	@Override
	public List<timetable> getTimetableByTrainid(Map<String, Object> map) {
		return trainMapper.getTimetableByTrainid(map);
	}

	@Override
	public int getTimeCount(Map<String, Object> map) {
		return trainMapper.getTimeCount(map);
	}

	@Override
	public void insertTimeTable(timetable ti) {
		trainMapper.insertTimeTable(ti);
	}

	@Override
	public List<Station> getAllStationForUI(Map<String, Object> map) {
		return trainMapper.getAllStationForUI(map);
	}

	@Override
	public int getStationCount(Map<String, Object> map) {
		return trainMapper.getStationCount(map);
	}

	@Override
	public void insertStation(Station station) {
		trainMapper.insertStation(station);
	}

	@Override
	public void updateStation(Station station) {
		trainMapper.updateStation(station);
	}

	@Override
	public void deleteTimetableById(String id) {
		trainMapper.deleteTimetableById(id);
	}

	@Override
	public List<timetable> selectTimetableByTrainid(String trainid) {
		return trainMapper.selectTimetableByTrainid(trainid);
	}


}
