/**
 * 
 */
package com.deke.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.deke.entity.User;

/**
 * <p>
 * Title: UserDao.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: �Ϻ���������
 * </p>
 * 
 * @author Ҷ��
 * @data 2014-7-30����09:00:19
 * @version 1.0
 */
public interface UserDao  {
	/**
	 * ��
	 * @param user
	 */
	public void addUser(User user) throws SQLException;

	/**
	 * ͨ��userName����һ��User
	 * @param id
	 * @return
	 */
	public User queryUser(String userName)throws SQLException;

	/**
	 * ͨ��id���Ҷ��User
	 * @return
	 */
	public List<User> queryUserList();

	/**
	 * ɾ��User
	 * @param user
	 */
	public void delUser(User user);

	/**
	 * ����User
	 * @param user
	 * @return
	 */
	public User updateUser(User user);
}
