package gwangjae.tms.performance.domain;

public class Performance {
	private int per_id;
	private String per_title;
	private int ct_id; // 카테고리 pk
	private String per_startDate;
	private String per_endDate;
	private String per_image;
	private String hall_name;
	private int hall_id;
	private int userId;
	private int display; // 소비자에게 보이게 할지 안보이게 할지.
	
	public Performance(){}

	public int getPer_id() {
		return per_id;
	}

	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}

	public String getPer_title() {
		return per_title;
	}

	public void setPer_title(String per_title) {
		this.per_title = per_title;
	}

	public int getCt_id() {
		return ct_id;
	}

	public void setCt_id(int ct_id) {
		this.ct_id = ct_id;
	}

	public String getPer_startDate() {
		return per_startDate;
	}

	public void setPer_startDate(String per_startDate) {
		this.per_startDate = per_startDate;
	}

	public String getPer_endDate() {
		return per_endDate;
	}

	public void setPer_endDate(String per_endDate) {
		this.per_endDate = per_endDate;
	}

	public String getPer_image() {
		return per_image;
	}

	public void setPer_image(String per_image) {
		this.per_image = per_image;
	}

	public int getHall_id() {
		return hall_id;
	}

	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}

	public String getHall_name() {
		return hall_name;
	}

	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}	
	
}
