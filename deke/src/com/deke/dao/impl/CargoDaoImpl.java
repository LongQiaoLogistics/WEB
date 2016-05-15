package com.deke.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

import com.deke.dao.CargoDao;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * <p>
 * Title: ParameterDaoImpl.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company:上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-8-30
 * @version 1.0
 */
@Repository("cargoDao")
public class CargoDaoImpl implements CargoDao {

	@Resource(name = "sqlMapClient")
	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	public void insertCargo(Map<String, String> cargo) throws SQLException {
		sqlMapClient.insert("CARGO.INSERT_CARGO", cargo);
	}

	public List<Map<String, String>> queryCargoList(Map<String,String> map) throws SQLException {
		return sqlMapClient.queryForList("CARGO.SELECT_CARGO_LIST_BY_ORIGINANDDESTS",map);
	}

}
