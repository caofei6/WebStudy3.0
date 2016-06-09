package com.studysystem.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class updateUserAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1475867382316759300L;
	private String ID;
	private String psw;
	private String identity;
	private String sex;
	private String tel;
	private String mail;

	public updateUserAction(String iD, String psw, String identity, String sex, String tel, String mail) {
		super();
		ID = iD;
		this.psw = psw;
		this.identity = identity;
		this.sex = sex;
		this.tel = tel;
		this.mail = mail;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getidentity() {
		return identity;
	}

	public void setidentity(String identity) {
		this.identity = identity;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public String updateUser() throws SQLException{
		jdbcDao dao = new jdbcDao();
		ResultSet res = dao.update_user(ID, psw, identity, sex, tel, mail);
		while(res.next()){
			System.out.println("--------" + ID + "的信息已经更新---------");
			for(int i = 1; i < 7; i++){
				System.out.println(res.getString(i));
			}
			System.out.println("---------------------------------------");
		}
		return "updateUser_success";
	}

}
