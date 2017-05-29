package cacao.tms.performance.domain;

public class Round {
	private int round_id;
	private String act_info;
	private int round_time;
	private int per_id;
	
	public Round(){}

	public int getRound_id() {
		return round_id;
	}

	public void setRound_id(int round_id) {
		this.round_id = round_id;
	}

	public String getAct_info() {
		return act_info;
	}

	public void setAct_info(String act_info) {
		this.act_info = act_info;
	}

	public int getRound_time() {
		return round_time;
	}

	public void setRound_time(int round_time) {
		this.round_time = round_time;
	}

	public int getPer_id() {
		return per_id;
	}

	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}
	
	

}
