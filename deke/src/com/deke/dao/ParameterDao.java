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
 * <p>Company: �Ϻ���������</p>
 * @author Ҷ��
 * @data 2014-8-30����10:34:49
 * @version 1.0
 */
public interface ParameterDao {
	/**
	 * ��ѯ����ʵ��
	 **/
	public List<ParameterEntity> quJeryPE() throws SQLException;
}
