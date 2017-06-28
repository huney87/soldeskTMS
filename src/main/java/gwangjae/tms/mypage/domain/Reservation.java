package gwangjae.tms.mypage.domain;

public class Reservation {
	private int reservationId;
	private String reserveDate;
	private String perfTitle;
	private String hallName;
	private int perfId;
	
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public String getPerfTitle() {
		return perfTitle;
	}
	public void setPerfTitle(String perfTitle) {
		this.perfTitle = perfTitle;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public int getPerfId() {
		return perfId;
	}
	public void setPerfId(int perfId) {
		this.perfId = perfId;
	}
}
