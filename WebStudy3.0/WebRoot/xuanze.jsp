<%@ page import="com.studysystem.dao.jdbcDao"%>
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
		String quest_number = null;  //题目总数
		String x_number = null;      //选择题数
		String t_number = null;      //填空题数
		String j_number = null;      //简答题数
		String k_number = null;      //开放题数
		String p_number = null;      //判断题数
		String q_number = null;      //其他 
		if(sess.get("current_name")!=null){
			name = sess.get("current_name").toString();
			id = dao.select_ID(name);
		}
		if(sess.get("quest_number")!=null){
        	quest_number = sess.get("quest_number").toString();
        }
        if(sess.get("x_number")!=null){
			x_number = sess.get("x_number").toString();
		}
		if(sess.get("t_number")!=null){
			t_number = sess.get("t_number").toString();
		}
		if(sess.get("j_number")!=null){
			j_number = sess.get("j_number").toString();
		}
		if(sess.get("k_number")!=null){
			k_number = sess.get("k_number").toString();
		}
		if(sess.get("p_number")!=null){
			p_number = sess.get("p_number").toString();
		}
		if(sess.get("q_number")!=null){
			q_number = sess.get("q_number").toString();
		}
		System.out.println("当前用户姓名："+name);		
		System.out.println("当前用户id："+id);	
		System.out.println("题目总数："+quest_number);	
		System.out.println("选择："+x_number);	
		System.out.println("填空："+t_number);	
		System.out.println("简答："+j_number);	
		System.out.println("开放："+k_number);	
		System.out.println("判断："+p_number);	
		System.out.println("其他："+q_number);	
			
	%>
<div class="top"></div>
<div id="header">
	<div class="logo">Web Study 教师界面</div>
	<div class="navigation">
		<ul>
		 	<li>尊敬的</li>
			<li><a href=""><%=name %>老师欢迎您！</a></li>
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
          <h4 class="M1"><span></span>我要出题</h4>
          <div class="list-item none">
            <a href="xuanze.jsp">选择题</a>
            <a href="tiankong.jsp">填空题</a>
            <a href="">简单题</a>
            <a href="">开发题</a>
            <a href="">判断题</a>
            <a href="">其他</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><span></span>我的题库</h4>
          <div class="list-item none">
            <a href=''>查看题目</a>
            <a href=''>修改题目</a>
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
								<li><a href="teacher.jsp">教师界面</a></li>
								<li>></li>
								<li><a href="teacher.jsp">欢迎您！</a></li>
						</ul>
			</div>

			<div class="main"><br><br>
				<div style="position:absolute;top:200px;left:700px;">
					 <ol>
                <li>
                    <div class="form-group chuti">
                        <label>
                        1.     <input type="text" placeholder="请输入题目..."></label><br><br>
                        <div class="radio">
                            A&nbsp;
                            <label><input type="text" placeholder="请输入A选项内容..."></label>
                        </div>
                        <br/>
                        <div class="radio">
                            B&nbsp;
                            <label><input type="text" placeholder="请输入B选项内容..."></label>
                        </div>
                        <br/>
                        <div class="radio">
                            C&nbsp;
                            <label><input type="text" placeholder="请输入C选项内容..."></label>
                        </div>
                        <br/>
                        <div class="radio">
                            D&nbsp;
                            <label><input type="text" placeholder="请输入D选项内容..."></label>
                        </div>
                    </div>
                    <div class="answer">
                        <br><label>请输入正确选项：<input type="text" placeholder="请输入正确选项..."></label>
                    </div>
                </li>
            </ol>
				</div>	
			</div>		
		</div>

		
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright © My Study System 2016</p></div>
<script>navList(12);</script>
</body>
</html>
