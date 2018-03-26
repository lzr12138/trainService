package rml.controller;

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
import rml.model.Comment;
import rml.model.Goods;
import rml.model.Station;
import rml.model.Train;
import rml.model.User;
import rml.model.timetable;
import rml.service.GoodsServiceI;
import rml.service.MUserServiceI;
import rml.service.PostServiceI;
import rml.service.TrainServiceI;

@Controller
@RequestMapping("/adminController")
public class AdminController {
	
	private PostServiceI postService;
	private MUserServiceI muserService;
	private GoodsServiceI goodsService;
	private TrainServiceI trainService;

	public PostServiceI getPostService() {
		return postService;
	}

	@Autowired
	public void setPostService(PostServiceI postService) {
		this.postService = postService;
	}
	
	public MUserServiceI getMuserService() {
		return muserService;
	}

	@Autowired
	public void setMuserService(MUserServiceI muserService) {
		this.muserService = muserService;
	}

	public GoodsServiceI getGoodsService() {
		return goodsService;
	}

	@Autowired
	public void setGoodsService(GoodsServiceI goodsService) {
		this.goodsService = goodsService;
	}

	public TrainServiceI getTrainService() {
		return trainService;
	}

	@Autowired
	public void setTrainService(TrainServiceI trainService) {
		this.trainService = trainService;
	}

	@RequestMapping(value="/admin")
	public String admin(String userid,HttpServletRequest request){
		User user = new User();
		user = muserService.adminLogin(userid);
		List<Station> stationlist = trainService.getAllStation();
		request.setAttribute("stationlist", stationlist);
		request.setAttribute("user", user);
		return "adminManager";
	}
	
	@RequestMapping(value="/deletePost")
	public String deletePost(String userid,String postid){
		List<Comment> list = postService.selectCommentByPostId(postid);
		for(int j=0; j<list.size();j++){
			String commentid = list.get(j).getId();
			postService.deleteReply(commentid);
		}
		postService.deleteComment(postid);
		postService.deleteByPrimaryKey(postid);
		return "redirect:/adminController/admin.do?id="+userid;
	}
	
	@RequestMapping(value="/deleteGoods")
	public String deleteGoods(String userid,String goodsid){
		goodsService.deleteCommentByGoodsId(goodsid);
		goodsService.deleteGoodsById(goodsid);
		return "redirect:/adminController/admin.do?id="+userid;
	}
	
	@RequestMapping(value="/saveGoods")
	public String saveGoods(Goods goods,String status,String userid){
		if(status.equals("add")){
			String id = UUID.randomUUID().toString();
			goods.setId(id);
			goods.setSalenum(0);
			goodsService.insertGoods(goods);
		}
		else {
			goodsService.updateGoods(goods);
		}
		return "redirect:/adminController/admin.do?id="+userid;
	}
	
	@RequestMapping(value="/deleteTrain")
	public String deleteTrain(String userid,String trainid){
		List<Cell> celllist = trainService.selectCellByTrainId(trainid);
		for(int i=0;i<celllist.size();i++){
			trainService.deleteChairByCellId(celllist.get(i).getId());
		}
		trainService.deleteCellByTrainId(trainid);
		trainService.deleteTimetableByTrainId(trainid);
		trainService.deleteTrainById(trainid);
		return "redirect:/adminController/admin.do?id="+userid;
	}
	@RequestMapping(value="/saveTrain")
	public String saveTrain(Train train,String chairnum,String userid){
		int a = Integer.parseInt(chairnum);
		for(int i=0;i<train.getCellnum();i++){
			Cell cell = new Cell();
			String id = UUID.randomUUID().toString();
			cell.setId(id);
			cell.setBetrainid(train.getId());
			cell.setChairnum(a);
			cell.setNumfortrain(i+1);
			cell.setRecord(0);
			trainService.insertCell(cell);
			for(int j=0;j<a;j++){
				Chair chair = new Chair();
				String chairid = UUID.randomUUID().toString();
				chair.setId(chairid);
				chair.setBecellid(id);
				chair.setNumforcell(j+1);
				chair.setRecord(0);
				trainService.insertChair(chair);
			}
		}
		trainService.insertTrain(train);
		return "redirect:/adminController/admin.do?id="+userid;
	}
	
	@RequestMapping(value="addTimetable")
	public String addTimetable(String trainid,HttpServletRequest request){
		
		List<Station> stationlist = trainService.getAllStation();
		request.setAttribute("stationlist", stationlist);
		request.setAttribute("trainid", trainid);
		return "toAddTimetable";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/getTimetable",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> getTimetable(@RequestParam Map<String,Object> map){
		
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		Map<String ,Object> resultmap = new HashMap<String,Object>();
		List<timetable> timetablelist = trainService.getTimetableByTrainid(map);
		for(int i=0; i<timetablelist.size(); i++){
			timetablelist.get(i).setStationname(trainService.getStation(timetablelist.get(i).getStationid()).getName());
		}
		int total = trainService.getTimeCount(map);
		resultmap.put("rows", timetablelist);
		resultmap.put("total", total);
		return resultmap;
	}
	
	@RequestMapping(value="insertTimeTable")
	public String insertTimeTable(timetable timet){
		String id = UUID.randomUUID().toString();
		timet.setId(id);
		List<timetable> timetablelist = trainService.selectStationByTrainId(timet.getTrainid());
		for(int i=0;i<timetablelist.size();i++){
			int flag = timet.getNumfortrain();
			int temp=timetablelist.get(i).getNumfortrain();
			if(timetablelist.get(i).getNumfortrain()>=flag){
				temp++;
				timetablelist.get(i).setNumfortrain(temp);
			}
		}
		timetablelist.add(timet);
		trainService.deleteTimetableByTrainId(timet.getTrainid());
		for(int i=0;i<timetablelist.size();i++){
			trainService.insertTimeTable(timetablelist.get(i));
		}
		return "redirect:/adminController/addTimetable.do?trainid="+timet.getTrainid();
	}
	
	
	@RequestMapping(value="editStation")
	public String editStation(){
		return "toAddStation";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/getStation",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> getStation(@RequestParam Map<String,Object> map){
		
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		Map<String ,Object> resultmap = new HashMap<String,Object>();
		List<Station> stationlist = trainService.getAllStationForUI(map);
		int total = trainService.getStationCount(map);
		resultmap.put("rows", stationlist);
		resultmap.put("total", total);
		return resultmap;
	}
	
	@RequestMapping(value="saveStation")
	public String saveStation(Station station,String status){
		if(status.equals("add")){
			String id = UUID.randomUUID().toString();
			station.setId(id);
			trainService.insertStation(station);
		}
		else trainService.updateStation(station);
		return "redirect:/adminController/editStation.do";
	}
	
	@RequestMapping(value="deleteTimetable")
	public String deleteTimetable(String id,String trainid){
		trainService.deleteTimetableById(id);
		List<timetable> timetable = trainService.selectTimetableByTrainid(trainid);
		for(int i=0;i<timetable.size();i++){
			timetable.get(i).setNumfortrain(i+1);
		}
		trainService.deleteTimetableByTrainId(trainid);
		for(int i=0;i<timetable.size();i++){
			trainService.insertTimeTable(timetable.get(i));
		}
		return "redirect:/adminController/addTimetable.do?trainid="+trainid;
	}

}
