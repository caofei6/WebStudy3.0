<%@page import="com.studysystem.model.journal"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.studysystem.model.userModel"%>
<%@ page language="java" import="java.util.*"
	import="com.opensymphony.xwork2.ActionContext" pageEncoding="utf-8"%>
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
		List<journal> list = new LinkedList<journal>(); 
		    
			ActionContext actionContext1 = ActionContext.getContext();
			Map sess = actionContext1.getSession();
			String name=null;
			if(sess.get("current_name")!=null){
		name = sess.get("current_name").toString();
			}
			System.out.println("当前用户"+name);
	%>
	<div class="top"></div>
	<div id="header">
		<div class="logo">Web Study 后台管理系统</div>
		<div class="navigation">
			<ul>
				<li>欢迎您！</li>
				<li><a href=""><%=name%></a></li>
				<li><a href="update_password.jsp">修改密码</a></li>
				<li><a href="settings.jsp">设置</a></li>
				<li><a href="index.jsp">退出</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<br> <br>
		<div class="left_menu">
			<ul id="nav_dot">
				<li>
					<h4 class="M1">
						<span></span>系统信息
					</h4>
					<div class="list-item none">
						<a href="admin.jsp">学生人数</a> <a href="admin.jsp">教师人数</a> <a
							href="admin_journal.jsp">日志内容</a>
					</div></li>
				<li>
					<h4 class="M2">
						<span></span>学生管理
					</h4>
					<div class="list-item none">
						<a href="student.action">查看信息</a> <a href=''>备选按钮</a> <a href=''>备选按钮</a>
					</div></li>
				<li>
					<h4 class="M3">
						<span></span>教师管理
					</h4>
					<div class="list-item none">
						<a href="teacher.action">查看信息</a> <a href=''>备选按钮</a> <a href=''>备选按钮</a>
					</div></li>
				<li>
					<h4 class="M4">
						<span></span>评论管理
					</h4>
					<div class="list-item none">
						<a href=''>备选按钮</a> <a href=''>备选按钮</a> <a href=''>备选按钮</a>
					</div></li>
				<li>
					<h4 class="M8">
						<span></span>字典维护
					</h4>
					<div class="list-item none">
						<a href=''>字典维护1</a> <a href=''>字典维护2</a> <a href=''>字典维护3</a> <a
							href=''>字典维护4</a> <a href=''>字典维护5</a> <a href=''>字典维护6</a> <a
							href=''>字典维护7</a> <a href=''>字典维护8</a> <a href=''>字典维护9</a> <a
							href=''>字典维护4</a> <a href=''>字典维护5</a> <a href=''>字典维护6</a> <a
							href=''>字典维护7</a> <a href=''>字典维护8</a> <a href=''>字典维护9</a>
					</div></li>
				<li>
					<h4 class="M10">
						<span></span>系统管理
					</h4>
					<div class="list-item none">
						<a href=''>我的信息</a> <a href=''>备选按钮</a> <a href=''>备选按钮</a>
					</div></li>
			</ul>
		</div>

		<div class="m-right">
			<div class="right-nav">
				<ul>
					<li><a herf="admin.jsp"><img src="images/home.png">
					</a>
					</li>
					<li style="margin-left:25px;">您当前的位置：</li>
					<li><a href="admin.jsp">教师管理</a>
					</li>
					<li>></li>
					<li><a href="admin_student.jsp">查看信息</a>
					</li>
				</ul>
			</div>
			<div class="main">
				<div style="position:absolute;top:200px;left:700px;">
					<table style="text-align:center" border="3" bordercolor="#555555" width="800" cellpadding="0" cellpadding="0">
						<tr>
							<th width="10%" bgcolor="#CCFFFF">用户名</th>
							<th width="10%" bgcolor="#CCFFFF">身份</th>
							<th width="10%" bgcolor="#CCFFFF">姓名</th>
							<th width="10%" bgcolor="#CCFFFF">性别</th>
							<th width="20%" bgcolor="#CCFFFF">电话</th>
							<th width="30%" bgcolor="#CCFFFF">EMail</th>
							<th width="10%" bgcolor="#CCFFFF">操作</th>
						</tr>
						<%
							JsonParser parse = new JsonParser();
								            JsonArray array = parse.parse(sess.get("teacher_list").toString()).getAsJsonArray();
								
								            for(int i = 0; i < array.size(); i++){		
									            JsonObject jo = array.get(i).getAsJsonObject();
						%>
						<tr>
							<td bgcolor="#FFFFCC"><%=jo.get("userID" + i).toString().replace("\"","")%></td>
							<td bgcolor="#FFFFCC"><%=jo.get("userIdentity" + i).toString().replace("\"","")%></td>
							<td bgcolor="#FFFFCC"><%=jo.get("userName" + i).toString().replace("\"","")%></td>
							<td bgcolor="#FFFFCC"><%=jo.get("userSex" + i).toString().replace("\"","")%></td>
							<td bgcolor="#FFFFCC"><%=jo.get("userTel" + i).toString().replace("\"","")%></td>
							<td bgcolor="#FFFFCC"><%=jo.get("userMail" + i).toString().replace("\"","")%></td>
							<td bgcolor="#CCFFCC">
								<form id="form" method="post" action="delete_teacher?id=<%=jo.get("userID" + i).toString().replace("\"","")%>">
									<input type="submit" value="删除">
								</form></td>
						</tr>
						<%
						}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom"></div>
	<div id="footer">
		<p>Copyright © My Study System 2016</p>
	</div>
	<script>
		navList(12);
	</script>
</body>
</html>
