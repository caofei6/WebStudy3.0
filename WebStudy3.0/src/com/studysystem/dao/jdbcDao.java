package com.studysystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class jdbcDao {

	private String driverName = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:8002/web_study?useUnicode=true&characterEncoding=utf-8";
	private Connection con = null;
	private String user = "root";
	private String password = "1234";
	
	public Connection get_Connection(){
		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, password);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
		System.out.println("数据库连接成功！");
		return con;
	}
	
	public void Close(){
		if(con != null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
				System.out.println("数据库关闭失败！");
			}
			con = null;
		}
	}
	
	public boolean Login(String table_name, String ID, String password){
		con = get_Connection();
		PreparedStatement pre = null;
		try{
			if(table_name.equals("user")){
				pre = con.prepareStatement("select userID from user where userID = ? and userPsw = ?");
			}else if(table_name.equals("admin")){
				pre = con.prepareStatement("select adminID from admin where adminID = ? and adminPsw = ?");
			}else{
				System.out.println("查询异常！");
			}
			pre.setString(1, ID);
			pre.setString(2, password);
			String str = null;
			ResultSet res = pre.executeQuery();
			while(res.next()){
				str = res.getString(1);
			}
			if(str == null){
				System.out.println("该用户不存在!");
				return false;
			}
			Close();
			pre.close();
			res.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return true;
	}	
	
	public boolean ID_repetition(String ID){    //查询用户是否存在
		con = get_Connection();
		PreparedStatement pre = null;
		try{
			pre = con.prepareStatement("select userID from user where userID = ?");
			pre.setString(1, ID);
			String str = null;
			ResultSet rs = pre.executeQuery();
			while(rs.next()){
				str = rs.getString(1);
			}
			if(str != null){
				System.out.println("该用户名:" + str + " 已被占用,请更换用户名！");
				return false;
			}else{
				System.out.println("该用户名:" + ID + " 可以使用");
			}
			Close();
			pre.close();
		}catch(SQLException e){
			e.printStackTrace();	
		}
		return true;
	}
	
	public String select_identity(String ID){            //查询登录用户身份
		con = get_Connection();
		PreparedStatement pre = null;
		try{
			pre = con.prepareStatement("select userIdentity from user where userID = ?");
			pre.setString(1, ID);
			ResultSet res = pre.executeQuery();
			String str = null;
			while(res.next()){
				str = res.getString(1);
			}
			return str;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;	
	}
	
	public String select_name(String ID, String table_name){            //查询登录者姓名
		con = get_Connection();
		PreparedStatement pre = null;
		String str = null;
		try{
			if(table_name.equals("user")){
				pre = con.prepareStatement("select userName from user where userID = ?");
				pre.setString(1, ID);
				ResultSet res = pre.executeQuery();
				while(res.next()){
					str = res.getString(1);
				}
				return str;
			}else if(table_name.equals("admin")){
				pre = con.prepareStatement("select userName from user where userID = ?");
				pre.setString(1, ID);
				ResultSet res = pre.executeQuery();
				while(res.next()){
					str = res.getString(1);
				}
				return str;	
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;	
	}
	
	public boolean Register(String ID, String password, String identity){
		con = get_Connection();
		PreparedStatement pre = null;
		try {
			pre = con.prepareStatement("insert into user(userID, userPsw, userIdentity)values(?, ?, ?)");
			pre.setString(1, ID);
			pre.setString(2, password);
			pre.setString(3, identity);
			pre.executeUpdate();
			pre.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(identity + ":" + ID + "的信息已经插入用户表");
		return true;
	}
	
	public ResultSet update_user(String ID, String psw, String identity, String sex, String tel, String mail){
		con = get_Connection();
		PreparedStatement pre = null;
		try{
			pre = con.prepareStatement("update user set userPsw = ?, userIdentity = ?, userSex = ?, userTel = ?, userMail = ? where userID = ?");
			pre.setString(1, psw);
			pre.setString(2, identity);
			pre.setString(3, sex);
			pre.setString(4, tel);
			pre.setString(5, mail);
			pre.setString(6, ID);
			
			pre.executeUpdate();
			pre.close();
			
			pre = con.prepareStatement("select * from user where userID = ?");
			pre.setString(1, ID);
			
			ResultSet rs = pre.executeQuery();
			return rs;
			}catch(SQLException e){
				e.printStackTrace();
		}
		return null;	
	}
	public ResultSet select(String table, String ID1, String ID2){
		con = get_Connection();
		PreparedStatement pre = null;
		ResultSet rs;
		try{
			if(table.equals("user")){
				pre = con.prepareStatement("select * from user where userID = ?");
				pre.setString(1, ID1);
				rs = pre.executeQuery();
				return rs;
			}else if(table.equals("admin")){
				pre = con.prepareStatement("select * from admin where adminID = ?");
				pre.setString(1, ID1);
				rs = pre.executeQuery();
				return rs;
			}else if(table.equals("comment")){
				pre = con.prepareStatement("select * from comment where journalID = ? and userID = ?");
				pre.setString(1, ID1);
				pre.setString(2, ID2);
				rs = pre.executeQuery();
				return rs;
			}else if(table.equals("course_user")){
				pre = con.prepareStatement("select * from course_user where courseID = ? and userID = ?");
				pre.setString(1, ID1);
				pre.setString(2, ID2);
				rs = pre.executeQuery();
				return rs;
			}else if(table.equals("journal")){
				pre = con.prepareStatement("select * from journal where dailyID = ? and userID = ?");
				pre.setString(1, ID1);
				pre.setString(2, ID2);
				rs = pre.executeQuery();
				return rs;
			}else if(table.equals("question")){
				pre = con.prepareStatement("select * from question where quelID = ?");
				pre.setString(1, ID1);
				rs = pre.executeQuery();
				return rs;
			}else if(table.equals("score")){
				pre = con.prepareStatement("select * from score where questionID = ? and userID = ?");
				pre.setString(1, ID1);
				pre.setString(2, ID2);
				rs = pre.executeQuery();
				return rs;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	
}
