package com.board.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SmartbillApiHanwhaVO {

	private String hanwhaEtcPcsNo;
	private String hanwhaIssueId;
	private String hanwhaSupComRegno;
	private String hanwhaDirection;
	private String hanwhaDtiStatus;
	private String smartbillResultCode;

	//한화 WebHook
	@JsonProperty("MESSAGEID")
	private String MESSAGEID;
	@JsonProperty("REQUESTTIME")
	private String REQUESTTIME;
	@JsonProperty("DTI_WDAY")
	private String DTI_WDAY;
	@JsonProperty("SIGNAL_TYPE")
	private String SIGNAL_TYPE;
	@JsonProperty("DTI_STATUS")
	private String DTI_STATUS;
	@JsonProperty("CHANGE_DTI_STATUS_DATE")
	private String CHANGE_DTI_STATUS_DATE;
	@JsonProperty("NTS_SEND_STATUS")
	private String NTS_SEND_STATUS;
	@JsonProperty("NTS_RESULT_CODE")
	private String NTS_RESULT_CODE;
	@JsonProperty("NTS_SEND_DATE")
	private String NTS_SEND_DATE;
	@JsonProperty("ETC_PCS_NO")
	private String ETC_PCS_NO;
	@JsonProperty("ISSUE_ID")
	private String ISSUE_ID;
	@JsonProperty("SUP_COM_REGNO")
	private String SUP_COM_REGNO;
	@JsonProperty("BYR_COM_REGNO")
	private String BYR_COM_REGNO;
	@JsonProperty("BRK_COM_REGNO")
	private String BRK_COM_REGNO;
	@JsonProperty("RCV_COM_REGNO")
	private String RCV_COM_REGNO;
	@JsonProperty("RETRY_CNT")
	private String RETRY_CNT;

	public String getMESSAGEID() {
		return MESSAGEID;
	}

	public void setMESSAGEID(String MESSAGEID) {
		this.MESSAGEID = MESSAGEID;
	}

	public String getREQUESTTIME() {
		return REQUESTTIME;
	}

	public void setREQUESTTIME(String REQUESTTIME) {
		this.REQUESTTIME = REQUESTTIME;
	}

	public String getDTI_WDAY() {
		return DTI_WDAY;
	}

	public void setDTI_WDAY(String DTI_WDAY) {
		this.DTI_WDAY = DTI_WDAY;
	}

	public String getSIGNAL_TYPE() {
		return SIGNAL_TYPE;
	}

	public void setSIGNAL_TYPE(String SIGNAL_TYPE) {
		this.SIGNAL_TYPE = SIGNAL_TYPE;
	}

	public String getDTI_STATUS() {
		return DTI_STATUS;
	}

	public void setDTI_STATUS(String DTI_STATUS) {
		this.DTI_STATUS = DTI_STATUS;
	}

	public String getCHANGE_DTI_STATUS_DATE() {
		return CHANGE_DTI_STATUS_DATE;
	}

	public void setCHANGE_DTI_STATUS_DATE(String CHANGE_DTI_STATUS_DATE) {
		this.CHANGE_DTI_STATUS_DATE = CHANGE_DTI_STATUS_DATE;
	}

	public String getNTS_SEND_STATUS() {
		return NTS_SEND_STATUS;
	}

	public void setNTS_SEND_STATUS(String NTS_SEND_STATUS) {
		this.NTS_SEND_STATUS = NTS_SEND_STATUS;
	}

	public String getNTS_RESULT_CODE() {
		return NTS_RESULT_CODE;
	}

	public void setNTS_RESULT_CODE(String NTS_RESULT_CODE) {
		this.NTS_RESULT_CODE = NTS_RESULT_CODE;
	}

	public String getNTS_SEND_DATE() {
		return NTS_SEND_DATE;
	}

	public void setNTS_SEND_DATE(String NTS_SEND_DATE) {
		this.NTS_SEND_DATE = NTS_SEND_DATE;
	}

	public String getETC_PCS_NO() {
		return ETC_PCS_NO;
	}

	public void setETC_PCS_NO(String ETC_PCS_NO) {
		this.ETC_PCS_NO = ETC_PCS_NO;
	}

	public String getISSUE_ID() {
		return ISSUE_ID;
	}

	public void setISSUE_ID(String ISSUE_ID) {
		this.ISSUE_ID = ISSUE_ID;
	}

	public String getSUP_COM_REGNO() {
		return SUP_COM_REGNO;
	}

	public void setSUP_COM_REGNO(String SUP_COM_REGNO) {
		this.SUP_COM_REGNO = SUP_COM_REGNO;
	}

	public String getBYR_COM_REGNO() {
		return BYR_COM_REGNO;
	}

	public void setBYR_COM_REGNO(String BYR_COM_REGNO) {
		this.BYR_COM_REGNO = BYR_COM_REGNO;
	}

	public String getBRK_COM_REGNO() {
		return BRK_COM_REGNO;
	}

	public void setBRK_COM_REGNO(String BRK_COM_REGNO) {
		this.BRK_COM_REGNO = BRK_COM_REGNO;
	}

	public String getRCV_COM_REGNO() {
		return RCV_COM_REGNO;
	}

	public void setRCV_COM_REGNO(String RCV_COM_REGNO) {
		this.RCV_COM_REGNO = RCV_COM_REGNO;
	}

	public String getRETRY_CNT() {
		return RETRY_CNT;
	}

	public void setRETRY_CNT(String RETRY_CNT) {
		this.RETRY_CNT = RETRY_CNT;
	}

	public String getSmartbillResultCode() {
		return smartbillResultCode;
	}

	public void setSmartbillResultCode(String smartbillResultCode) {
		this.smartbillResultCode = smartbillResultCode;
	}

	public String getHanwhaEtcPcsNo() {
		return hanwhaEtcPcsNo;
	}

	public void setHanwhaEtcPcsNo(String hanwhaEtcPcsNo) {
		this.hanwhaEtcPcsNo = hanwhaEtcPcsNo;
	}

	public String getHanwhaIssueId() {
		return hanwhaIssueId;
	}

	public void setHanwhaIssueId(String hanwhaIssueId) {
		this.hanwhaIssueId = hanwhaIssueId;
	}

	public String getHanwhaSupComRegno() {
		return hanwhaSupComRegno;
	}

	public void setHanwhaSupComRegno(String hanwhaSupComRegno) {
		this.hanwhaSupComRegno = hanwhaSupComRegno;
	}

	public String getHanwhaDirection() {
		return hanwhaDirection;
	}

	public void setHanwhaDirection(String hanwhaDirection) {
		this.hanwhaDirection = hanwhaDirection;
	}

	public String getHanwhaDtiStatus() {
		return hanwhaDtiStatus;
	}

	public void setHanwhaDtiStatus(String hanwhaDtiStatus) {
		this.hanwhaDtiStatus = hanwhaDtiStatus;
	}
}