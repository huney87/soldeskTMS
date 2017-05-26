package cacao.tms.common.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cacao.tms.common.login.dao.LoginDao;
import cacao.tms.common.login.domain.Login;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired LoginDao dao;

	@Override
	public boolean checkLogin(String email, String pw) {
		Login user = new Login();
		user.setEmail(email);
		user.setPw(pw);
		int result = dao.loginCheck(user);
		
		if( result > 0) return true;
		else return false;
	}

}
