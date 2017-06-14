package gwangjae.tms.mypage.domain;

import java.sql.Date;

public class Reservation {
	private int reservationId;
	private Date reserveDate;
	private String perfTitle;
	private String hallName;
	
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public Date getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Date reserveDate) {
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
}