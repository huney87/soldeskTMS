package gwangjae.tms.ticketing.domain;

public class TicketSeatInfo {
	private int sinfoId;
	private int sId;
	private int perfId;
//	논리정보
	private int sinfoGrade;
	private int sinfoPrice;
//	물리정보
	private int hId;
	private int sRow;
	private int sCol;
	private int sNumber;
	private int sType;
	
	public int getSinfoId() {
		return sinfoId;
	}
	public void setSinfoId(int sinfoId) {
		this.sinfoId = sinfoId;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public int getPerfId() {
		return perfId;
	}
	public void setPerfId(int perfId) {
		this.perfId = perfId;
	}
	public int getSinfoGrade() {
		return sinfoGrade;
	}
	public void setSinfoGrade(int sinfoGrade) {
		this.sinfoGrade = sinfoGrade;
	}
	public int getSinfoPrice() {
		return sinfoPrice;
	}
	public void setSinfoPrice(int sinfoPrice) {
		this.sinfoPrice = sinfoPrice;
	}
	public int gethId() {
		return hId;
	}
	public void sethId(int hId) {
		this.hId = hId;
	}
	public int getsRow() {
		return sRow;
	}
	public void setsRow(int sRow) {
		this.sRow = sRow;
	}
	public int getsCol() {
		return sCol;
	}
	public void setsCol(int sCol) {
		this.sCol = sCol;
	}
	public int getsNumber() {
		return sNumber;
	}
	public void setsNumber(int sNumber) {
		this.sNumber = sNumber;
	}
	public int getsType() {
		return sType;
	}
	public void setsType(int sType) {
		this.sType = sType;
	}
}
