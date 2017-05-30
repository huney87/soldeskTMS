package gwangjae.tms.common.log;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAspect {
	private Logger logger;
	
	public LogAspect(){
		logger = LogManager.getLogger(LogAspect.class);
	}
	
	@Around("execution(* gwangjae.tms.common.login.service.*.*(..))")
	public Object loginLog(ProceedingJoinPoint jp) throws Throwable{
		logger.info("로그인 서비스 시작");
		int idx = 0;
		for(Object ob : jp.getArgs()){
			System.out.println("Args"+idx+"- "+(String)ob);
			idx++;
		}
		Object obj = jp.proceed();
		logger.info("로그인 서비스 끝");
		return obj;
	}

}
