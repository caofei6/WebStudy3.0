package com.studysystem.action;

import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class deleteJournalAction extends ActionSupport {

	private static final long serialVersionUID = 2671426818972719698L;
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String delatejournal() {
		System.out.println("传过来的dailyID值:" + id);
		jdbcDao dao = new jdbcDao();
		dao.delate(id, "journal", "");
		System.out.println("删除成功");
		return "success";

	}
}
