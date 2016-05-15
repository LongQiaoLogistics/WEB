/**
 * 
 */
package com.deke.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * Title: CargoDao.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: �Ϻ���������
 * </p>
 * 
 * @author Ҷ��
 * @data 2014-8-30����10:34:49
 * @version 1.0
 */
public interface CargoDao {
	/**
	 * ��������б�
	 * @param cargo
	 * @throws SQLException
	 */
	public void insertCargo(Map<String,String> cargo) throws SQLException;
	
	/**
	 * ��ѯ�����б�
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String,String>> queryCargoList(Map<String,String> map) throws SQLException;
}
