package gwangjae.tms.ticketing.service;

import org.springframework.stereotype.Service;

@Service
public class TicketingServiceImpl implements TicketingService {

	@Override
	public String[][] drawLayout() {
		String[][] layout = new String[10][];
		for(int i=0;i < layout.length;i++){
			layout[i] = new String[20];
			for(int j=0;j<layout[i].length;j++){
				layout[i][j] = "1";
			}
		}
		return layout;
	}

}
