package com.board.domain;

public class SmartbillOldCertVO {

	private String certRegno;
	private String certComName;
	private String userDn;
	private String expirationDate;

	public String getCertRegno() {
		return certRegno;
	}

	public void setCertRegno(String certRegno) {
		this.certRegno = certRegno;
	}

	public String getCertComName() {
		return certComName;
	}

	public void setCertComName(String certComName) {
		this.certComName = certComName;
	}

	public String getUserDn() {
		return userDn;
	}

	public void setUserDn(String userDn) {
		this.userDn = userDn;
	}

	public String getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
}
