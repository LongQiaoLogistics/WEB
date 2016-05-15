/**
 * 
 */
package com.deke.weichat.message.response;

/**
 * <p>
 * Title: BaseMessage.java
 * </p>
 * <p>
 * Description:发送消息基类 (server -> weixin)
 * </p>
 * <p>
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-7-18上午12:40:12
 * @version 1.0
 */
public class BaseMessage {
	private String ToUserName;
	private String FromUserName;
	private String CreateTime;
	private String MsgType;

	public String getToUserName() {
		return ToUserName;
	}

	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}

	public String getFromUserName() {
		return FromUserName;
	}

	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}

	public String getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}

	public String getMsgType() {
		return MsgType;
	}

	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
}
