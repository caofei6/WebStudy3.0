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
		System.out.println("????????dailyID?:" + id);
		jdbcDao dao = new jdbcDao();
		dao.delate(id, "journal", "");
		System.out.println("??????");
		return "success";

	}
}
