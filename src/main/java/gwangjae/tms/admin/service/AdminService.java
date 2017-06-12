package gwangjae.tms.admin.service;

import gwangjae.tms.user.domain.User;

import java.util.List;

public interface AdminService {
	public List<User> getUsers();
	public List<User> searchUser(String userName);
	public int delUsers(int userId);
}
