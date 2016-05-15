/**
 * 
 */
package com.deke.wechat.util;

import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

//import sun.util.logging.resources.logging;

import com.deke.weichat.message.response.TextMessage;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

/**
 * <p>
 * Title: MessageUtil.java
 * </p>
 * <p>
 * Description:��������������
 * </p>
 * <p>
 * Company: ������������
 * </p>
 * 
 * @author ����
 * @data 2014-7-18����12:45:41
 * @version 1.0
 */
public class MessageUtil {
	static Logger logger = Logger.getLogger("");
	/**
	 * ����������������OpenID��
	 */
	public static final String FROMUSERNAME = "FromUserName";
	/**
	 * ������������
	 */
	public static final String TOUSERNAME = "ToUserName";
	/**
	 * ������������ ��������
	 */
	public static final String CREATETIME = "CreateTime";
	/**
	 * ��������
	 */
	public static final String MSGTYPE = "MsgType";
	/**
	 * ����id��64������
	 */
	public static final String MSGID = "MsgId";

	/**
	 * ��������
	 */
	public static final String EVENT = "Event";

	/**
	 * ������������������
	 */
	public static final String RESP_MESSAGE_TYPE_TEXT = "text";

	/**
	 * ������������������
	 */
	public static final String RESP_MESSAGE_TYPE_MUSIC = "music";

	/**
	 * ������������������
	 */
	public static final String RESP_MESSAGE_TYPE_NEWS = "news";

	/**
	 * ������������������
	 */
	public static final String REQ_MESSAGE_TYPE_TEXT = "text";

	/**
	 * ������������������
	 */
	public static final String REQ_MESSAGE_TYPE_IMAGE = "image";

	/**
	 * ������������������
	 */
	public static final String REQ_MESSAGE_TYPE_LINK = "link";

	/**
	 * ����������������������
	 */
	public static final String REQ_MESSAGE_TYPE_LOCATION = "location";

	/**
	 * ������������������
	 */
	public static final String REQ_MESSAGE_TYPE_VOICE = "voice";

	/**
	 * ������������������
	 */
	public static final String REQ_MESSAGE_TYPE_EVENT = "event";

	/**
	 * ����������subscribe(����)
	 */
	public static final String EVENT_TYPE_SUBSCRIBE = "subscribe";

	/**
	 * ����������unsubscribe(��������)
	 */
	public static final String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";

	/**
	 * ����������CLICK(������������������)
	 */
	public static final String EVENT_TYPE_CLICK = "CLICK";

	public static Map<String, String> parseXml(HttpServletRequest request) throws IOException {

		// ����������������HashMap��
		Map<String, String> map = new HashMap<String, String>();

		// ��request������������
		InputStream inputStream = null;
		try {
			inputStream = request.getInputStream();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// ����������
		SAXReader reader = new SAXReader();
		Document document = null;
		try {
			document = reader.read(inputStream);
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// ����xml������
		Element root = document.getRootElement();
		// ����������������������
		List<Element> elementList = root.elements();

		// ��������������
		for (Element e : elementList)
			map.put(e.getName(), e.getText());

		// ��������
		inputStream.close();
		inputStream = null;

		return map;
	}

	/**
	 * ������������������xml
	 * 
	 * @param textMessage
	 *            ������������
	 * @return xml
	 */
	public static String textMessageToXml(TextMessage textMessage) {
		xstream.alias("xml", textMessage.getClass());
		return xstream.toXML(textMessage);
	}

	/**
	 * ������������������xml
	 * 
	 * @param musicMessage
	 *            ������������
	 * @return xml
	 */
	/*
	 * public static String musicMessageToXml(MusicMessage musicMessage) {
	 * xstream.alias("xml", musicMessage.getClass()); return
	 * xstream.toXML(musicMessage); }
	 */

	/**
	 * ������������������xml
	 * 
	 * @param newsMessage
	 *            ������������
	 * @return xml
	 */
	/*
	 * public static String newsMessageToXml(NewsMessage newsMessage) {
	 * xstream.alias("xml", newsMessage.getClass()); xstream.alias("item", new
	 * Article().getClass()); return xstream.toXML(newsMessage); }
	 */

	/**
	 * ����xstream����������CDATA��
	 * 
	 * @date 2013-05-19
	 */
	private static XStream xstream = new XStream(new XppDriver() {
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				// ������xml����������������CDATA����
				boolean cdata = true;

				@SuppressWarnings("unchecked")
				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}

				protected void writeText(QuickWriter writer, String text) {
					if (cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});
}