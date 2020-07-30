<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>登录/注册</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<br>
	<div class="content">
		<div class="form sign-in">
			<form action="user" method="post">
				<span style="color:red; text-align:center;">${mess} </span>
				<h2>欢迎回来</h2>
				<label> <span>账号：</span> <input type="text" id="username"
					name="username" />
				</label> <label> <span>密码：</span> <input type="password"
					id="password" name="password" />
				</label> <input type="hidden" name="action" value="login">
				<button type="submit" class="submit">登 录</button>
			</form>
		</div>


		<div class="sub-cont">
			<div class="img">
				<div class="img__text m--up">
					<h2>还未注册？</h2>
					<p>立即注册，发现大量机会！</p>
				</div>
				<div class="img__text m--in">
					<h2>已有帐号？</h2>
					<p>有帐号就登录吧，好久不见了！</p>
				</div>
				<div class="img__btn">
					<span class="m--up">注 册</span> <span class="m--in">登 录</span>
				</div>
			</div>


			    <%
					String mess = (String)request.getAttribute("mess");
				%>
			<div class="form sign-up">
				<form action="user" method="post">
					<!-- <font style="color: red;"></font> -->
					<h2>立即注册</h2>
					<label> <span>账号:</span> <input type="text" id="username1"
						name="username1" />  <span id="mess" style="color:red;"></span>
					</label> <label> <span>密码：</span> <input type="password" id="password1"
						name="password1" /> 
					</label> <label> <span>确认密码：</span> <input type="password" id="password2"
						name="password2" />  <span id="mess1" style="color:red;"></span>
					</label> 
					<input type="hidden" name="action" value="register">
					<button type="submit" class="submit">注册 </button>
				</form>
			
			</div>

		</div>

	</div>
</body>
<script src="js/script.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#username1").blur(function(){
			
			$.ajax({
				url:"user",
				type:"post",
				data:{"username1":$(this).val(),"action":"check"},
				dataType:"text",
				success:function(result){
					if(result=='1'){
						$("#mess").html("账号可用");
					}else{
						$("#mess").html("账号已被注册");
					}
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
			
		})
		
		$("#password2").blur(function(){
			
			
			if($(password1).val()!=$(password2).val()){
				$("#mess1").html("密码不一致，请重新输入密码！");
			}else{
				$("#mess1").html("密码一致！");
			}
		})
		
	})

</script>
</html>