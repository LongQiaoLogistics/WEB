/**
 * 
 */
package com.deke.weichat.message.response;

import java.util.Arrays;


/**
 * <p>Title: TextMessage.java</p>
 * <p>Description:��Ӧ�ı���Ϣ  </p>
 * <p>Company: �Ϻ���������</p>
 * @author Ҷ��
 * @data 2014-7-18����12:44:07
 * @version 1.0
 */
public class TextMessage extends BaseMessage {
	//�ظ������ݲ�����2048���ֽ�
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}
