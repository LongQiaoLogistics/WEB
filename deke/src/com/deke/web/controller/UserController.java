package com.deke.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.deke.entity.User;
import com.deke.service.UserService;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * @author Ҷ�� �û�����ģ��
 */
@Controller
@RequestMapping(value = "/user")
@SessionAttributes(value={"user"})
// method=RequestMethod.POST �趨����ʽֻ����post
public class UserController {
	private Logger logger = Logger.getLogger(this.getClass());
	private CommonsMultipartResolver commonsMultipartResolver;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@ModelAttribute("user")
	public void getUser(@RequestParam(value="userName",required=false) String userName,Map<String,Object> map) throws SQLException {
		logger.debug("��ʼִ��modelAttribute����,�����û����������ݿ�"+userName);
		User user = userService.queryUser(userName);
		logger.debug("��ѯ��һ���û�"+user);
		map.put("user",user);
	}
	/**
	 * �û�ע��
	 * 
	 * @param devicePlatform
	 * @param user
	 * @param sessionId
	 * @param session
	 * @return
	 * @throws SQLException
	 */
	public ModelAndView register(User user) throws SQLException {
		//response.addCookie(new Cookie("name","LQ.Cookie"));�������������ʹ��HttpServletResponse������Ӧ���򷵻�ֵ���ó�void
		return new ModelAndView("register");
	}

	/**
	 * �û���¼
	 * 
	 * @param devicePlatform
	 * @param user
	 * @param sessionId
	 * @param session
	 * @return
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/login")
	public String login(User user) throws SQLException {
		logger.error("�û���ʼ�����û���Ϊ��" + user.getUserName());
		logger.error("�û���ʼ��������Ϊ��" + user.getPassword());logger.error("�û���ʼ����idΪ��" + user.getId());
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "/exit")
	public String exit(ModelMap modelMap, SessionStatus sessionStatus) {
		modelMap.remove("user");
		sessionStatus.setComplete();// ��SpringMVC�����������Ӧ�ĻỰ����
		return "redirect:/index.jsp";
	}

	/**
	 * �û���ѯ
	 * 
	 * @param nickName
	 * @param session
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/query", params = "nickName")
	private void query(@RequestParam(value = "nickName", required = true) String nickName, HttpSession session) {
		String password = (String) session.getAttribute(nickName);
		System.out.println(password);
	}

	// �ϴ��ļ���ʽһ
	/*
	 * @RequestMapping("uploadImg") private void uploadImg(@RequestParam("file")
	 * CommonsMultipartFile file) { if (!file.isEmpty()) { try { InputStream is
	 * = file.getInputStream(); byte[] buffer = new byte[is.available()];
	 * is.read(buffer); OutputStream os = new FileOutputStream();
	 * os.write(buffer);
	 * 
	 * } catch (FileNotFoundException e) { e.printStackTrace(); } catch
	 * (IOException e) { e.printStackTrace(); }
	 * 
	 * } }
	 */
	// �ϴ��ļ��� ���ڴ����û��ϴ��ļ�������
	@SuppressWarnings("unused")
	@RequestMapping("/uploadImg")
	private void uploadImg(HttpServletRequest request, HttpServletResponse response) {
		if (commonsMultipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest requestMulti = (MultipartHttpServletRequest) request;
			Iterator<String> it = requestMulti.getFileNames();
			while (it.hasNext()) {	
				MultipartFile multipartFile = requestMulti.getFile(it.next());
				try {
					multipartFile.transferTo(new File("d://Users"));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@SuppressWarnings("unused")
	@RequestMapping("/downloadImg")
	private void downloadPic(@RequestParam("picName") String picName, HttpServletResponse response) {
		org.springframework.core.io.Resource resource = new ClassPathResource(picName + ".jpg");
		try {
			byte[] buffer = FileCopyUtils.copyToByteArray(resource.getInputStream());
			OutputStream os = response.getOutputStream();
			os.write(buffer);
			os.flush();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
