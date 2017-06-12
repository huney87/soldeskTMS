package gwangjae.tms.user.domain;

public class User {
	private int userId;
	private String userName;
	private String userEmail;
	private String userPw;
	private int userPost;
	private String userAddress;
	private int userPhone;
	private String userBirthday;
	private int userType;	// 관리자, 판매자, 소비자로 구분. (0,1,2)
	
	
	public User(){}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public int getUserPost() {
		return userPost;
	}

	public void setUserPost(int userPost) {
		this.userPost = userPost;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public int getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}	
}
