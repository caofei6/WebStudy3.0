package com.studysystem.action;

import java.sql.ResultSet;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class kQuestAction extends ActionSupport{
	public String k(){
		jdbcDao dao = new jdbcDao();
		ResultSet rs = dao.select_question("¿ª·ÅÌâ");
		JsonArray ja = new JsonArray();
		try{
			int i = 0;
			while(rs.next()){
				JsonObject jo = new JsonObject();
				jo.addProperty("queID", rs.getString("queID"));
				jo.addProperty("queType", rs.getString("queType"));
				jo.addProperty("question", rs.getString("question"));
				jo.addProperty("queKey", rs.getString("queKey"));
	     
				ja.add(jo);
				i++;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.put("kquestion_list", ja.toString());
		
		System.out.println(ja.toString());
		return "success";
		
	}

}
