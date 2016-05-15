package com.deke.entity;

/**
 * 龙巧在线平台用户实体类
 * 
 * @author yelong
 * 
 */
public class User {
	private String id;
	private String userName;
	private String password;
	
	public User() {
	}

	public User(String id,String userName, String password) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getId() {
		return id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", userName="
				+ userName + "]";
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
