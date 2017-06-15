package gwangjae.tms.admin.dao;

import java.util.List;

import gwangjae.tms.admin.dao.mapper.AdminMapper;
import gwangjae.tms.admin.domain.AdminPerformance;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired private AdminMapper adminMapper;

	@Override
	public List<User> getUsers() {
		return adminMapper.getUsers();
	}

	@Override
	public List<User> searchUser(String userName) {
		return adminMapper.searchUser(userName);
	}
	
	@Override
	public int delUsers(int userId) {
		return adminMapper.delUsers(userId);
	}

	@Override
	public List<AdminPerformance> getPerform() {
		return adminMapper.getPerform();
	}

	@Override
	public List<AdminPerformance> searchPerform(String perfTitle) {
		return adminMapper.searchPerform(perfTitle);
	}

}
