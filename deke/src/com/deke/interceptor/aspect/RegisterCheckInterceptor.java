package com.deke.interceptor.aspect;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;


public class RegisterCheckInterceptor {
	
	public void register() {
		System.out.println("开始检查用户是否注册了DEPE");
	}

	@PostConstruct
	public void init() {
		System.out.println("用户登入组件开始生成");
	}
	@PreDestroy
	public void destory(){
		System.out.println("用户登入组件开始销毁");
	}
}
