package gwangjae.tms.performance.domain;

public class SeatInfo {
	private int seatInfoId;
	private int perId;
	private int seatId;
	private int grade;
	private int price;
	
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

	public int getSeatId() {
		return seatId;
	}

	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
