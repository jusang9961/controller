package com.board.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SmartbillApiHanwha2VO {

	@JsonProperty("MESSAGEID2")
	private String MESSAGEID2;

	public String getMESSAGEID2() {
		return MESSAGEID2;
	}

	public void setMESSAGEID2(String MESSAGEID2) {
		this.MESSAGEID2 = MESSAGEID2;
	}
}