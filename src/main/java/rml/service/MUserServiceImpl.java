package rml.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rml.dao.MUserMapper;
import rml.model.Change;
import rml.model.User;

@Service("muserService")
public class MUserServiceImpl implements MUserServiceI{

	private MUserMapper muserMapper;
		
	public MUserMapper getMuserMapper() {
		return muserMapper;
	}

	@Autowired
	public void setMuserMapper(MUserMapper muserMapper) {
		this.muserMapper = muserMapper;
	}
	
	@Override
	public int insert(User user) {
		
		return muserMapper.insert(user);
	}

	@Override
	public User login(String id) {
		return muserMapper.login(id);
	}

	@Override
	public User userDetail(String id) {
		return muserMapper.userDetail(id);
	}

	@Override
	public List<String> check() {
		return muserMapper.check();
	}

	@Override
	public int updateUser(User user) {
		return muserMapper.updateUser(user);
	}

	@Override
	public int deleteCost(String id) {
		return muserMapper.deleteCost(id);
	}

	@Override
	public List<Change> selectChangeByUserId(String userid) {
		return muserMapper.selectChangeByUserId(userid);
	}

	@Override
	public void deleteTicket(String id) {
		muserMapper.deleteTicket(id);
	}

	@Override
	public List<Change> selectBeChangeByUserId(String userid) {
		return muserMapper.selectBeChangeByUserId(userid);
	}

	@Override
	public void reactChange(String id, String react) {
		muserMapper.reactChange(id, react);
	}

	@Override
	public User adminLogin(String id) {
		return muserMapper.adminLogin(id);
	}

	@Override
	public void deleteCostByTicketid(String id) {
		muserMapper.deleteCostByTicketid(id);
	}

	@Override
	public void deleteChangeByTicketid(String id) {
		muserMapper.deleteChangeByTicketid(id);
	}

	@Override
	public void deletebeChangeByTicketid(String id) {
		muserMapper.deletebeChangeByTicketid(id);
	}

}
