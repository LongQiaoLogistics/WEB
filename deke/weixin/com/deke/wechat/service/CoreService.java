/**
 * 
 */
package com.deke.wechat.service;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.deke.wechat.util.MessageUtil;

/**
 * <p>
 * Title: CoreService.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: �Ϻ���������
 * </p>
 * 
 * @author Ҷ��
 * @data 2014-7-18����12:58:46
 * @version 1.0
 */
public class CoreService {
	Logger logger = Logger.getLogger(getClass());

	public static String processRequest(HttpServletRequest request) throws IOException {
		// ���������û����ͺ�����Ϣ,�����Ȼظ�һ���ı���Ϣ
		String respMessage = null;
		Map<String, String> map = MessageUtil.parseXml(request);
		String FromUserName = map.get(MessageUtil.FROMUSERNAME);
		String ToUserName = map.get(MessageUtil.TOUSERNAME);
		String MsgType = map.get(MessageUtil.MSGTYPE);
		if (MessageUtil.REQ_MESSAGE_TYPE_TEXT.equals(MsgType)) {
			respMessage = "�����͵����ı���Ϣ";
		} else if (MessageUtil.REQ_MESSAGE_TYPE_EVENT.equals(MsgType)) {
			String Event = map.get(MessageUtil.EVENT);
			if (MessageUtil.EVENT_TYPE_CLICK.equals(Event)) {
				respMessage = "�����͵��ǲ˵��¼�";
			} else if (MessageUtil.EVENT_TYPE_SUBSCRIBE.equals(Event)) {
				respMessage = "�����͵��Ƕ����¼�";
			} else if (MessageUtil.EVENT_TYPE_UNSUBSCRIBE.equals(Event)) {
				respMessage = "�����͵���ȡ�������¼�";
			}
		}
		return respMessage;
	}
}
