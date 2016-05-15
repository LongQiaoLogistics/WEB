/**
 * 
 */
package com.deke.wechat.component;

/**
 * <p>
 * Title: ComplexButton.java
 * </p>
 * <p>
 * Description:父菜单项的封装。 对父菜单项的定义：包含有二级菜单项的一级菜单。 这类菜单项包含有二个属性：name和sub_button
 * ，而sub_button以是一个子菜单项数组。父菜单项的封装代码如下：
 * </p>
 * <p>
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-7-23上午01:11:16
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
