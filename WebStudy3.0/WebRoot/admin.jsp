<%@page import="com.studysystem.dao.jdbcDao"%>
<%@ page language="java" import="java.util.*" import="com.opensymphony.xwork2.ActionContext" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin page</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>

<body>
	<%
	    jdbcDao dao = new jdbcDao();
		ActionContext actionContext = ActionContext.getContext();
		Map sess = actionContext.getSession();
		String name = null; 
		String id = null;
		String user_number = null;
		String students_number = null;
		String teachers_number = null;  
		if(sess.get("current_name")!=null){
			name = sess.get("current_name").toString();
			id = dao.select_ID(name);
		}
		if(sess.get("user_number")!=null){
			user_number = sess.get("user_number").toString();
		}
		if(sess.get("students_number")!=null){
			students_number = sess.get("students_number").toString();
		}
		if(sess.get("teachers_number")!=null){
			teachers_number = sess.get("teachers_number").toString();
		}
		System.out.println("当前用户姓名："+name);		
		System.out.println("当前用户id："+id);	
		System.out.println("用户总数："+user_number);	
		System.out.println("学生总数："+students_number);	
		System.out.println("老师总数："+teachers_number);	
			
	%>
<div class="top"></div>
<div id="header">
	<div class="logo">Web Study 后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href=""><%=name %></a></li>
			<li><a href="update_password.jsp">修改密码</a></li>
			<li><a href="settings.jsp">设置</a></li>
			<li><a href="index.jsp">退出</a></li>
		</ul>
	</div>
</div>
<div id="content"><br><br>
	<div class="left_menu">
	  <ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>系统信息</h4>
          <div class="list-item none">
            <a href="admin.jsp">学生人数</a>
            <a href="admin.jsp">教师人数</a>
            <a href="journal.action?ID=<%=id%>">日志内容</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><span></span>学生管理</h4>
          <div class="list-item none">
            <a href="student.action">查看信息</a>
            <a href=''>备选按钮</a>
            <a href=''>备选按钮</a>        
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>教师管理</h4>
          <div class="list-item none">
            <a href="teacher.action">查看信息</a>
            <a href=''>备选按钮</a>
            <a href=''>备选按钮</a>
          </div>
        </li>
				<li>
          <h4 class="M4"><span></span>评论管理</h4>
          <div class="list-item none">
            <a href=''>备选按钮</a>
            <a href=''>备选按钮</a>
            <a href=''>备选按钮</a>
          </div>
        </li>
				<li>
          <h4 class="M8"><span></span>字典维护</h4>
          <div class="list-item none">
            <a href=''>字典维护1</a>
            <a href=''>字典维护2</a>
            <a href=''>字典维护3</a>
			<a href=''>字典维护4</a>
            <a href=''>字典维护5</a>
            <a href=''>字典维护6</a>
			<a href=''>字典维护7</a>
            <a href=''>字典维护8</a>
            <a href=''>字典维护9</a>
			<a href=''>字典维护4</a>
            <a href=''>字典维护5</a>
            <a href=''>字典维护6</a>
			<a href=''>字典维护7</a>
            <a href=''>字典维护8</a>
            <a href=''>字典维护9</a>
          </div>
        </li>
				<li>
          <h4 class="M10"><span></span>系统管理</h4>
          <div class="list-item none">
            <a href=''>我的信息</a>
            <a href=''>备选按钮</a>
            <a href=''>备选按钮</a>
          </div>
        </li>
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><a herf="admin.jsp"><img src="images/home.png"></a></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="admin.jsp">系统信息</a></li>
								<li>></li>
								<li><a href="admin.jsp">最新信息</a></li>
						</ul>
			</div>
			<center>
			<div class="main"><br><br>
				<h1>用户数目统计表格：</h1>
				<br><br>
				<table border="3" bordercolor="#555555" width="600" height="200" cellpadding="0" cellpadding="0">
					<tr>
						<td class="td1" bgcolor="#FFCCCC" width=40%>用户总数</td>
						<td class="td1" bgcolor="#CCFFFF"><%=user_number %></td>
					</tr>
					<tr>
						<td class="td1" bgcolor="#CCFFCC">学生人数</td>
						<td class="td1" bgcolor="#FFFFCC"><%=students_number %></td>
					</tr>
					<tr>
						<td class="td1" bgcolor="#CCFFCC">教师人数</td>
						<td class="td1" bgcolor="#FFFFCC"><%=teachers_number %></td>
					</tr>
				</table>
			</div>		
		</div>
		</center>
		
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright © My Study System 2016</p></div>
<script>navList(12);</script>
</body>
</html>
