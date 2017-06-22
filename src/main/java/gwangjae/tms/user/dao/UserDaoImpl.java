package gwangjae.tms.user.dao;

import gwangjae.tms.user.dao.mapper.UserMapper;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMapper userMapper;
	
	public int addUser(User user){
		return userMapper.addUser(user);
	}
	
	public User checkUserEmail(User userEmail){
		return userMapper.checkUserEmail(userEmail);
	}

	public String findUserId(User user) {
		return userMapper.findUserId(user);
	}

	@Override
	public String findUserPw(User user) {
		return userMapper.findUserPw(user);
	};
}
