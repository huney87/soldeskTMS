package gwangjae.tms.center.domain;

public class Center {
	private int ctrId;
	private int locId;
	private String ctrName;
	private String ctrPostcode;
	private String ctrAddress;
	private String ctrPhone;
	
	public int getCtrId() {
		return ctrId;
	}
	public void setCtrId(int ctrId) {
		this.ctrId = ctrId;
	}
	public int getLocId() {
		return locId;
	}
	public void setLocId(int locId) {
		this.locId = locId;
	}
	public String getCtrName() {
		return ctrName;
	}
	public void setCtrName(String ctrName) {
		this.ctrName = ctrName;
	}
	public String getCtrPostcode() {
		return ctrPostcode;
	}
	public void setCtrPostcode(String ctrPostcode) {
		this.ctrPostcode = ctrPostcode;
	}
	public String getCtrAddress() {
		return ctrAddress;
	}
	public void setCtrAddress(String ctrAddress) {
		this.ctrAddress = ctrAddress;
	}
	public String getCtrPhone() {
		return ctrPhone;
	}
	public void setCtrPhone(String ctrPhone) {
		this.ctrPhone = ctrPhone;
	}
}
