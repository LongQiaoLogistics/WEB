/**
 * 
 */
package com.deke.wechat.entity;

/**
 * <p>
 * Title: Access_token.java
 * </p>
 * <p>
 * Description:Access_tokenʵ����
 * </p>
 * <p>
 * Company: �Ϻ���������
 * </p>
 * 
 * @author Ҷ��
 * @data 2014-7-23����01:42:21
 * @version 1.0
 */
public class Access_token {
	private String access_token;
	private String expires_in;

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String accessToken) {
		access_token = accessToken;
	}

	public String getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(String expiresIn) {
		expires_in = expiresIn;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "access_token: "+access_token + "  expires_in: "+expires_in;
	}
}