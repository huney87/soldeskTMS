package gwangjae.tms.performance.service;

import gwangjae.tms.performance.dao.PerformanceDao;
import gwangjae.tms.performance.domain.Performance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerformanceServiceImpl {
	@Autowired private PerformanceDao perDao;
	
	public Performance getPerCategory(int category){
		return perDao.getPerCategory(category);
	}
}