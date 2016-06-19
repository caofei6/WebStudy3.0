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
		System.out.println("传过来的userID值:" + id);
		jdbcDao dao = new jdbcDao();
		dao.delate(id, "user", "学生");
		System.out.println("删除成功");
		return "success";

	}

}
