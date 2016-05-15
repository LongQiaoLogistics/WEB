/**
 * 
 */
package com.deke.weichat.message.request;

/**
 * <p>Title: LocationMessage.java</p>
 * <p>Description:地理位置消息  </p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-7-17下午11:20:01
 * @version 1.0
 */
public class LocationMessage extends BaseMessage {
	// 地理位置维度  
    private String Location_X;  
    // 地理位置经度  
    private String Location_Y;  
    // 地图缩放大小  
    private String Scale;  
    // 地理位置信息  
    private String Label;  
  
    public String getLocation_X() {  
        return Location_X;  
    }  
  
    public void setLocation_X(String location_X) {  
        Location_X = location_X;  
    }  
  
    public String getLocation_Y() {  
        return Location_Y;  
    }  
  
    public void setLocation_Y(String location_Y) {  
        Location_Y = location_Y;  
    }  
  
    public String getScale() {  
        return Scale;  
    }  
  
    public void setScale(String scale) {  
        Scale = scale;  
    }  
  
    public String getLabel() {  
        return Label;  
    }  
  
    public void setLabel(String label) {  
        Label = label;  
    }  
}
