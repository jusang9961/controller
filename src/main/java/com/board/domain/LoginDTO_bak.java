package com.board.domain;

public class LoginDTO_bak {

	private String userID;
	private String userPw;
	private boolean useCookie;
		
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	
	@Override
	public String toString() {
		return "LoginDTO{userID=" + userID + ", userPw=" + userPw + ", useCookie=" + useCookie + "}";
	}
		
	
}
