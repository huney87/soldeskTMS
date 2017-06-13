package gwangjae.tms.user.dao;

import gwangjae.tms.user.domain.User;

public interface UserDao {
	public int addUser(User user);
	public User checkUserEmail(User userEmail);
}
