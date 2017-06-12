package gwangjae.tms.admin.dao;

import java.util.List;

import gwangjae.tms.admin.dao.mapper.AdminMapper;
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
	public User getUser(String user_name) {
		return adminMapper.getUser(user_name);
	}
	
	@Override
	public int delUsers(int user_id) {
		return adminMapper.delUsers(user_id);
	}

}
