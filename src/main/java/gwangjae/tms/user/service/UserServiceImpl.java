package gwangjae.tms.user.service;

import gwangjae.tms.user.dao.UserDao;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	
	public int addUser(User user){
		return userDao.addUser(user);
	}
}
