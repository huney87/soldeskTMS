package cacao.tms.common.login.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cacao.tms.common.login.dao.mapper.LoginMapper;
import cacao.tms.common.login.domain.Login;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired LoginMapper mapper;
	
	public int loginCheck(Login user) {		
		return mapper.loginCheck(user);
	}

}
