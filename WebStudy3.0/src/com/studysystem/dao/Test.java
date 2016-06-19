package com.studysystem.dao;


import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import com.studysystem.action.updateUserAction;


public class Test {

	public static void main(String[] args) throws SQLException {
		jdbcDao dao = new jdbcDao();
        String type = "t";
		ResultSet res;
		String realkey = null;
		System.out.println("question type:" + type);
		if(type.equals("t")){
			res = dao.select("question", "ÃÓø’Ã‚", "");
			while(res.next()){
				realkey = res.getString(1);
				System.out.println(realkey);
			}
		}
	}

}
