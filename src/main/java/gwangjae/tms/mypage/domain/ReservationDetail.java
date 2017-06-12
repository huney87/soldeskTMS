package gwangjae.tms.mypage.domain;

public class ReservationDetail {
	private int rervationDetailID;
	private int roundId;
	private int seatInfoId;
	
	public int getRervationDetailID() {
		return rervationDetailID;
	}
	public void setRervationDetailID(int rervationDetailID) {
		this.rervationDetailID = rervationDetailID;
	}
	public int getRoundId() {
		return roundId;
	}
	public void setRoundId(int roundId) {
		this.roundId = roundId;
	}
	public int getSeatInfoId() {
		return seatInfoId;
	}
	public void setSeatInfoId(int seatInfoId) {
		this.seatInfoId = seatInfoId;
	}
}
