package com.studysystem.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class questionAction extends ActionSupport {
	private String type;
	private String key;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
	public String question() throws SQLException{
		jdbcDao dao = new jdbcDao();
		ResultSet res;
		String realkey = null;
		System.out.println("question type:" + type);
		if(type.equals("t")){
			System.out.println("所答题目为填空题");
			res = dao.select("question", "填空题", "");
			while(res.next()){
				realkey = res.getString(1);
				System.out.println(realkey);
			}
			System.out.println(key);
			String[] str = key.split(",");
		
			System.out.println(str[0]);
			System.out.println(str[1]);
			System.out.println(str[2]);
		}
		
		
		
		return null;
	}

}
