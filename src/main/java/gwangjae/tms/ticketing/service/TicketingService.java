package gwangjae.tms.ticketing.service;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.ticketing.domain.Reservations;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.util.List;

public interface TicketingService {	
	public TicketSeatInfo[][] getSquareSeatLayout(int perfId);
	public String[][] drawLayout(int hall_id);
	public Round[] getPerfSkd(int perf_id);
	public Performance getPerfDate(int perfId);
	public Performance getPerfInfo(int perfId);
	public List<SeatInfo> getPerfSeatInfo(int perfId);
	public int setReserv(Reservations reservation);
	public Reservations getReservResult(Reservations reservation);
	public int setRevDetail(Reservations reservation);
}
