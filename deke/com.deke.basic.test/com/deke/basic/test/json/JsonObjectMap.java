/**
 * 
 */
package com.deke.basic.test.json;
import net.sf.json.JSONObject;
import com.deke.wechat.component.BasicCustomaButton;
import com.deke.wechat.component.CommonButton;
import com.deke.wechat.component.ComplexButton;
import com.deke.wechat.component.Menu;

/**
 * <p>
 * Title: JsonObjectMap.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: ������������
 * </p>
 * 
 * @author ����
 * @data 2014-7-23����12:52:22
 * @version 1.0
 */
public class JsonObjectMap {
	public static void main(String[] args) {
		CommonButton btn11 = new CommonButton();
		btn11.setName("����");
		btn11.setType("click");
		btn11.setKey("11");
		CommonButton btn12 = new CommonButton();
		btn12.setName("����44");
		btn12.setType("click");
		btn12.setKey("12");
		ComplexButton c1 = new ComplexButton();
		c1.setName("��������");
		c1.setSub_button(new BasicCustomaButton[] { btn11, btn12 });
		Menu menu = new Menu();
		menu.setButton(new BasicCustomaButton[] { c1 });
		JSONObject jsonObject = JSONObject.fromObject(menu);
		System.out.println(jsonObject);
	}
}
