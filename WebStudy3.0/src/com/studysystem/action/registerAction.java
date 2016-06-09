package com.studysystem.action;

import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class registerAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ID;
	private String psw;
	private String rePwd;
	private String identity;

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

	public String getRePwd() {
		return rePwd;
	}

	public void setRePwd(String rePwd) {
		this.rePwd = rePwd;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String register() {
		jdbcDao dao = new jdbcDao();
		System.out.println("ID:" + ID + "\npsw:" + psw + "\nrePwd:" + rePwd
				+ "\nidentity:" + identity);
		System.out.println("数据库连接成功");
		if (psw.equals(rePwd)) {
			if (dao.ID_repetition(ID) && dao.Register(ID, psw, identity)) {
				System.out.println("新用户:" + ID + "的信息已经加入了数据库！");
			}
			return "register_success";
		} else
			return "register_fail";
	}

}
