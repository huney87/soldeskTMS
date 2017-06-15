package gwangjae.tms.admin.dao.mapper;

import gwangjae.tms.admin.domain.AdminPerformance;
import gwangjae.tms.user.domain.User;

import java.util.List;

public interface AdminMapper {
	public List<User> getUsers();
	public List<User> searchUser(String userName);
	public int delUsers(int userId);
	
	public List<AdminPerformance> getPerform();
	public List<AdminPerformance> searchPerform(String perfTitle);
}
