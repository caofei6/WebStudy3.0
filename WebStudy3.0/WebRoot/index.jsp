<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/grayscale.css" rel="stylesheet">
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

</head>



<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-main-collapse">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top"> <i
				class="fa fa-play-circle"></i> <span class="light">Study</span>
				System </a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div
			class="collapse navbar-collapse navbar-right navbar-main-collapse">
			<ul class="nav navbar-nav">
				<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
				<li class="hidden"><a href="#page-top"></a></li>
				<li ><a href="#" id="login" class="tdmyy" style="color:#fff">登录</a>
				</li>
				<li><a href="#" id="register" class="tdmyy">注册</a>
				</li>
				<li><a href="#contact" class="tdmyy">联系</a>
				</li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- 登录浮动层 -->
	<div id="LoginBox">
	<form id="login" action="login" method="post" >
		<div class="row1">
			欢迎登录<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">×</a>
		</div>
		<div class="row" style="color:black;">
			用户名： <span class="inputBox"> <input type="text" name="ID" id="txtName"
				placeholder="账号" /> </span> <a href="javascript:void(0)" title="提示"
				class="warning" id="warn">*</a>
		</div>
		<div class="row" style="color:black;">
			密&nbsp;&nbsp;&nbsp;&nbsp;码： <span class="inputBox"> <input
				type="password" name="psw" id="txtPwd" placeholder="密码" /> </span> <a
				href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
		</div>
		<div class="row2" style="padding-left:100px;color:black;">
		    <input type="radio" name="identity" value="user" checked="checked" /> 
			<span>用户</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="identity" value="admin" /> 
			<span>管理员</span>
		</div>
		<div>
			<input id="loginbtn" type="submit" value="登    录"/>
		</div>
	</form>
	</div>


	<!-- 注册浮动层 -->
	<div id="RegisterBox">
	<form id="register" action="register" method="post" >
		<div class="row1">
			注册新用户<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">×</a>
		</div>
		<div class="row" style="color:black;">
			&nbsp;用&nbsp;户&nbsp;名&nbsp;： <span class="inputBox"> <input
				type="text" name="ID" id="txtName" placeholder="账号" /> </span> <a
				href="javascript:void(0)" title="提示" class="warning" id="warn3">*</a>
		</div>
		<div class="row" style="color:black;">
			设置密码： <span class="inputBox"> <input type="password" name="psw" id="txtPwd"
				placeholder="密码" /> </span> <a href="javascript:void(0)" title="提示"
				class="warning" id="warn4">*</a>
		</div>
		<div class="row" style="color:black;">
			确认密码： <span class="inputBox"> <input type="password" name="rePwd" id="rePwd"
				placeholder="确认密码" /> </span> <a href="javascript:void(0)" title="提示"
				class="warning" id="warn5">*</a>
		</div>
		<div class="row2" style="padding-left:100px;color:black;">
		    <input type="radio" name="identity" value="学生" checked="checked" /> 
			<span>学生</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="identity" value="教师" /> 
			<span>老师</span>
		</div>
		<div>
			<input id="registerbtn" type="submit" value="注      册"/>
		</div>
	</form>
	</div>



	<!-- Intro Header -->
	<header class="intro">
	<div class="intro-body">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1 class="brand-heading">Welcome Home</h1>
					<p class="intro-text">
						Work Hard <br> you make some progress.
					</p>
					<a href="#about" class="btn btn-circle page-scroll"> 
					<i class="fa fa-angle-double-down animated"></i> </a>
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- About Section -->
	<section id="about" class="container content-section text-center">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
			<h2>About System</h2>
			<p>
				网站为广大用户提供在线学习内容，学生可以进行网页内容阅读和答题，教师可以对学习网页内容进行编辑、修改。管理员用户可以统计学生用户的人数，教师用户的人数和课程数目。该系统还提供日志等功能 
			</p>
		</div>
	</div>
	</section>

	<!-- Download Section -->
	<section id="download" class="content-section text-center">
	<div class="download-section">
		<div class="container">
			<div class="col-lg-8 col-lg-offset-2">
				<h2>永远相信，美好的事情将要发生！</h2>
				<p></p>
				<a href="#page-top"
					class="btn btn-default btn-lg">JION US</a>
			</div>
		</div>
	</div>
	</section>

	<!-- Contact Section -->
	<section id="contact" class="container content-section text-center">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
			<h2>Contact To Me</h2>
			<p>你对网站有什么意见或者建议都可以联系我！</p>
			<p>
				<a href="mailto:caofei666@outlook.com">caofei666@outlook.com</a>
			</p>
			<ul class="list-inline banner-social-buttons">
				<li><a href="https://twitter.com/SBootstrap"
					class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i>
						<span class="network-name">Twitter</span> </a></li>
				<li><a href="https://github.com/caofei6/WebStudy"
					class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i>
						<span class="network-name">Github</span> </a></li>
				<li><a href="https://plus.google.com/+Startbootstrap/posts"
					class="btn btn-default btn-lg"><i
						class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span>
				</a></li>
			</ul>
		</div>
	</div>
	</section>
	
	<footer>
	<div class="container text-center">
		<p>Copyright &copy; My Study System 2016</p>
	</div>
	</footer>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="js/jquery.easing.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/grayscale.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/myjquery.js"></script>
</body>

</html>
