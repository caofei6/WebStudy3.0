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
	public String getIdentity() {    //identity�պ��Ǳ���
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	
	public String login(){
		jdbcDao dao = new jdbcDao();
		String name = null;       
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		
		if(identity.equals("user") && dao.Login(identity, ID, psw)){    //������û���ƥ��     identity=table_name
			
			name = dao.select_name(ID, identity);
			session.put("current_name", name);
			
			if(dao.select_identity(ID).equals("ѧ��")){
				System.out.println("ѧ��: " + name + "�˺�, ����ƥ����ȷ, �ɹ���¼");	
				return "student_success";
			}else if(dao.select_identity(ID).equals("��ʦ")){
				System.out.println("��ʦ�� " + name + "�˺�, ����ƥ����ȷ���ɹ���¼");
				return "teacher_success";
			}
			
		}else if(identity.equals("admin") && dao.Login(identity, ID, psw)){
			name = dao.select_name(ID, identity);
			session.put("current_name", name);
			System.out.println("����Ա�� " + name + "�˺�, ����ƥ����ȷ���ɹ���¼");
			return "admin_success";		
		}
		return "login_fail";
		
	}
}
	
		

