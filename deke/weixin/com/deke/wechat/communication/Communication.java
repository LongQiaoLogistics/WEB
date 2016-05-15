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
 * Description: 通信基础接口
 * </p>
 * <p>
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-7-23上午01:47:31
 * @version 1.0
 */
public interface Communication {
	public JSONObject requset(String requestUrl, String requestMethod, String outputStr);
}
