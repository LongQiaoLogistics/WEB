package com.deke.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deke.dao.CargoDao;
import com.deke.service.CargoService;

@Service(value = "cargoService")
public class CargoServiceImpl implements CargoService {
	private Logger logger = Logger.getLogger(getClass());
	@Resource(name = "cargoDao")
	private CargoDao cargoDao;
	
	@Transactional
	public void addCargo(Map<String, String> cargo) throws SQLException {
		cargoDao.insertCargo(cargo);
	}
	
	public List<Map<String,String>> queryCargoList(Map<String,String> condition) throws SQLException{
		return cargoDao.queryCargoList(condition);
	} 
 }
