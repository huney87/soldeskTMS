package gwangjae.tms.hall.domain;

public class Center {
	private int centerId;
	private int locationId;
	private String centerName;
	private String centerPost;
	private String centerAddress;
	private String centerPhone;
	
	public Center(){}

	public int getCenterId() {
		return centerId;
	}

	public void setCenterId(int centerId) {
		this.centerId = centerId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public String getCenterPost() {
		return centerPost;
	}

	public void setCenterPost(String centerPost) {
		this.centerPost = centerPost;
	}

	public String getCenterAddress() {
		return centerAddress;
	}

	public void setCenterAddress(String centerAddress) {
		this.centerAddress = centerAddress;
	}

	public String getCenterPhone() {
		return centerPhone;
	}

	public void setCenterPhone(String centerPhone) {
		this.centerPhone = centerPhone;
	}
}
