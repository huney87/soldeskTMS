package gwangjae.tms.admin.service;

import java.util.List;

import gwangjae.tms.admin.dao.AdminDao;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired private AdminDao adminDao;

	@Override
	public List<User> getUsers() {
		return adminDao.getUsers();
	}

	@Override
	public List<User> searchUser(String userName) {
		return adminDao.searchUser(userName);
	}
	
	@Override
	public int delUsers(int userId) {
		return adminDao.delUsers(userId);
	}

}
