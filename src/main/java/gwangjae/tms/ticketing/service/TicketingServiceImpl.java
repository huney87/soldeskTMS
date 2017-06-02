package gwangjae.tms.ticketing.service;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Service;

@Service
public class TicketingServiceImpl implements TicketingService {
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
	public Date[] getPerfSkd(int perf_id) {
		Date[] result ;
		/*  
		 * 테스트코드 시작 (오늘부터 5일간의 일정을 반환함)
		 */
		result = new Date[5];
		
		long now = System.currentTimeMillis() ;
		long oneday = TimeUnit.DAYS.toMillis(1) ;
		for(int i = 0 ; i < 5 ; i++ ){			
			result[i] = new Date(now + oneday*i);
		}
		/*
		 * 테스트코드 끝
		 */
		return result;
	}

}
