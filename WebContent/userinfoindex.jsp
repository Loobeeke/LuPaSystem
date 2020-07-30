<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>个人信息完善页面</title>
<style>
	img {
		border: 0;
	}

	body {
		background: #f7f7f7;
		color: #666;
		font: 12px/150% Arial,Verdana, "microsoft yahei";
	}

	html, body, div, dl, dt, dd, ol, ul, li, h1, h2, h3, h4, h5, h6, p, blockquote, pre, button, fieldset, form, input, legend, textarea, th, td {
		margin: 0;
		padding: 0;
	}

	article,aside,details,figcaption,figure,footer,header,main,menu,nav,section,summary {
		display: block;
		margin: 0;
		padding: 0;
	}

	audio,canvas,progress,video {
		display: inline-block;
		vertical-align: baseline;
	}

	a {
		text-decoration: none;
		color: #08acee;
	}

	a:active,a:hover {
		outline: 0;
	}

	button {
		outline: 0;
	}

	mark {
		color: #000;
		background: #ff0;
	}

	small {
		font-size: 80%;
	}

	img {
		border: 0;
	}

	button,input,optgroup,select,textarea {
		margin: 0;
		font: inherit;
		color: inherit;
		outline: none;
	}

	li {
		list-style: none;
	}

	i {
		font-style: normal;
	}

	a {
		color: #666;
	}

	a:hover {
		color: #eee;
	}

	em {
		font-style: normal;
	}

	h2, h3 {
		font-family: "microsoft yahei";
		font-weight: 100;
	}



	/* ------------------- */
	::-moz-placeholder {
		color: #9fa3a7;
	}

	::-webkit-input-placeholder {
		color: #9fa3a7;
	}

	:-ms-input-placeholder {
		color: #9fa3a7;
	}


	.pc-kk-form{
		padding:15px 20px;
	}
	.pc-kk-form-list{
		background:#fff;
		border:1px solid #e5e5e5;
		border-radius:5px;
		height:44px;
		line-height:44px;
		margin-bottom:10px;
	}
	.pc-kk-form-list input{
		width:100%;
		border:none;
		background:none;
		color:#9fa3a7;
		font-size:14px;
		height: 36px;
		padding: 4px 10px;
	}
	.pc-kk-form-list textarea{
		background:none;
		border:none;
		height:60px;
		padding:10px;
		resize:none;
		width:94%;
		line-height:22px;
		color:#9fa3a7;
		font-size:14px;
	}
	.nice-select{
		position: relative;
		background: #fff url(images/a2.jpg) no-repeat right center;
		background-size:18px;
		width:47%;
		float:left;
		border:1px solid #e5e5e5;
		border-radius:5px;
		height:44px;
		line-height:44px;
	}

	.nice-select ul{
		width: 100%;
		display: none;
		position: absolute;
		left: -1px;
		top: 44px;
		overflow: hidden;
		background-color: #fff;
		max-height: 150px;
		overflow-y: auto;
		border: 1px solid #b9bcbf;
		z-index: 9999;
		border-radius:5px;

	}
	.nice-select ul li{
		padding-left:10px;
	}
	.nice-select ul li:hover{
		background:#f8f4f4;
	}
	.pc-kk-form-list-clear{
		background:none;
		border:none;
	}
	.pc-kk-form-btn button{
		background:#ec5224;
		color:#fff;
		border:none;
		width:100%;
		height:50px;
		line-height:50px;
		font-size:16px;
		border-radius:50px;
	}
</style>
</head>
<body>
<%@ include file="header2.jsp" %>
<div class="pc-kk-form" style="width:70%; height:500px; margin:0 auto; margin-top:7%;">
	<form action="userinfo" method="post">
		<div class="pc-kk-form-list">
			<input type="text" name="uname"  placeholder="姓名" >
		</div>
		<div class="pc-kk-form-list" style="width:300px;">
			<input type="text" name="uage"  placeholder="年龄" >
		</div>
		<div class="pc-kk-form-list" style="width:300px;">
			<input type="text" name="usex"  placeholder="性别" >
		</div>
		<div class="pc-kk-form-list">
			<input type="phone" name="uphone"  placeholder="手机号">
		</div>
		<div class="pc-kk-form-list">
			<input type="address" name="uaddress"  placeholder="所在地">
		</div>
		
		<div class="pc-kk-form-list" style="height:auto">
			<textarea placeholder="请输入内容" name="uexplain"></textarea>
		</div>
		<div class="pc-kk-form-btn">
			<input type="hidden" name="action" value="add" >
			<button>提交</button>
		</div>
	</form>
</div>


<script type="text/javascript" src="js/jquery.js"></script>

<script>

	$('[name="nice-select"]').click(function(e){

		$('[name="nice-select"]').find('ul').hide();

		$(this).find('ul').show();

		e.stopPropagation();

	});

	$('[name="nice-select"] li').hover(function(e){

		$(this).toggleClass('on');

		e.stopPropagation();

	});

	$('[name="nice-select"] li').click(function(e){

		var val = $(this).text();

		$(this).parents('[name="nice-select"]').find('input').val(val);

		$('[name="nice-select"] ul').hide();

		e.stopPropagation();

	});

	$(document).click(function(){

		$('[name="nice-select"] ul').hide();

	});
</script>
<div class="jumbotron text-center" align="center" style="margin-bottom:0;margin-top: 50px">
	<p>©LuPa 2020.<br>
            ALL RIGHTS RESERVED</p>
</div>
</body>
</html>
