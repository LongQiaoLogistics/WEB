package com.deke.aop;

import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;


@Aspect
@Component("userLogInterceptesr")
public class UserLogAspect {
	private Logger logger = Logger.getLogger(getClass());
	
	@Pointcut(value="execution(public String com.deke.web.controller.UserController.login(..))") 
	public void declareLoginJoinPoint(){}
	
	@Before("declareLoginJoinPoint()")
	public void before(JoinPoint jp) {
		String methodName = jp.getSignature().getName();
		List listArgs = Arrays.asList(jp.getArgs());
		logger.debug(methodName + "   " + listArgs);
		logger.error("");
	}

	@AfterReturning(value = "declareLoginJoinPoint()", returning = "result")
	public void after(Object result) {
		logger.error("" + result);
	}
}
