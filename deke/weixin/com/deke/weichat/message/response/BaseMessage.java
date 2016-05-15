/**
 * 
 */
package com.deke.weichat.message.response;

/**
 * <p>
 * Title: BaseMessage.java
 * </p>
 * <p>
 * Description:������Ϣ���� (server -> weixin)
 * </p>
 * <p>
 * Company: �Ϻ���������
 * </p>
 * 
 * @author Ҷ��
 * @data 2014-7-18����12:40:12
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
