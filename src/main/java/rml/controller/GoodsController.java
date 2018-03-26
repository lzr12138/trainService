package rml.controller;

import java.io.IOException;
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

import rml.model.CostInfo;
import rml.model.Goods;
import rml.model.Goods_comment;
import rml.model.User;
import rml.model.ticket;
import rml.service.GoodsServiceI;
import rml.service.MUserServiceI;
import rml.service.TrainServiceI;

@Controller
@RequestMapping("/goodsController")
public class GoodsController {
	
	private GoodsServiceI goodsService;
	private MUserServiceI muserService;
	private TrainServiceI trainService;
	
	
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
	
	@RequestMapping(value="/allGoods")
	public String allPost(String userid, HttpServletRequest request){
		List<ticket> ticketlist = trainService.selectTicketByUserIdBuy(userid);
		User user = muserService.userDetail(userid);
		request.setAttribute("user", user);
		request.setAttribute("ticketlist", ticketlist);
		return"GoodsInfo";
		
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/allGoodsforFirst",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String ,Object> allGoodsFirst(){
		
		List<Goods> list = goodsService.allGoodsforFirst();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", list.size());
		return map;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/allGoodsList",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String ,Object> allGoodsList(@RequestParam Map<String,Object> map){
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		List<Goods> list = goodsService.allGoods(map);
		int total = goodsService.getCount(map);
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap.put("rows", list);
		resultmap.put("total", total);
		return resultmap;
	}
	
	@RequestMapping(value="/GoodsDetail")
	public String postDetail(String goodsId, String userid, HttpServletRequest request){
		User user = new User();
		Goods goods = new Goods();
		goods = goodsService.selectGoodsByGoodsId(goodsId);
		List<ticket> ticketlist = trainService.selectTicketByUserIdBuy(userid);
		List<Goods_comment> comment = goodsService.selectCommentByGoodsId(goodsId);
		user = muserService.userDetail(userid);
		request.setAttribute("commentlist", comment);
		request.setAttribute("goods", goods);
		request.setAttribute("ticketlist", ticketlist);
		request.setAttribute("user", user);
		return "goodsDetail";
	}
	
	@RequestMapping(value="/publicComment")
	public String publicComment(Goods_comment comment, String userid, HttpServletRequest request) {
		String id = UUID.randomUUID().toString();
		comment.setId(id);
		goodsService.insertComment(comment);
		return "redirect:/goodsController/GoodsDetail.do?goodsId="+comment.getGoods_id()+"&&userid="+userid;
	}
	
	@RequestMapping(value="/buyGoods")
	public String buyGoods(CostInfo costinfo, String date, HttpServletRequest request) {
		String id = UUID.randomUUID().toString();
		User user = muserService.userDetail(costinfo.getUserid());
		costinfo.setId(id);
		Goods goods = goodsService.selectGoodsByGoodsId(costinfo.getGoodsid());
		goods.setSum(goods.getSum()-costinfo.getSum());
		goods.setSalenum(goods.getSalenum()+costinfo.getSum());
		goodsService.updateGoods(goods);
		costinfo.setGoodsname(goods.getName());
		double total = costinfo.getSum() * goods.getPrice();
		double money = user.getMoney()- total ;
		user.setMoney(money);
		muserService.updateUser(user);
		costinfo.setTotal(total);
		goodsService.buyGoods(costinfo);
		return "redirect:/goodsController/allGoods.do?userid="+costinfo.getUserid();
	}
	
	@RequestMapping(value="/buyGoodsOnDetail")
	public String buyGoodsOnDetail(CostInfo costinfo, String date) {
		String id = UUID.randomUUID().toString();
		User user = muserService.userDetail(costinfo.getUserid());
		costinfo.setId(id);
		Goods goods = goodsService.selectGoodsByGoodsId(costinfo.getGoodsid());
		goods.setSum(goods.getSum()-costinfo.getSum());
		goods.setSalenum(goods.getSalenum()+costinfo.getSum());
		goodsService.updateGoods(goods);
		costinfo.setGoodsname(goods.getName());
		double total = costinfo.getSum() * goods.getPrice();
		double money = user.getMoney()- total ;
		user.setMoney(money);
		muserService.updateUser(user);
		costinfo.setTotal(total);
		goodsService.buyGoods(costinfo);
		return "redirect:/goodsController/GoodsDetail.do?goodsId="+costinfo.getGoodsid()+"&&userid="+costinfo.getUserid();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/userCost.do",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> userCost(@RequestParam Map<String ,Object> map, HttpServletRequest request) throws IOException {
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		List<CostInfo> list = goodsService.selectUserCost(map);
		for(int i=0; i<list.size(); i++){
			list.get(i).setTrainid(trainService.selectTicketById(list.get(i).getTicketid()).getTrainid());
		}
		int total = goodsService.getCountuser(map);
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap.put("rows", list);
		resultmap.put("total",total);
		return resultmap;
	}
	
}
