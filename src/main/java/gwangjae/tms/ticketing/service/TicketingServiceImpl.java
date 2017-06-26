package gwangjae.tms.ticketing.service;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.ticketing.dao.TicketingDao;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketingServiceImpl implements TicketingService {
	@Autowired TicketingDao ticketDao;
	
	/*
	 * 좌석 레이아웃 2차원 배열 출력
	 * @see gwangjae.tms.ticketing.service.TicketingService#drawLayout()
	 */
	@Override
	public String[][] drawLayout(int hall_id) {
		String[][] layout = new String[10][];

		Random rng = new Random(System.currentTimeMillis());
		
		int counter = 1;
		for(int i=0;i < layout.length;i++){
			layout[i] = new String[15];
			for(int j=0;j<layout[i].length;j++){				
				
				List<String> codes = new LinkedList<>();
				codes.add(String.format("%04d",i*100 + (j+1))); // seat_id
				codes.add(String.format("%03d",counter)); // seat_number
				if(j%5 == 0){
					codes.add(String.valueOf(0));
				}else {
					codes.add(String.valueOf(1)); // seat_type
					counter++;
				}
				codes.add(String.valueOf(rng.nextInt(2))); // state 
				
				String seatCode = String.join("-", codes);
				layout[i][j] = seatCode;
			}
		}
		return layout;
	}

	/*
	 * 공연 일정을 Date 배열로 출력
	 * @see gwangjae.tms.ticketing.service.TicketingService#getPerfSkd()
	 */
	@Override
	public Round[] getPerfSkd(int perf_id) {		
		List<Round> listDate = ticketDao.getPerfSkdList(perf_id);
		Round[] result = listDate.toArray(new Round[listDate.size()]);
		return result;
	}

	@Override
	public TicketSeatInfo[][] getSquareSeatLayout(int perfId) {
		List<TicketSeatInfo> resultSeats = ticketDao.getAllSeatInfo(perfId);
		int maxRow = 0, maxCol = 0;
		for(TicketSeatInfo itr : resultSeats){
			if(itr.getsRow() > maxRow)maxRow = itr.getsRow();
			if(itr.getsCol() > maxCol)maxCol = itr.getsCol();
		}
		TicketSeatInfo[][] squareSeats = new TicketSeatInfo[maxRow][maxCol];
		for(TicketSeatInfo itr : resultSeats){
			squareSeats[itr.getsRow()-1][itr.getsCol()-1] = itr;
		}
		return squareSeats;
	}
	
	/*
		공연 일정을 불러오기 위해 Performance 정보 읽어들임.
	 */
	@Override
	public Performance getPerfDate(int perfId){
		return ticketDao.getPerfDate(perfId);
	}
	
	@Override
	public Performance getPerfInfo(int perfId){
		return ticketDao.getPerfInfo(perfId);
	}
	
	@Override
	public List<SeatInfo> getPerfSeatInfo(int perfId){
		return ticketDao.getPerSeatInfo(perfId);
	}

}
