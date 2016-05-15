package com.deke.aop;


import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;


public class CargoLogAspect {
	private Logger logger = Logger.getLogger(getClass());
	//System.out.println("hello world");
	public void before(JoinPoint jp){
		logger.debug(jp.getSignature().getName()+"");
		//ÄãºÃ
	}
}
