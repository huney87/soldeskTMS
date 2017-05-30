package gwangjae.tms.hall.domain;

public class Seat {
	private int seat_id;
	private int seat_row;
	private int seat_col;
	private int seat_type;
	private int hall_id;
	private int seat_number;
	
	public Seat(){}

	public int getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}

	public int getSeat_row() {
		return seat_row;
	}

	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}

	public int getSeat_col() {
		return seat_col;
	}

	public void setSeat_col(int seat_col) {
		this.seat_col = seat_col;
	}

	public int getSeat_type() {
		return seat_type;
	}

	public void setSeat_type(int seat_type) {
		this.seat_type = seat_type;
	}

	public int getHall_id() {
		return hall_id;
	}

	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}

	public int getSeat_number() {
		return seat_number;
	}

	public void setSeat_number(int seat_number) {
		this.seat_number = seat_number;
	}
	
	

}
