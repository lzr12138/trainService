package rml.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import rml.model.Change;
import rml.model.Station;
import rml.model.User;
import rml.model.ticket;
import rml.service.MUserServiceI;
import rml.service.TrainServiceI;

@Controller
@RequestMapping("/muserController")
public class MUserController {

	private MUserServiceI muserService;
	private TrainServiceI trainService;

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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)  
    public String welcome(HttpServletRequest request){  
        if(request.getSession().getAttribute("user")!=null)  
        {  
            return "index";  
        }  
         return "login";  
    }
	
	@RequestMapping(value = "/toLogin", method = RequestMethod.GET)  
    public String toLogin(HttpServletRequest request){  
          
        if(request.getSession().getAttribute("user")!=null)  
        {  
            return "index";  
        }  
         return "login";  
    } 
	
	@RequestMapping(value="/register")
	public String addUser(User user, HttpServletRequest request) {
			
		String id = null;
		List<String> list = muserService.check();
		while(true){
			int flag = 0;
			id = generateRandomStr(10);
			for(int j=0; j<list.size();j++){
				if(id==list.get(j)){
					flag = 1;
					break;
				}
			}
			if(flag==0){break;}
		}
		user.setId(id);
		int i = muserService.insert(user);
		
		if(i!=0){
			HttpSession session =request.getSession();  
            session.setAttribute("user",user);
			request.setAttribute("user",user);
			return "index";
		}
		else return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)  
	public String login(String id,String userpsw,String root, HttpServletRequest request) {
		User list = new User();
		if(root.equals("U")){
			list = muserService.login(id);
		}
		else {
			list = muserService.adminLogin(id);
		}
		List<Station> stationlist = trainService.getAllStation();
		request.setAttribute("stationlist", stationlist);
		if(list!=null&&userpsw.equals(list.getUserpsw())){
			HttpSession session =request.getSession();  
            session.setAttribute("user",list);
			request.setAttribute("user", list);
			if(root.equals("U")){
				return "index";
			}
			else return "adminManager";
			
		}
		else {
			return "login";
		}
		
	}
	
	@RequestMapping(value = "/zhuxiao")  
	public String zhuxiao(HttpServletRequest request) {
			HttpSession session =request.getSession();  
            session.setAttribute("user",null);
            return "login";
	}
	
	@RequestMapping(value="/UserDetail")
	public String userDetail(String id, HttpServletRequest request) {
		User list = muserService.userDetail(id);
		request.setAttribute("user", list);
		return "personInfo";
	}
	
	@RequestMapping(value="/editPost")
	public String userDetail(String publicUserId, String publicUser, HttpServletRequest request) {
		User user = muserService.userDetail(publicUserId);
		request.setAttribute("user", user);
		return "publicPost";
	}
	
	@RequestMapping(value="/First")
	public String First(String id, HttpServletRequest request) {
		User user = muserService.login(id);
		request.setAttribute("user", user);
		return "index";
	}
	
	@RequestMapping(value="/deleteCost")
	public String deleteCost(String id, String userid){
		muserService.deleteCost(id);
		return "redirect:/muserController/UserDetail.do?id="+userid;
	}
	
	@RequestMapping(value="/deleteTicket")
	public String deleteTicket(String id, String userid){
		muserService.deleteTicket(id);
		muserService.deleteCostByTicketid(id);
		muserService.deleteChangeByTicketid(id);
		muserService.deletebeChangeByTicketid(id);
		return "redirect:/muserController/UserDetail.do?id="+userid;
	}
	
	@RequestMapping(value="/kejin")
	public String kejin(String userid, int money){
		User user = muserService.userDetail(userid);
		double mon = user.getMoney()+ money;
		user.setMoney(mon);
		muserService.updateUser(user);
		return "redirect:/muserController/UserDetail.do?id="+userid;
	}
	
	@RequestMapping(value="/getChange")
	public String getChange(String userid, HttpServletRequest request){
		User user = muserService.userDetail(userid);
		List<Change> bechangelist = muserService.selectChangeByUserId(userid);
		for(int i=0;i<bechangelist.size();i++){
			ticket ti = trainService.selectTicketById(bechangelist.get(i).getBechangeticketid());
			ti.setInstationname(trainService.getStation(ti.getInstationid()).getName());
			ti.setOutstationname(trainService.getStation(ti.getOutstationid()).getName());
			bechangelist.get(i).setBechangeticket(ti);
			ticket tii = trainService.selectTicketById(bechangelist.get(i).getChangeticketid());
			tii.setInstationname(trainService.getStation(tii.getInstationid()).getName());
			tii.setOutstationname(trainService.getStation(tii.getOutstationid()).getName());
			bechangelist.get(i).setChangeticket(tii);
		}
		List<Change> changelist = muserService.selectBeChangeByUserId(userid);
		for(int i=0;i<changelist.size();i++){
			ticket ti = trainService.selectTicketById(changelist.get(i).getBechangeticketid());
			ti.setInstationname(trainService.getStation(ti.getInstationid()).getName());
			ti.setOutstationname(trainService.getStation(ti.getOutstationid()).getName());
			changelist.get(i).setBechangeticket(ti);
			ticket tii = trainService.selectTicketById(changelist.get(i).getChangeticketid());
			tii.setInstationname(trainService.getStation(tii.getInstationid()).getName());
			tii.setOutstationname(trainService.getStation(tii.getOutstationid()).getName());
			changelist.get(i).setChangeticket(tii);
		}
		request.setAttribute("user", user);
		request.setAttribute("bechangelist", bechangelist);
		request.setAttribute("changelist", changelist);
		return "changeInfo";
	}
	
	@RequestMapping(value="/React")
	public String React(String userid, String id, String react){
		muserService.reactChange(id,react);
		return "redirect:/muserController/getChange.do?userid="+userid;
	}
	
	public String generateRandomStr(int len) {
	    //字符源，可以根据需要删减
	    String generateSource = "0123456789";
	    String rtnStr = "";
	    for (int i = 0; i < len; i++) {
	        //循环随机获得当次字符，并移走选出的字符
	        String nowStr = String.valueOf(generateSource.charAt((int) Math.floor(Math.random() * generateSource.length())));
	        rtnStr += nowStr;
	        generateSource = generateSource.replaceAll(nowStr, "");
	    }
	    return rtnStr;
	}

}
