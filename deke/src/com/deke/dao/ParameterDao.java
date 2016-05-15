/**
 * 
 */
package com.deke.dao;

import java.sql.SQLException;
import java.util.List;

import com.deke.entity.ParameterEntity;

/**
 * <p>Title: ParameterDao.java</p>
 * <p>Description: </p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-8-30上午10:34:49
 * @version 1.0
 */
public interface ParameterDao {
	/**
	 * 查询参数实体
	 **/
	public List<ParameterEntity> quJeryPE() throws SQLException;
}
