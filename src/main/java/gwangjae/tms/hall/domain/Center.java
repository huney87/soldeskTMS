package gwangjae.tms.hall.domain;

public class Center {
	private int centerId;
	private int locationId;
	private String centerName;
	private int centerPost;
	private String centerAddress;
	private int centerPhone;
	
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

	public int getCenterPost() {
		return centerPost;
	}

	public void setCenterPost(int centerPost) {
		this.centerPost = centerPost;
	}

	public String getCenterAddress() {
		return centerAddress;
	}

	public void setCenterAddress(String centerAddress) {
		this.centerAddress = centerAddress;
	}

	public int getCenterPhone() {
		return centerPhone;
	}

	public void setCenterPhone(int centerPhone) {
		this.centerPhone = centerPhone;
	}
}
