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
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-7-30下午09:00:19
 * @version 1.0
 */
public interface UserDao  {
	/**
	 * 增
	 * @param user
	 */
	public void addUser(User user) throws SQLException;

	/**
	 * 通过userName查找一个User
	 * @param id
	 * @return
	 */
	public User queryUser(String userName)throws SQLException;

	/**
	 * 通过id查找多个User
	 * @return
	 */
	public List<User> queryUserList();

	/**
	 * 删除User
	 * @param user
	 */
	public void delUser(User user);

	/**
	 * 更新User
	 * @param user
	 * @return
	 */
	public User updateUser(User user);
}
