/**
 * 
 */
package com.deke.weichat.message.request;

/**
 * <p>Title: ImageMessage.java</p>
 * <p>Description: �DƬ��Ϣ</p>
 * <p>Company: �Ϻ���������</p>
 * @author Ҷ��
 * @data 2014-7-17����11:18:01
 * @version 1.0
 */
public class ImageMessage extends BaseMessage {
    /**
     * �DƬ朽�
     */
    private String PicUrl;  
  
    public String getPicUrl() {  
        return PicUrl;  
    }  
  
    public void setPicUrl(String picUrl) {  
        PicUrl = picUrl;  
    }  
}
