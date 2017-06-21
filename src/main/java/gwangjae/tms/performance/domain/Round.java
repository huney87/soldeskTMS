package gwangjae.tms.performance.domain;

public class Round {
	private int roundId;
	private String actInfo;
	private String roundDate;
	private String roundTime;
	private int perId;
	
	public Round(){}

	public int getRoundId() {
		return roundId;
	}

	public void setRoundId(int roundId) {
		this.roundId = roundId;
	}

	public String getActInfo() {
		return actInfo;
	}

	public void setActInfo(String actInfo) {
		this.actInfo = actInfo;
	}

	public String getRoundDate() {
		return roundDate;
	}

	public void setRoundDate(String roundDate) {
		this.roundDate = roundDate;
	}

	public String getRoundTime() {
		return roundTime;
	}

	public void setRoundTime(String roundTime) {
		this.roundTime = roundTime;
	}

	public int getPerId() {
		return perId;
	}

	public void setPerId(int perId) {
		this.perId = perId;
	}

	
}
