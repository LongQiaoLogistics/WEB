package com.deke.weichat.message.request;

/**
 * <p>Title: TextMessage.java</p>
 * <p>Description:文本消息 </p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-7-17下午11:16:58
 * @version 1.0
 */
public class TextMessage extends BaseMessage {
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

}
