package com.studysystem.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class manageTeacherAction extends ActionSupport {

		public String manageteacher() {
			jdbcDao dao = new jdbcDao();
			ResultSet rs = dao.select("user", "ΩÃ ¶", "");
			JsonArray ja = new JsonArray();
			try {
				int i = 0;
				while (rs.next()) {
					JsonObject jo = new JsonObject();
					jo.addProperty("userID" + i, rs.getString("userID"));
					jo.addProperty("userIdentity" + i, rs.getString("userIdentity"));
					jo.addProperty("userName" + i, rs.getString("userName"));
					jo.addProperty("userSex" + i, rs.getString("userSex"));
					jo.addProperty("userTel" + i, rs.getString("userTel"));
					jo.addProperty("userMail" + i, rs.getString("userMail"));

					ja.add(jo);
					i++;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			ActionContext actionContext = ActionContext.getContext();
			Map<String, Object> session = actionContext.getSession();
			session.put("teacher_list", ja.toString());
			
			System.out.println(ja.toString());

			return "success";
		}

}

