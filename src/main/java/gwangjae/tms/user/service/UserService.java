package gwangjae.tms.user.service;

import gwangjae.tms.user.domain.User;

public interface UserService {
	public int addUser(User user);
	public User checkUserEmail(User userEmail);
}
