package gwangjae.tms.performance.dao;

import gwangjae.tms.performance.dao.mapper.PerformanceMapper;
import gwangjae.tms.performance.domain.Performance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PerformanceDaoImpl implements PerformanceDao{
	@Autowired private PerformanceMapper perform;
	
	public Performance getPerCategory(int category){
		return perform.getPerCategory(category);
	}
}
