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
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-7-18上午12:58:46
 * @version 1.0
 */
public class CoreService {
	Logger logger = Logger.getLogger(getClass());

	public static String processRequest(HttpServletRequest request) throws IOException {
		// 这里无论用户发送何种消息,首先先回复一个文本消息
		String respMessage = null;
		Map<String, String> map = MessageUtil.parseXml(request);
		String FromUserName = map.get(MessageUtil.FROMUSERNAME);
		String ToUserName = map.get(MessageUtil.TOUSERNAME);
		String MsgType = map.get(MessageUtil.MSGTYPE);
		if (MessageUtil.REQ_MESSAGE_TYPE_TEXT.equals(MsgType)) {
			respMessage = "您发送的是文本消息";
		} else if (MessageUtil.REQ_MESSAGE_TYPE_EVENT.equals(MsgType)) {
			String Event = map.get(MessageUtil.EVENT);
			if (MessageUtil.EVENT_TYPE_CLICK.equals(Event)) {
				respMessage = "您发送的是菜单事件";
			} else if (MessageUtil.EVENT_TYPE_SUBSCRIBE.equals(Event)) {
				respMessage = "您发送的是订阅事件";
			} else if (MessageUtil.EVENT_TYPE_UNSUBSCRIBE.equals(Event)) {
				respMessage = "您发送的是取消订阅事件";
			}
		}
		return respMessage;
	}
}
