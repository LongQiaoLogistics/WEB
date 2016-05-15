/**
 * 
 */
package com.deke.http.test;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

/**
 * <p>
 * Title: WeChatHttpClient.java
 * </p>
 * <p>
 * Description:测试微信服务httpClient
 * </p>
 * <p>
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-7-19下午09:30:06
 * @version 1.0
 */
public class WeChatHttpClient {
	public static void main(String[] args) throws ClientProtocolException,
			IOException {
		HttpClient hc = new DefaultHttpClient();
		HttpPost post = new HttpPost("http://localhost:8080/deke/helloWeChat");
		StringEntity stringEntity = new StringEntity(" <xml>"
				+ " <ToUserName>yelong</ToUserName>"
				+ "  <FromUserName>woman</FromUserName> "
				+ "  <CreateTime>1348831860</CreateTime>"
				+ " <MsgType>event</MsgType>"
				+"<Event>subscribe</Event>"
				+ " <Content>niha</Content>"
				+ " <MsgId>1234567890123456</MsgId>" + " </xml>");
		post.setEntity(stringEntity);
		HttpResponse response = hc.execute(post);
		HttpEntity entity = response.getEntity();
		String str = EntityUtils.toString(entity,"UTF-8");
		System.out.println(str);
	}
}
