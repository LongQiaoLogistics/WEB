package com.deke.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.deke.dao.UserDao;
import com.deke.entity.User;
import com.deke.service.UserService;

@Service(value = "userService")
public class UserServiceImpl implements UserService {
	private Logger logger = Logger.getLogger(getClass());
	@Resource(name = "userDao")
	private UserDao userDao;

	public void addUser(User user) throws SQLException {
		logger.debug("user register begin");
		userDao.addUser(user);
		List<User> listUser = userDao.queryUserList();
		for (User user1 : listUser) {
			logger.debug("userName" + user1.getUserName() + "password" + user1.getPassword());
		}
		logger.debug("user register over");
	}

	public User queryUser(String userName) throws SQLException {
		User user = userDao.queryUser(userName);
		return user;
	}

}
