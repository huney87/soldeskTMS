package gwangjae.tms.performance.domain;

public class PerfSearch {
	private int per_id;
	private String per_title;
	private int ct_id; // 카테고리 pk
	private String per_startDate;
	private String per_endDate;
	private String per_image;	
	private int loc;
	private String hName;
	private String cName;
	
	public PerfSearch(){}

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

	public int getLoc() {
		return loc;
	}

	public void setLoc(int loc) {
		this.loc = loc;
	}

	public String gethName() {
		return hName;
	}

	public void sethName(String hName) {
		this.hName = hName;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	};
	
	
}
