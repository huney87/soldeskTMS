package gwangjae.tms.hall.domain;

public class Hall {
	private int hall_id;
	private String hall_name;
	private int hall_row;
	private int hall_col;
	private int center_id;
	
	public Hall() {	}

	public int getHall_id() {
		return hall_id;
	}

	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}

	public String getHall_name() {
		return hall_name;
	}

	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}

	public int getHall_row() {
		return hall_row;
	}

	public void setHall_row(int hall_row) {
		this.hall_row = hall_row;
	}

	public int getHall_col() {
		return hall_col;
	}

	public void setHall_col(int hall_col) {
		this.hall_col = hall_col;
	}

	public int getCenter_id() {
		return center_id;
	}

	public void setCenter_id(int center_id) {
		this.center_id = center_id;
	}

}
