package com.deke.interceptor.aspect;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;


public class RegisterCheckInterceptor {
	
	public void register() {
		System.out.println("��ʼ����û��Ƿ�ע����DEPE");
	}

	@PostConstruct
	public void init() {
		System.out.println("�û����������ʼ����");
	}
	@PreDestroy
	public void destory(){
		System.out.println("�û����������ʼ����");
	}
}
