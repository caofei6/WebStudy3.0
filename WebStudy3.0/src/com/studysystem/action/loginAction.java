package com.studysystem.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studysystem.dao.jdbcDao;

public class loginAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3659349196019503378L;
	private String ID;
	private String psw;
	private String identity;

	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public String getIdentity() {    //identity刚好是表名
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	
	public String login(){
		jdbcDao dao = new jdbcDao();
		String name = "无名小卒";
		String user_number = "0";
		String students_number = "0";
		String teachers_number = "0";
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		
		if(identity.equals("user") && dao.Login(identity, ID, psw)){    //密码和用户名匹配     identity=table_name
			
			name = dao.select_name(ID, identity);
			session.put("current_name", name);
			
			if(dao.select_identity(ID).equals("学生")){
				System.out.println("学生: " + name + "账号, 密码匹配正确, 成功登录");	
				return "student_success";
			}else if(dao.select_identity(ID).equals("教师")){
				System.out.println("教师： " + name + "账号, 密码匹配正确，成功登录");
				return "teacher_success";
			}
			
		}else if(identity.equals("admin") && dao.Login(identity, ID, psw)){
			name = dao.select_name(ID, identity);
			user_number = dao.countpeople("");
			students_number = dao.countpeople("学生");
			teachers_number = dao.countpeople("教师");
			session.put("current_name", name);
			session.put("user_number", user_number);
			session.put("students_number", students_number);
			session.put("teachers_number", teachers_number);	
			System.out.println("管理员： " + name + ", 成功登录");
			return "admin_success";		
		}
		return "login_fail";
		
	}
}
	
		

