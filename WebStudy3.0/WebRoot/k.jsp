<%@ page import="com.studysystem.dao.jdbcDao"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="com.google.gson.JsonParser"%>
<%@ page language="java" import="java.util.*" import="com.opensymphony.xwork2.ActionContext" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student page</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>

<body>
	<%   
		ActionContext actionContext = ActionContext.getContext();
		Map sess = actionContext.getSession();
		String name=null;
		if(sess.get("current_name")!=null){
			name = sess.get("current_name").toString();
		}
		System.out.println("当前用户"+name);
	%>
<div class="top"></div>
<div id="header">
	<div class="logo">Web Study 学生界面</div>
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
          <h4 class="M1"><span></span>我爱答题</h4>
          <div class="list-item none">
            <a href="x.action">选择题</a>
            <a href="t.action">填空题</a>
            <a href="j.action">简答题</a>
            <a href="k.action">开放题</a>
            <a href="">判断题</a>
            <a href="">其他</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><span></span>我的日志</h4>
          <div class="list-item none">
            <a href=" ">查看日志</a>
            <a href=''>发表日志</a>
            <a href=''>备选按钮</a>        
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>评价留言</h4>
          <div class="list-item none">
            <a href="teacher.action">查看信息</a>
            <a href=''>备选按钮</a>
            <a href=''>备选按钮</a>
          </div>
        </li>
				<li>
          <h4 class="M4"><span></span>信息设置</h4>
          <div class="list-item none">
            <a href=''>修改信息</a>
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
								<li><a href="student.jsp">我爱答题</a></li>
								<li>></li>
								<li><a href="student.jsp">开放题</a></li>
						</ul>
			</div>

		<div class="main"><br><br>
		<form method="post" action="question.action?type=k">
			<input class="ppb" type="submit" value="提交" />
		  <%
				JsonParser parse = new JsonParser();
				JsonArray array = parse.parse(sess.get("kquestion_list").toString()).getAsJsonArray();
				
				for(int i = 0; i < array.size(); i++){		
					JsonObject jo = array.get(i).getAsJsonObject();
  
		   %>
			<p class="pph"><%=jo.get("queID").toString().replace("\"","") %>、
			 <%=jo.get("queType").toString().replace("\"","") %>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <%=jo.get("question").toString().replace("\"", "")%>
			 <p><br>
             <textarea name="key" rows="10" cols="70" style="margin:0 32%;font-size: 15px;" autofocus="autofocus"></textarea>  

			 <hr>
		<%
			}
		%>
		</form>
      </div>	
    </div>		
 </div>

<div class="bottom"></div>
<div id="footer"><p>Copyright © My Study System 2016</p></div>
<script>navList(12);</script>
</body>
</html>
