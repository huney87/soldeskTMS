package gwangjae.tms.admin.service;

import gwangjae.tms.user.domain.User;

import java.util.List;

public interface AdminService {
	public List<User> getUsers();
	public User getUser(int user_id);
	public int delUsers(int user_id);
}
