package cacao.tms.common.login.dao;

import cacao.tms.common.login.domain.Login;

public interface LoginDao {
	public int loginCheck(Login user);
}
