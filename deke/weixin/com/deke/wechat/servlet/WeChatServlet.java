package com.deke.wechat.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.deke.wechat.service.CoreService;
import com.deke.wechat.util.SignUtil;

/**
 * <p>Title: WeChatServlet.java</p>
 * <p>Description:����΢�ź��ķ�������Servletǰ�ô�����</p>
 * @author Ҷ��
 * @data 2015-4-1
 * @version 1.0
 */
public class WeChatServlet extends HttpServlet {
	private static final long serialVersionUID = 4440739483644821986L;
	Logger logger = Logger.getLogger(getClass());

	/**
	 * ������������΢�ŷ�����
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ΢�ż���ǩ��
		String signature = request.getParameter("signature");
		// ʱ���
		String timestamp = request.getParameter("timestamp");
		// �����
		String nonce = request.getParameter("nonce");
		// ����ַ���
		String echostr = request.getParameter("echostr");

		PrintWriter out = response.getWriter();
		// ͨ������signature���������У�飬��У��ɹ���ԭ������echostr����ʾ����ɹ����������ʧ��
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			out.print(echostr);
		}
		out.close();
		out = null;
	}

	/**
	 * ����΢�ŷ�������������Ϣ
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("��ʼ����΢�ź�������");
		// ��������Ӧ�ı��������ΪUTF-8����ֹ�������룩
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// ���ú���ҵ���������Ϣ��������Ϣ
		String respMessage = CoreService.processRequest(request);
		// ��Ӧ��Ϣ
		PrintWriter out = response.getWriter();
		out.print(respMessage);
		out.close();
	}
}