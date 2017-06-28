package gwangjae.tms.ticketing.dao.mapper;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.ticketing.domain.Reservations;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.util.List;

public interface TicketingMapper {
	public List<TicketSeatInfo> getAllSeatInfo(int perfId);
	public List<Round> getPerfSkdList(int perfId);
	public Performance getPerfDate(int perfId);
	public Performance getPerfInfo(int perfId);
	public List<SeatInfo> getPerfSeatInfo(int perfId);
	public int setReserv(Reservations reservation);
	public int getRid();
	public int setRevDetail(Reservations reservation);
	public Reservations getReservResult(Reservations reservation);
	public int updateSeatState(int seatId);
}
