/**
 * 
 */
package com.deke.wechat.component;

/**
 * <p>Title: CommonButton.java</p>
 * <p>Description: 子菜单项的封装。这里对子菜单是这样定义的：没有子菜单的菜单项，有可能是二级菜单项，也有可能是不含二级菜单的一级菜单。这类子菜单项一定会包含三个属性：type、name和key</p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-7-23上午01:10:18
 * @version 1.0
 */
public class CommonButton extends BasicCustomaButton {
		private String type;  
	    private String key;  
	  
	    public String getType() {  
	        return type;  
	    }  
	  
	    public void setType(String type) {  
	        this.type = type;  
	    }  
	  
	    public String getKey() {  
	        return key;  
	    }  
	  
	    public void setKey(String key) {  
	        this.key = key;  
	    }  
}
