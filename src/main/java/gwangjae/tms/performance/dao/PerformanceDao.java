package gwangjae.tms.performance.dao;

import gwangjae.tms.performance.domain.Performance;

public interface PerformanceDao {
	Performance getPerCategory(int category);
}
