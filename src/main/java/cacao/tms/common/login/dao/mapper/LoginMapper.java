package cacao.tms.common.login.dao.mapper;

import cacao.tms.common.login.domain.Login;

public interface LoginMapper {
	public Login getLogin(String email);
}
