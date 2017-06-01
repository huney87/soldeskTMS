package gwangjae.tms.ticketing.service;

import java.sql.Date;

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
		for(int i=0;i < layout.length;i++){
			layout[i] = new String[20];
			for(int j=0;j<layout[i].length;j++){
				layout[i][j] = "1";
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
		// TODO Auto-generated method stub
		return null;
	}

}
