package rml.service;

import java.util.List;

import rml.model.Change;
import rml.model.User;

public interface MUserServiceI {

    int insert(User user);
    
    User login(String id);
    
    User adminLogin(String id);
    
    User userDetail(String id);
    
	List<String> check();
	
	int updateUser(User user);
	
	int deleteCost(String id);
	
	List<Change> selectChangeByUserId(String userid);
	
	void deleteTicket(String id);
	
	List<Change> selectBeChangeByUserId(String userid);
	
	void reactChange(String id,String react);
	
	void deleteCostByTicketid(String id);
	
	void deleteChangeByTicketid(String id);
	
	void deletebeChangeByTicketid(String id);
    
}
