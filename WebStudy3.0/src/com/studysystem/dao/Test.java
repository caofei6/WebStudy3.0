package com.studysystem.dao;


import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import com.studysystem.action.updateUserAction;


public class Test {

	public static void main(String[] args) throws SQLException {
		jdbcDao dao = new jdbcDao();
		String str = null;
		str = dao.select_name("caofei", "user");
		System.out.println(str);
	
		

	}

}
