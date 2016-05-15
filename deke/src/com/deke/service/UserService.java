package com.deke.service;

import java.sql.SQLException;

import com.deke.entity.User;

public interface UserService {
	public void addUser(User user) throws SQLException;
	
	public User queryUser(String userName) throws SQLException; 
}
