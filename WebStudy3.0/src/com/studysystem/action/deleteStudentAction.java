package com.studysystem.action;

import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class deleteStudentAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String deletestudent() {
		System.out.println("��������userIDֵ:" + id);
		jdbcDao dao = new jdbcDao();
		dao.delate(id, "user", "ѧ��");
		System.out.println("ɾ���ɹ�");
		return "success";

	}

}
