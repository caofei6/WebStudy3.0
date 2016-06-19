<%@page import="com.studysystem.model.journal"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.studysystem.model.userModel"%>
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
<div id="content"><br><br>
	<div class="left_menu">
	  <ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>系统信息</h4>
          <div class="list-item none">
            <a href="admin.jsp">学生人数</a>
            <a href="admin.jsp">教师人数</a>
            <a href="admin_journal.jsp">日志内容</a>
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
								<li><a href="admin_journal.jsp">日志内容</a></li>
						</ul>
			</div>
		<div class="main"><br><br>
		  <%
				JsonParser parse = new JsonParser();
				JsonArray array = parse.parse(sess.get("journal_list").toString()).getAsJsonArray();
				
				for(int i = 0; i < array.size(); i++){		
					JsonObject jo = array.get(i).getAsJsonObject();
					System.out.println(jo.toString());
  
		   %>
			<p class="pph"><%=jo.get("dailyID" + i).toString().replace("\"","") %>:&nbsp;&nbsp;&nbsp;&nbsp;
			 <%=jo.get("dailyHead" + i).toString().replace("\"","") %> 
             <span><%=jo.get("dailyDate" + i).toString().replace("\"", "")  %></span><p>
             <textarea rows="10" cols="100" style="margin:0 22%;font-size: 15px;" autofocus="autofocus" readonly><%=jo.get("daily" + i).toString().replace("\\n","\n").replace("\\r", "\r").replace("\"", "  ") %></textarea>  
             <form method="post" action="delete_journal.action?id=<%=jo.get("dailyID" + i).toString().replace("\"","")%>">
				<input class="ppb" type="submit" value="删除" />
			 </form>
			 <hr>
		<%
			}
		%>

      </div>	
      </div>
		
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright © My Study System 2016</p></div>
<script>navList(12);</script>
</body>
</html>
