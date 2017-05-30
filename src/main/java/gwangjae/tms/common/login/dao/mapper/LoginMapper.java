package gwangjae.tms.common.login.dao.mapper;

import gwangjae.tms.common.login.domain.Login;

public interface LoginMapper {
	public int loginCheck(Login user);
}
