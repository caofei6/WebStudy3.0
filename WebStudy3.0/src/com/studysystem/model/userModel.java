package com.studysystem.model;

public class userModel {

	private String userID;
	private String Psw;
	private String userIdentity;
	private String userName;
	private String userSex;
	private String userTel;
	private String userMail;

	public userModel(String userID, String psw, String userIdentity,
			String userName, String userSex, String userTel, String userMail) {
		super();
		this.userID = userID;
		Psw = psw;
		this.userIdentity = userIdentity;
		this.userName = userName;
		this.userSex = userSex;
		this.userTel = userTel;
		this.userMail = userMail;
	}

	public userModel() {

	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPsw() {
		return Psw;
	}

	public void setPsw(String psw) {
		Psw = psw;
	}

	public String getUserIdentity() {
		return userIdentity;
	}

	public void setUserIdentity(String userIdentity) {
		this.userIdentity = userIdentity;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

}
