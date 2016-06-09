$(function($) {
	// 弹出登录
	$("#login").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.2'
		}, 1000);
	}).on('click', function() {
		$("body").append("<div id='mask'></div>");
		$("#mask").addClass("mask").fadeIn("slow");
		$("#LoginBox").fadeIn("slow");
	});
	
	$(document).mouseup(function(e){
		var _con = $("#LoginBox"); // 设置目标区域1
		if(!_con.is(e.target) && _con.has(e.target).length === 0){
			$("#LoginBox").fadeOut("fast");
			$("#mask").css({
				display : 'none'
			})
		}
	});
	
	$(document).mouseup(function(e){
		var _con = $("#RegisterBox"); // 设置目标区域2
		if(!_con.is(e.target) && _con.has(e.target).length === 0){
			$("#RegisterBox").fadeOut("fast");
			$("#mask").css({
				display : 'none'
			})
		}
	});
	
	// 弹出注册
	$("#register").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.2'
		}, 1000);
	}).on('click', function() {
		$("body").append("<div id='mask'></div>");
		$("#mask").addClass("mask").fadeIn("slow");
		$("#RegisterBox").fadeIn("slow");
		
	});
	// 登录按钮的透明度
	$("#loginbtn").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.8'
		}, 1000);
	});
	// 注册按钮的透明度
	$("#registerbtn").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.8'
		}, 1000);
	});
	// 文本框不允许为空---按钮触发
	$("#loginbtn").on('click', function() {
		var txtName = $("#txtName").val();
		var txtPwd = $("#txtPwd").val();
		if (txtName == "" || txtName == undefined || txtName == null) {
			if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
				$(".warning").css({
					display : 'block'
				});
			} else {
				$("#warn1").css({
					display : 'block'
				});
				$("#warn2").css({
					display : 'none'
				});
			}
		} else {
			if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
				$("#warn1").css({
					display : 'none'
				});
				$("#warn2").css({
					display : 'block'
				});
			} else {
				$(".warning").css({
					display : 'none'
				});
			}
		}
	});
	// 文本框不允许为空---按钮触发
	$("#registerbtn").on('click', function() {
		var txtName = $("#txtName").val();
		var txtPwd = $("#txtPwd").val();
		var rePwd = $("#rePwd").val();
		if (txtName == "" || txtName == undefined || txtName == null) {
			if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
				if (rePwd == "" || txtPwd == undefined || txtPwd == null) {
					$(".warning").css({
						display : 'block'
					});
				} else {
					$("#warn3").css({
						display : 'block'
					});
					$("#warn4").css({
						display : 'block'
					});
					$("#warn5").css({
						display : 'none'
					});
				}
			} else {
				$("#warn3").css({
					display : 'block'
				});
				$("#warn4").css({
					display : 'none'
				});
				$("#warn5").css({
					display : 'none'
				});
			}
		} else if (txtPwd == rePwd) {
			$(".warning").css({
				display : 'none'
			});
		}
	});
	// 文本框不允许为空---单个文本触发
	$("#txtName").on('blur', function() {
		var txtName = $("#txtName").val();
		if (txtName == "" || txtName == undefined || txtName == null) {
			$("#warn").css({
				display : 'block'
			});
		} else {
			$("#warn").css({
				display : 'none'
			});
		}
	});
	$("#txtName").on('focus', function() {
		$("#warn").css({
			display : 'none'
		});
	});
	//
	$("#txtPwd").on('blur', function() {
		var txtName = $("#txtPwd").val();
		if (txtName == "" || txtName == undefined || txtName == null) {
			$("#warn2").css({
				display : 'block'
			});
		} else {
			$("#warn2").css({
				display : 'none'
			});
		}
	});
	$("#txtPwd").on('focus', function() {
		$("#warn2").css({
			display : 'none'
		});
	});
	// 登录关闭
	$(".close_btn").hover(function() {
		$(this).css({
			color : 'black'
		})
	}, function() {
		$(this).css({
			color : '#999'
		})
	}).on('click', function() {
		$("#LoginBox").fadeOut("fast");
		$("#mask").css({
			display : 'none'
		});
	});

	// 注册关闭
	$(".close_btn").hover(function() {
		$(this).css({
			color : 'black'
		})
	}, function() {
		$(this).css({
			color : '#999'
		})
	}).on('click', function() {
		$("#RegisterBox").fadeOut("fast");
		$("#mask").css({
			display : 'none'
		});
	});
});
