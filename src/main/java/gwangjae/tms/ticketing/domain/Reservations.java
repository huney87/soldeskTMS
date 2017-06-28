package gwangjae.tms.ticketing.domain;

public class Reservations {
	// 예매 1번 테이블
	private int rId; // 예약번호(자동생성)
	private int userId; //예매한사람. 로그인정보
	private String userEmail;
	private int hId;	// 공연장번호
	private int perId; //공연번호
	private int rndId; //회차정보
	private String rDate; //예매날짜
	private int rState; //결재상태
	
	// 예매 2번 테이블 (예약번호, 좌석번호)
	private int rdetId; // 예매상세 번호(자동생성)
	private int r_Id; // 예약 번호(1번 테이블과 연동)
	private int sinfoId; //좌석번호		
	
	//예매화면 결과 출력용
	private String userName; // 예매한사람 이름
	private String perName;  // 공연제목
	private String cName;    // 회관이름
	private String hName;	 // 홀이름
	private String seatInfo;  // 좌석번호+좌석등급  반복해서 합치면됨.
	private int totalPrice;   // 전체 금액 불러오기
	
	public Reservations(){}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int gethId() {
		return hId;
	}

	public void sethId(int hId) {
		this.hId = hId;
	}

	public int getPerId() {
		return perId;
	}

	public void setPerId(int perId) {
		this.perId = perId;
	}

	public int getRndId() {
		return rndId;
	}

	public void setRndId(int rndId) {
		this.rndId = rndId;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getrState() {
		return rState;
	}

	public void setrState(int rState) {
		this.rState = rState;
	}

	public int getRdetId() {
		return rdetId;
	}

	public void setRdetId(int rdetId) {
		this.rdetId = rdetId;
	}

	public int getR_Id() {
		return r_Id;
	}

	public void setR_Id(int r_Id) {
		this.r_Id = r_Id;
	}

	public int getSinfoId() {
		return sinfoId;
	}

	public void setSinfoId(int sinfoId) {
		this.sinfoId = sinfoId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPerName() {
		return perName;
	}

	public void setPerName(String perName) {
		this.perName = perName;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String gethName() {
		return hName;
	}

	public void sethName(String hName) {
		this.hName = hName;
	}

	public String getSeatInfo() {
		return seatInfo;
	}

	public void setSeatInfo(String seatInfo) {
		this.seatInfo = seatInfo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	

}
