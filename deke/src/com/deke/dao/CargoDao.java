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
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-8-30上午10:34:49
 * @version 1.0
 */
public interface CargoDao {
	/**
	 * 插入货物列表
	 * @param cargo
	 * @throws SQLException
	 */
	public void insertCargo(Map<String,String> cargo) throws SQLException;
	
	/**
	 * 查询货物列表
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String,String>> queryCargoList(Map<String,String> map) throws SQLException;
}
