package com.studysystem.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class manageJournalAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ID;

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String managejournal() {
		jdbcDao dao = new jdbcDao();
		ResultSet rs = dao.select("journal_all", "", "");	
		JsonArray ja = new JsonArray();
	//	System.out.println(ID);
		
		try {
			int i = 0;
			while (rs.next()) {
				JsonObject jo = new JsonObject();
				jo.addProperty("dailyID" + i, rs.getString("dailyID"));
				jo.addProperty("userID" + i, rs.getString("userID"));
				jo.addProperty("dailyDate" + i, rs.getString("dailyDate"));
				jo.addProperty("dailyHead" + i, rs.getString("dailyHead"));
				jo.addProperty("daily" + i, rs.getString("daily"));

				ja.add(jo);
				i++;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.put("journal_list", ja.toString());
		
		System.out.println(ja.toString());

		return "success";
	}

}
