/**
 * 
 */
package com.deke.wechat.component;

/**
 * <p>
 * Title: Menu.java
 * </p>
 * <p>
 * Description:菜单对象的封装，菜单对象包含多个菜单项（最多只能有3个），这些菜单项即可以是子菜单项（不含二级菜单的一级菜单），也可以是父菜单项（
 * 包含二级菜单的菜单项）
 * </p>
 * <p>
 * Company: 上海龙巧物流
 * </p>
 * 
 * @author 叶龙
 * @data 2014-7-23上午01:13:16
 * @version 1.0
 */
public class Menu {
	private BasicCustomaButton[] button;

	public BasicCustomaButton[] getButton() {
		return button;
	}

	public void setButton(BasicCustomaButton[] button) {
		this.button = button;
	}
}
