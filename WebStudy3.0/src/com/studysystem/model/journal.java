package com.studysystem.model;

import javax.xml.crypto.Data;

public class journal {

	private String dailyID;
	private String userID;
	private String dailyDate;
	private String dailyHead;
	private String daily;

	public journal(String dailyID, String userID, String dailyDate,
			String dailyHead, String daily) {
		super();
		this.dailyID = dailyID;
		this.userID = userID;
		this.dailyDate = dailyDate;
		this.dailyHead = dailyHead;
		this.daily = daily;
	}

	public journal() {
		super();

	}

	public String getDailyID() {
		return dailyID;
	}

	public void setDailyID(String dailyID) {
		this.dailyID = dailyID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getDailyDate() {
		return dailyDate;
	}

	public void setDailyDate(String dailyDate) {
		this.dailyDate = dailyDate;
	}

	public String getDailyHead() {
		return dailyHead;
	}

	public void setDailyHead(String dailyHead) {
		this.dailyHead = dailyHead;
	}

	public String getDaily() {
		return daily;
	}

	public void setDaily(String daily) {
		this.daily = daily;
	}
}
