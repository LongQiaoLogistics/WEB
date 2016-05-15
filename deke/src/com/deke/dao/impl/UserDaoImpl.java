
package com.deke.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.deke.dao.UserDao;
import com.deke.entity.User;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * <p>Title: UserDaoImpl.java</p>
 * <p>Description: </p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-7-30下午09:00:30
 * @version 1.0
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao{
	
	@Resource(name="sqlMapClient")
	private SqlMapClient sqlMapClient;

	public void addUser(User user) throws SQLException {
		sqlMapClient.insert("user.insertUser", user);
	}

	public void delUser(User user) {
		// TODO Auto-generated method stub
		
	}

	public User queryUser(String userName) throws SQLException {
		User user = (User)sqlMapClient.queryForObject("user.queryUser",userName);
		return user;
	}

	public List<User> queryUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
