package com.deke.wechat._interface.BaseSupport;

import org.apache.log4j.Logger;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import com.deke.wechat.communication.Communication;
import com.deke.wechat.communication._UrlConnection;
import com.deke.wechat.constant.Wechat_Constant;
import com.deke.wechat.entity.Access_token;

/**
 * <p>
 * http请求方式: GET
 * https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential
 * &appid=APPID&secret=APPSECRET
 * </p>
 * <p>
 * Company:
 * </p>
 * * <p>
 * Title: GetAccessToken.java
 * </p>
 * <p>
 * Description:通过access_token是公众号的全局唯一票据，公众号调用各接口时都需使用access_token。
 * 正常情况下access_token有效期为7200秒，重复获取将导致上次获取的access_token失效。
 * </p>
 * @author 上海龙巧物流
 * @data 2015-4-1
 * @version 1.0
 */
public class GetAccessToken {
	public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	static Access_token accessToken = null;
	static Logger logger = Logger.getLogger("");

	public static Access_token getAccessToken(String appid, String appsecret) {
		String requestUrl = access_token_url.replace("APPID", appid).replace("APPSECRET", appsecret);
		Communication communication = new _UrlConnection();
		JSONObject jsonObject = communication.requset(requestUrl, "GET", null);
		if (null != jsonObject) {
			try {
				accessToken = new Access_token();
				// 获得过期时间
				accessToken.setExpires_in(jsonObject.getString(Wechat_Constant.BasicInteface.EXPIRES_IN));
				// 获得AccessToken
				accessToken.setAccess_token(jsonObject.getString(Wechat_Constant.BasicInteface.ACCESS_TOKEN));
			} catch (JSONException e) {
				accessToken = null;
				// 获取token失败
				logger.error("获取token失败 errcode:{" + jsonObject.getInt("errcode") + "} errmsg:{" + jsonObject.getString("errmsg") + "}");
			}
		}
		return accessToken;

	}
}
