/**
 * 
 */
package com.deke.wechat.component;

/**
 * <p>
 * Title: ComplexButton.java
 * </p>
 * <p>
 * Description:���˵���ķ�װ�� �Ը��˵���Ķ��壺�����ж����˵����һ���˵��� ����˵�������ж������ԣ�name��sub_button
 * ����sub_button����һ���Ӳ˵������顣���˵���ķ�װ�������£�
 * </p>
 * <p>
 * Company: �Ϻ���������
 * </p>
 * 
 * @author Ҷ��
 * @data 2014-7-23����01:11:16
 * @version 1.0
 */
public class ComplexButton extends BasicCustomaButton {
	private BasicCustomaButton[] sub_button;

	public BasicCustomaButton[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(BasicCustomaButton[] sub_button) {
		this.sub_button = sub_button;
	}
}
