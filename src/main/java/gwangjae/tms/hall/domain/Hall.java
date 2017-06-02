package gwangjae.tms.hall.domain;

public class Hall {
	private int hallId;
	private String hallName;
	private int hallRow;
	private int hallCol;
	private int centerId;
	
	public Hall() {	}

	public int getHallId() {
		return hallId;
	}

	public void setHallId(int hallId) {
		this.hallId = hallId;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public int getHallRow() {
		return hallRow;
	}

	public void setHallRow(int hallRow) {
		this.hallRow = hallRow;
	}

	public int getHallCol() {
		return hallCol;
	}

	public void setHallCol(int hallCol) {
		this.hallCol = hallCol;
	}

	public int getCenterId() {
		return centerId;
	}

	public void setCenterId(int centerId) {
		this.centerId = centerId;
	}

	

}
