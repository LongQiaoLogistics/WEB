/**
 * 
 */
package com.deke.basic.test.accesstoken;

import com.deke.wechat._interface.BaseSupport.GetAccessToken;
import com.deke.wechat.entity.Access_token;

/**
 * <p>Title: AccessTokenTest.java</p>
 * <p>Description: </p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-7-23上午02:24:57
 * @version 1.0
 */
public class AccessTokenTest {
	public static void main(String[] args) {
		Access_token a = GetAccessToken.getAccessToken("wx365c7b3929a1a80a", "300fc9e6f5292a368c58c1c553ffdb05");
		System.out.println(a);
	}
}
