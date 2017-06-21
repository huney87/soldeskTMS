package gwangjae.tms.admin.domain;

public class AdminPerformance {
	private int perfId;
	private String perfTitle;
	private String perfStartDate;
	private String perfEndDate;
	private String perfImage;
	private int perfCat;
	private int perfDisplay;
	private int perfCntTicket;
	
	public int getPerfId() {
		return perfId;
	}
	public void setPerfId(int perfId) {
		this.perfId = perfId;
	}
	public String getPerfTitle() {
		return perfTitle;
	}
	public void setPerfCntTicket(int perfCountTicket) {
		this.perfCntTicket = perfCountTicket;
	}
	public String getPerfStartDate() {
		return perfStartDate;
	}
	public void setPerfStartDate(String perfStartDate) {
		this.perfStartDate = perfStartDate;
	}
	public String getPerfEndDate() {
		return perfEndDate;
	}
	public void setPerfEndDate(String perfEndDate) {
		this.perfEndDate = perfEndDate;
	}
	public String getPerfImage() {
		return perfImage;
	}
	public void setPerfImage(String perfImage) {
		this.perfImage = perfImage;
	}
	public int getPerfCat() {
		return perfCat;
	}
	public void setPerfCat(int perfCat) {
		this.perfCat = perfCat;
	}
	public int getPerfDisplay() {
		return perfDisplay;
	}
	public void setPerfDisplay(int perfDisplay) {
		this.perfDisplay = perfDisplay;
	}
	public int getPerfCntTicket() {
		return perfCntTicket;
	}
}
