package gwangjae.tms.admin.dao.mapper;

import gwangjae.tms.user.domain.User;

import java.util.List;

public interface AdminMapper {
	public List<User> getUsers();
	public List<User> searchUser(String userName);
	public int delUsers(int userId);
}
