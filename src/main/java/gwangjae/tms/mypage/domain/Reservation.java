package gwangjae.tms.mypage.domain;

import java.sql.Date;

public class Reservation {
	private int reservationId;
	private int userNo;
	private int hallNo;
	private int performanceId;
	private int roundId;
	private Date roundDate;
	private int roundState;
	
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getHallNo() {
		return hallNo;
	}
	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}
	public int getRoundId() {
		return roundId;
	}
	public void setRoundId(int roundId) {
		this.roundId = roundId;
	}
	public int getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(int performanceId) {
		this.performanceId = performanceId;
	}
	public Date getRoundDate() {
		return roundDate;
	}
	public void setRoundDate(Date roundDate) {
		this.roundDate = roundDate;
	}
	public int getRoundState() {
		return roundState;
	}
	public void setRoundState(int roundState) {
		this.roundState = roundState;
	}
}
