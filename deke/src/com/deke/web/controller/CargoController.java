package com.deke.web.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.deke.constant.LQConstant;
import com.deke.dao.ParameterDao;
import com.deke.entity.ParameterEntity;
import com.deke.entity.User;
import com.deke.service.CargoService;

/**
 * 
 * 
 * @author 叶锟斤拷
 */
@Controller
@RequestMapping(value = "/cargo")
// method=RequestMethod.POST 锟借定锟斤拷锟斤拷式只锟斤拷锟斤拷post
public class CargoController {
	Logger logger = Logger.getLogger(getClass());
	
	@Resource(name = "cargoService")
	private CargoService cargoService;

	public CargoService getCargoService() {
		return cargoService;
	}

	public void setCargoService(CargoService cargoService) {
		this.cargoService = cargoService;
	}

	@Resource(name = "parameterDao")
	private ParameterDao parameterDao;

	public ParameterDao getParameterDao() {
		return parameterDao;
	}

	public void setParameterDao(ParameterDao parameterDao) {
		this.parameterDao = parameterDao;
	}

	@RequestMapping(value = "/seekCargo")
	public ModelAndView seekCargo() {
		return new ModelAndView("seekCargo");
	}

	@RequestMapping(value = "/queryCargoList")
	public ModelAndView queryCargoList(HttpServletRequest request) throws UnsupportedEncodingException {
		Map<String, String> condition = new HashMap<String, String>();
		String origin_province = request.getParameter(LQConstant.ORIGIN_PROVINCE);
		String origin_city = request.getParameter(LQConstant.ORIGIN_CITY);
		String origin_country = request.getParameter(LQConstant.ORIGIN_COUNTRY);
		String dest_province = request.getParameter(LQConstant.DEST_PROVINCE);
		String dest_city = request.getParameter(LQConstant.DEST_CITY);
		String dest_country = request.getParameter(LQConstant.DEST_COUNTRY);
		if ("地级市".equals(origin_city)) {
			origin_city = null;
		}
		if ("市、县级市".equals(origin_country)) {
			origin_country = null;
		}
		if ("地级市".equals(dest_city)) {
			dest_city = null;
		}
		if ("市、县级市".equals(dest_country)) {
			dest_country = null;
		}
		condition.put(LQConstant.ORIGIN_PROVINCE, origin_province);
		condition.put(LQConstant.ORIGIN_CITY, origin_city);
		condition.put(LQConstant.ORIGIN_COUNTRY, origin_country);
		condition.put(LQConstant.DEST_PROVINCE, dest_province);
		condition.put(LQConstant.DEST_CITY, dest_city);
		condition.put(LQConstant.DEST_COUNTRY, dest_country);
		List<Map<String, String>> list = null;
		try {
			list = cargoService.queryCargoList(condition);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ModelAndView("seekCargo", "result", list);
	}

	@RequestMapping(value = "/deliverCargo")
	public ModelAndView deliverCargo(HttpServletRequest request) throws SQLException {
		List<ParameterEntity> peList = parameterDao.quJeryPE();
		return new ModelAndView("deliverCargo", "peList", peList);
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/insertCargo")
	public @ResponseBody
	Map<String, Boolean> insertCargo(HttpServletRequest request) throws SQLException, UnsupportedEncodingException {
		Map<String, String> cargoEntity = new HashMap<String, String>();
		String origin_province = request.getParameter(LQConstant.ORIGIN_PROVINCE);
		String origin_city = request.getParameter(LQConstant.ORIGIN_CITY);
		String origin_country = request.getParameter(LQConstant.ORIGIN_COUNTRY);
		String dest_province = request.getParameter(LQConstant.DEST_PROVINCE);
		String dest_city = request.getParameter(LQConstant.DEST_CITY);
		String dest_country = request.getParameter(LQConstant.DEST_COUNTRY);
		if ("地级市".equals(origin_city)) {
			origin_city = null;
		}
		if ("市、县级市".equals(origin_country)) {
			origin_country = null;
		}
		if ("地级市".equals(dest_city)) {
			dest_city = null;
		}
		if ("市、县级市".equals(dest_country)) {
			dest_country = null;
		}
		cargoEntity.put(LQConstant.ORIGIN_PROVINCE, origin_province);
		cargoEntity.put(LQConstant.ORIGIN_CITY, origin_city);
		cargoEntity.put(LQConstant.ORIGIN_COUNTRY, origin_country);
		cargoEntity.put(LQConstant.DEST_PROVINCE, dest_province);
		cargoEntity.put(LQConstant.DEST_CITY, dest_city);
		cargoEntity.put(LQConstant.DEST_COUNTRY, dest_country);
		cargoEntity.put(LQConstant.CARGO_TYPE, request.getParameter(LQConstant.CARGO_TYPE));
		cargoEntity.put(LQConstant.CARGO_NUMBER, request.getParameter(LQConstant.CARGO_NUMBER));
		cargoEntity.put(LQConstant.CARGO_UNIT, request.getParameter(LQConstant.CARGO_UNIT));
		cargoEntity.put(LQConstant.TRUCK_TYPE, request.getParameter(LQConstant.TRUCK_TYPE));
		cargoEntity.put(LQConstant.CARGO_FREIGHT, request.getParameter(LQConstant.CARGO_FREIGHT));
		cargoEntity.put(LQConstant.CARGO_PAYMENT_METHOD, request.getParameter(LQConstant.CARGO_PAYMENT_METHOD));
		String start_time = request.getParameter(LQConstant.CARGO_START_TIME);
		if ("".equals(start_time) || start_time == null) {
			start_time = null;
		}
		cargoEntity.put(LQConstant.CARGO_START_TIME, start_time);
		String end_time = request.getParameter(LQConstant.CARGO_END_TIME);
		if ("".equals(end_time) || end_time == null) {
			end_time = null;
		}
		cargoEntity.put(LQConstant.CARGO_END_TIME, end_time);
		cargoEntity.put(LQConstant.CARGO_USERNAME, request.getParameter(LQConstant.CARGO_USERNAME));
		cargoEntity.put(LQConstant.CARGO_PHONE, request.getParameter(LQConstant.CARGO_PHONE));
		Map<String, Boolean> flag = new HashMap<String, Boolean>();
		try {
			cargoService.addCargo(cargoEntity);
			flag.put("flag", true);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			flag.put("flag", false);
		} finally {
			return flag;
		}

	}

	@RequestMapping(value = "/seekLogistics")
	public ModelAndView seekLogistics() {
		return new ModelAndView("seekLogistics");
	}

	@RequestMapping(value = "/deliverLogistics")
	public ModelAndView deliverLogistics() {
		return new ModelAndView("deliverLogistics");
	}

	@RequestMapping(value = "/seekDriver")
	public ModelAndView seekDriver() {
		return new ModelAndView("seekDriver");
	}

	@RequestMapping(value = "/deliverDriver")
	public ModelAndView deliverDriver() {
		return new ModelAndView("deliverDriver");
	}

	@RequestMapping(value = "/seek2")
	public @ResponseBody
	User seek(HttpServletRequest request) {
		String str = request.getParameter("origin");
		String str1 = request.getParameter("dest");
		String str2 = request.getParameter("cargo_type");
		String str3 = request.getParameter("number");
		String str4 = request.getParameter("unit");
		String str5 = request.getParameter("truck_type");
		String str6 = request.getParameter("freight");
		String str7 = request.getParameter("payment_method");
		String str8 = request.getParameter("start_time");
		String str9 = request.getParameter("end_time");
		User user = new User();
		user.setUserName("yelong");
		user.setPassword("133118");
		return user;
	}

}
