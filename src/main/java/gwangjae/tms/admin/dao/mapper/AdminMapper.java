package gwangjae.tms.admin.dao.mapper;

import gwangjae.tms.user.domain.User;

import java.util.List;

public interface AdminMapper {
	public List<User> getUsers();
	public User getUser(String user_name);
	public int delUsers(int user_id);
}
