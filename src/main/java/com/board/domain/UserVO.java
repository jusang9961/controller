package com.board.domain;

public class UserVO {

	private String userID;		
	private String userPass;		
	private String userName;		
	private String userGender;		
	private String userEmail;		
	
	public String getUserID() {
		return userID;
		
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserPass() {
		return userPass;
	}
	
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserGender() {
		return userGender;
	}
	
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
}
