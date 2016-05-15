/**
 * 
 */
package com.deke.weichat.message.request;

/**
 * <p>Title: ImageMessage.java</p>
 * <p>Description: 圖片消息</p>
 * <p>Company: 上海龙巧物流</p>
 * @author 叶龙
 * @data 2014-7-17下午11:18:01
 * @version 1.0
 */
public class ImageMessage extends BaseMessage {
    /**
     * 圖片鏈接
     */
    private String PicUrl;  
  
    public String getPicUrl() {  
        return PicUrl;  
    }  
  
    public void setPicUrl(String picUrl) {  
        PicUrl = picUrl;  
    }  
}
