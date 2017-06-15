package gwangjae.tms.admin.dao;

import gwangjae.tms.admin.domain.AdminPerformance;
import gwangjae.tms.user.domain.User;

import java.util.List;

public interface AdminDao {
	List<User> getUsers();
	List<User> searchUser(String userName);
	int delUsers(int userId);
	
	List<AdminPerformance> getPerform();
	List<AdminPerformance> searchPerform(String perfTitle);
}
