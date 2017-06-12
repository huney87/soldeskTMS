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
	public User getUser(String user_name) {
		return adminDao.getUser(user_name);
	}
	
	@Override
	public int delUsers(int user_id) {
		return adminDao.delUsers(user_id);
	}

}
