package gwangjae.tms.performance.domain;

public class SeatInfo {
	private int seatInfoId;
	private int perId;
	private int seatType;
	private String grade;
	private int price;
	private int seatNumber;

	public SeatInfo(){}

	public int getSeatInfoId() {
		return seatInfoId;
	}

	public void setSeatInfoId(int seatInfoId) {
		this.seatInfoId = seatInfoId;
	}

	public int getPerId() {
		return perId;
	}

	public void setPerId(int perId) {
		this.perId = perId;
	}

	public int getSeatType() {
		return seatType;
	}

	public void setSeatType(int seatType) {
		this.seatType = seatType;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}

	
	
	
}
