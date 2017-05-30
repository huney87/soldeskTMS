package gwangjae.tms.common.login.service;

import gwangjae.tms.common.login.dao.LoginDao;
import gwangjae.tms.common.login.domain.Login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired LoginDao dao;

	@Override
	public boolean checkLogin(String email, String pw) {
		Login user = new Login();
		user.setEmail(email);
		user.setPw(pw);
		int result = dao.getUserCnt(user);
		
		if( result > 0) return true;
		else return false;
	}

}
