/**
 * 
 */
package com.deke.weichat.message.response;

import java.util.Arrays;


/**
 * <p>Title: TextMessage.java</p>
 * <p>Description:响应文本消息  </p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-7-18上午12:44:07
 * @version 1.0
 */
public class TextMessage extends BaseMessage {
	//回复的内容不操作2048个字节
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}
