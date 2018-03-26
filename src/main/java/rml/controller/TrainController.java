package rml.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import rml.model.Cell;
import rml.model.Chair;
import rml.model.Change;
import rml.model.Station;
import rml.model.Train;
import rml.model.User;
import rml.model.ticket;
import rml.model.timetable;
import rml.service.MUserServiceI;
import rml.service.TrainServiceI;

@Controller
@RequestMapping("/trainController")
public class TrainController {
	
	private TrainServiceI trainService;
	private MUserServiceI muserService;
	public TrainServiceI getTrainService() {
		return trainService;
	}
	@Autowired
	public void setTrainService(TrainServiceI trainService) {
		this.trainService = trainService;
	}
	public MUserServiceI getMuserService() {
		return muserService;
	}
	@Autowired
	public void setMuserService(MUserServiceI muserService) {
		this.muserService = muserService;
	}
	
	@RequestMapping(value="/allTrain")
	public String allPost(String userid, HttpServletRequest request){
		
		User user = muserService.userDetail(userid);
		request.setAttribute("user", user);
		return"TrainInfo";
		
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/allTrainforFirst",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> allTrainforFirst() throws IOException {
		
		List<Train> list = trainService.allTrainForFirst();
		for(int i=0; i<list.size(); i++){
			String stratstation = trainService.getStation(list.get(i).getStartstation()).getName();
			String enstation = trainService.getStation(list.get(i).getEndstation()).getName();
			list.get(i).setStartstationname(stratstation);
			list.get(i).setEndstationname(enstation);
		}
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap.put("rows", list);
		resultmap.put("total", list.size());
		return resultmap;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/allTrainlist",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> allTrain(@RequestParam Map<String,Object> map) throws IOException {
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		List<Train> list = trainService.allTrain(map);
		for(int i=0; i<list.size(); i++){
			String stratstation = trainService.getStation(list.get(i).getStartstation()).getName();
			String enstation = trainService.getStation(list.get(i).getEndstation()).getName();
			list.get(i).setStartstationname(stratstation);
			list.get(i).setEndstationname(enstation);
		}
		int total = trainService.getCount(map);
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap.put("rows", list);
		resultmap.put("total", total);
		return resultmap;
	}
	
	@RequestMapping(value="/TrainDetail")
	public String postDetail(String trainId, String userid, HttpServletRequest request){
		User user = new User();
		Train train = new Train();
		train = trainService.selectTrainById(trainId);
		List<Cell> celllist = trainService.selectCellByTrainId(trainId);
		Station startstation = trainService.getStation(train.getStartstation());
		Station endstation = trainService.getStation(train.getEndstation());
		List<timetable> stationlist = trainService.selectStationByTrainId(trainId);
		List<ticket> ticketlist = trainService.getTicketByTrainUserId(trainId, userid);
		for(int i=0; i<stationlist.size(); i++){
			stationlist.get(i).setStationname(trainService.getStation(stationlist.get(i).getStationid()).getName());
		}
		for(int i=0;i<ticketlist.size();i++){
			ticketlist.get(i).setInstationname(trainService.getStation(ticketlist.get(i).getInstationid()).getName());
			ticketlist.get(i).setOutstationname(trainService.getStation(ticketlist.get(i).getOutstationid()).getName());
		}
		user = muserService.userDetail(userid);
		request.setAttribute("celllist", celllist);
		request.setAttribute("train", train);
		request.setAttribute("ticketlist", ticketlist);
		request.setAttribute("stationlist", stationlist);
		request.setAttribute("startstation", startstation);
		request.setAttribute("endstation", endstation);
		request.setAttribute("user", user);
		return "trainDetail";
	}
	
	@RequestMapping(value="/StationDetail")
	public String stationDetail(String stationId, String userid, HttpServletRequest request){
		User user = new User();
		Station station = trainService.getStation(stationId);
		List<Train> start= trainService.getStart(stationId); 
		List<Train> end = trainService.getEnd(stationId);
		List<timetable> trainlist = trainService.selectTrainByTStationId(stationId);
		for(int i=0; i<start.size(); i++){
			start.get(i).setStartstationname(trainService.getStation(start.get(i).getStartstation()).getName());
			start.get(i).setEndstationname(trainService.getStation(start.get(i).getEndstation()).getName());
		}
		for(int i=0; i<end.size(); i++){
			end.get(i).setStartstationname(trainService.getStation(end.get(i).getStartstation()).getName());
			end.get(i).setEndstationname(trainService.getStation(end.get(i).getEndstation()).getName());
		}
		for(int i=0; i<trainlist.size(); i++){
			Train train = trainService.selectTrainById(trainlist.get(i).getTrainid());
			train.setStartstationname(trainService.getStation(train.getStartstation()).getName());
			train.setEndstationname(trainService.getStation(train.getEndstation()).getName());
			trainlist.get(i).setTrain(train);;
		}
		user = muserService.userDetail(userid);
		request.setAttribute("user", user);
		request.setAttribute("station", station);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("trainlist", trainlist);
		return "stationDetail";
	}
	
	@RequestMapping(value="/CellDetail")
	public String cellDetail(String cellId, String userid, String ticketid, HttpServletRequest request){
		User user = new User();
		Cell cell = new Cell();
		cell = trainService.selectCellById(cellId);
		ticket ti = trainService.selectTicketById(ticketid);
		List<Chair> chairlist = trainService.selectChairByCellId(cellId);
		for(int i=0;i<chairlist.size();i++){
			chairlist.get(i).setRecord(trainService.getChairRecord(cell.getBetrainid(),cell.getNumfortrain(),chairlist.get(i).getNumforcell(),ti.getDate()));
		}
		ti.setInstationname(trainService.getStation(ti.getInstationid()).getName());
		ti.setOutstationname(trainService.getStation(ti.getOutstationid()).getName());
		user = muserService.userDetail(userid);
		request.setAttribute("chairlist", chairlist);
		request.setAttribute("cell", cell);
		request.setAttribute("ticket", ti);
		request.setAttribute("user", user);
		return "CellDetail";
	}
	
	@RequestMapping(value="/publicTicket")
	public String publicTicket(ticket ticket, String userid, HttpServletRequest request){
		User user = new User();
		String id = UUID.randomUUID().toString();
		ticket.setId(id);
		trainService.insertTicket(ticket);
		user = muserService.userDetail(userid);
		request.setAttribute("user", user);
		return "redirect:/trainController/TrainDetail.do?trainId="+ticket.getTrainid()+"&&userid="+userid;
	}
	
	@RequestMapping(value="/CellForTrain")
	public String CellForTrain(String trainid, String userid,String ticketid, HttpServletRequest request){
		User user = new User();
		Train train = new Train();
		ticket ti = trainService.selectTicketById(ticketid);
		train = trainService.selectTrainById(trainid);
		List<Cell> celllist = trainService.selectCellByTrainId(trainid);
		Station startstation = trainService.getStation(train.getStartstation());
		Station endstation = trainService.getStation(train.getEndstation());
		List<timetable> stationlist = trainService.selectStationByTrainId(trainid);
		for(int i=0;i<celllist.size();i++){
			celllist.get(i).setRecord(trainService.getCellRecord(celllist.get(i).getBetrainid(),celllist.get(i).getNumfortrain(),ti.getDate()));
		}
		for(int i=0; i<stationlist.size(); i++){
			stationlist.get(i).setStationname(trainService.getStation(stationlist.get(i).getStationid()).getName());
		}
			ti.setInstationname(trainService.getStation(ti.getInstationid()).getName());
			ti.setOutstationname(trainService.getStation(ti.getOutstationid()).getName());
		user = muserService.userDetail(userid);
		request.setAttribute("celllist", celllist);
		request.setAttribute("train", train);
		request.setAttribute("ticket", ti);
		request.setAttribute("stationlist", stationlist);
		request.setAttribute("startstation", startstation);
		request.setAttribute("endstation", endstation);
		request.setAttribute("user", user);
		return "cellForTrain";
	}
	
	@RequestMapping(value="/chairDetail")
	public String chairDetail(String chairid, String userid, String ticketid, HttpServletRequest request){
		User user = new User();
		Chair chair = new Chair();
		Cell cell = new Cell();
		chair = trainService.selectChairById(chairid);
		cell = trainService.selectCellById(chair.getBecellid());
		ticket ti = trainService.selectTicketById(ticketid);
		List<ticket> temp = new ArrayList<ticket>();
		List<ticket> ticketlist = trainService.getTicketByChairidUserId(cell.getBetrainid(),cell.getNumfortrain(),chair.getNumforcell(),ti.getDate());
		for(int i=0;i<ticketlist.size();i++){
			if(ticketlist.get(i).getId().equals(ticketid)){
				
			}
			else {
				ticketlist.get(i).setInstationname(trainService.getStation(ticketlist.get(i).getInstationid()).getName());
				ticketlist.get(i).setOutstationname(trainService.getStation(ticketlist.get(i).getOutstationid()).getName());
				temp.add(ticketlist.get(i));
			}
		}
		ti.setInstationname(trainService.getStation(ti.getInstationid()).getName());
		ti.setOutstationname(trainService.getStation(ti.getOutstationid()).getName());
		user = muserService.userDetail(userid);
		request.setAttribute("ticket", ti);
		request.setAttribute("ticketlist", temp);
		request.setAttribute("chair", chair);
		request.setAttribute("record", temp.size());
		request.setAttribute("cell", cell);
		request.setAttribute("user", user);
		return "chairDetail";
	}
	
	@RequestMapping(value="/setRequest")
	public String setRequest(Change change,String chairid, HttpServletRequest request){
		String id = UUID.randomUUID().toString();
		change.setId(id);
		change.setStatus("F");
		trainService.insertChange(change);
		return "redirect:/trainController/chairDetail.do?chairid="+chairid+"&&userid="+change.getChangeuserid()+"&&ticketid="+change.getChangeticketid();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/ticketList",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> ticketList(@RequestParam Map<String,Object> map, HttpServletRequest request) throws IOException {
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		List<ticket> list = trainService.selectTicketByUserId(map);
		for(int i=0; i<list.size(); i++){
			String stratstation = trainService.getStation(list.get(i).getInstationid()).getName();
			String enstation = trainService.getStation(list.get(i).getOutstationid()).getName();
			list.get(i).setInstationname(stratstation);
			list.get(i).setOutstationname(enstation);
		}
		int total = trainService.getCountuser(map);
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap.put("rows", list);
		resultmap.put("total", total);
		return resultmap;
	}

}
