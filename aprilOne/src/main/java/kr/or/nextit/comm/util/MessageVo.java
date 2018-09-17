package kr.or.nextit.comm.util;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class MessageVo implements Serializable {

	private String msgValue;
	private String msgTag;

	public String getMsgValue() {
		return msgValue;
	}

	public void setMsgValue(String msgValue) {
		this.msgValue = msgValue;
	}

	public String getMsgTag() {
		return msgTag;
	}

	public void setMsgTag(String msgTag) {
		this.msgTag = msgTag;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
