/**
 * 
 */
package com.deke.wechat.communication;

import net.sf.json.JSONObject;

/**
 * <p>
 * Title: Communication.java
 * </p>
 * <p>
 * Description: ͨ�Ż����ӿ�
 * </p>
 * <p>
 * Company: �Ϻ���������
 * </p>
 * 
 * @author Ҷ��
 * @data 2014-7-23����01:47:31
 * @version 1.0
 */
public interface Communication {
	public JSONObject requset(String requestUrl, String requestMethod, String outputStr);
}
