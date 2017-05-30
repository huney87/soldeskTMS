package gwangjae.tms.common.login.dao;

import gwangjae.tms.common.login.dao.mapper.LoginMapper;
import gwangjae.tms.common.login.domain.Login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired LoginMapper mapper;
	
	public int getUserCnt(Login user) {		
		return mapper.loginCheck(user);
	}

}
