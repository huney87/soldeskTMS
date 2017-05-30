package gwangjae.tms.hall.domain;

public class Center {
	private int center_id;
	private int location_id;
	private String location_name;
	private int center_post;
	private String center_address;
	private int center_phone;
	
	public Center(){}

	public int getCenter_id() {
		return center_id;
	}

	public void setCenter_id(int center_id) {
		this.center_id = center_id;
	}

	public int getLocation_id() {
		return location_id;
	}

	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public int getCenter_post() {
		return center_post;
	}

	public void setCenter_post(int center_post) {
		this.center_post = center_post;
	}

	public String getCenter_address() {
		return center_address;
	}

	public void setCenter_address(String center_address) {
		this.center_address = center_address;
	}

	public int getCenter_phone() {
		return center_phone;
	}

	public void setCenter_phone(int center_phone) {
		this.center_phone = center_phone;
	}
	
	
}
