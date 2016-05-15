package com.deke.aop;


import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;


public class CargoLogAspect {
	private Logger logger = Logger.getLogger(getClass());
	
	public void before(JoinPoint jp){
		logger.debug(jp.getSignature().getName()+"");
	}
}
