package gwangjae.tms.user.domain;

import java.sql.Date;

public class User {
	private int user_id;
	private String user_name;
	private Date birth;
	private int user_post;
	private String user_address;
	private int user_phone;
	private String user_email;
	private int user_type; // 관리자, 판매자, 소비자로 구분. (0,1,2)
		
	public User(){}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getUser_post() {
		return user_post;
	}

	public void setUser_post(int user_post) {
		this.user_post = user_post;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public int getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(int user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	
	
	
}
