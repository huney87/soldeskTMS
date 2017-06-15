package gwangjae.tms.admin.domain;

import java.sql.Date;

public class AdminPerformance {
	private String perfTitle;
	private Date perfStartDate;
	private Date perfEndDate;
	private String perfImage;
	private int perfDisplay;
	private int perfcountTicket;
	
	public String getPerfTitle() {
		return perfTitle;
	}
	public void setPerfTitle(String perfTitle) {
		this.perfTitle = perfTitle;
	}
	public Date getPerfStartDate() {
		return perfStartDate;
	}
	public void setPerfStartDate(Date perfStartDate) {
		this.perfStartDate = perfStartDate;
	}
	public Date getPerfEndDate() {
		return perfEndDate;
	}
	public void setPerfEndDate(Date perfEndDate) {
		this.perfEndDate = perfEndDate;
	}
	public String getPerfImage() {
		return perfImage;
	}
	public void setPerfImage(String perfImage) {
		this.perfImage = perfImage;
	}
	public int getPerfDisplay() {
		return perfDisplay;
	}
	public void setPerfDisplay(int perfDisplay) {
		this.perfDisplay = perfDisplay;
	}
	public int getPerfcountTicket() {
		return perfcountTicket;
	}
	public void setPerfcountTicket(int perfcountTicket) {
		this.perfcountTicket = perfcountTicket;
	}
}
