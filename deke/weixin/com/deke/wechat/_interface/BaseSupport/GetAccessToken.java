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
 * http����ʽ: GET
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
 * Description:ͨ��access_token�ǹ��ںŵ�ȫ��ΨһƱ�ݣ����ںŵ��ø��ӿ�ʱ����ʹ��access_token��
 * ���������access_token��Ч��Ϊ7200�룬�ظ���ȡ�������ϴλ�ȡ��access_tokenʧЧ��
 * </p>
 * @author �Ϻ���������
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
				// ��ù���ʱ��
				accessToken.setExpires_in(jsonObject.getString(Wechat_Constant.BasicInteface.EXPIRES_IN));
				// ���AccessToken
				accessToken.setAccess_token(jsonObject.getString(Wechat_Constant.BasicInteface.ACCESS_TOKEN));
			} catch (JSONException e) {
				accessToken = null;
				// ��ȡtokenʧ��
				logger.error("��ȡtokenʧ�� errcode:{" + jsonObject.getInt("errcode") + "} errmsg:{" + jsonObject.getString("errmsg") + "}");
			}
		}
		return accessToken;

	}
}
