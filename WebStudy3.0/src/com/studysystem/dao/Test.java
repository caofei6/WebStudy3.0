package com.studysystem.dao;


import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import com.studysystem.action.updateUserAction;


public class Test {

	public static void main(String[] args) throws SQLException {
		jdbcDao dao = new jdbcDao();
		String str = null;
		String ID = null;
		ResultSet rs = dao.select("journal_all", "", "");
		while(rs.next()){
			for(int i = 1; i < 6; i++){
				System.out.println(rs.getString(i));
			}
		}

	}

}
