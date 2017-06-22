package gwangjae.tms.user.dao.mapper;

import gwangjae.tms.user.domain.User;

public interface UserMapper {
	public int addUser(User user);
	public User checkUserEmail(User userEmail);
	
	public String findUserId(User user);
	public String findUserPw(User user);
}
