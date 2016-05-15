/**
 * 
 */
package com.deke.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.deke.dao.ParameterDao;
import com.deke.entity.ParameterEntity;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * <p>
 * Title: ParameterDaoImpl.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-8-30上午10:38:55
 * @version 1.0
 */
@Repository("parameterDao")
public class ParameterDaoImpl implements ParameterDao {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.deke.dao.ParameterDao#quJeryPE()
	 */
	@Resource(name = "sqlMapClient")
	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	public List<ParameterEntity> quJeryPE() throws SQLException {
		return sqlMapClient.queryForList("PE.QUERYLISTFROM_T_CODE_RULE");
	}

}
