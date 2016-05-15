package com.deke.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.deke.entity.User;
public interface CargoService {
	public void addCargo(Map<String,String> cargo) throws SQLException;
	public List<Map<String,String>> queryCargoList(Map<String,String> condition) throws SQLException;
}
