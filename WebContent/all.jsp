<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.model.*" import="com.Dao.*" import="com.service.*"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home</title>
	

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style3.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Hotel Deluxe Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script src="js/jquery.easydropdown.js"></script>
<!--Animation-->
<script src="js/wow.min.js"></script>
<link href="css/animate.css" rel='stylesheet' type='text/css' />
<!-- <link rel="stylesheet" href="style3.css"> -->
<link rel="stylesheet" href="style.css">
<script>
	new WOW().init();
</script>

<style>
	img{
		max-width:150%;
	}
</style>
</head>
<body>

	<%@ include file="header2.jsp" %>
	<div class="header">
		<div class="bann">
			<img src="F_images/Food_banner.png" style="padding-left: 0%; margin-top: 7%;" >
		</div>           
   </div>

    
   <div class="content_top">
   	  <div class="container">
   		<div class="col-md-3 bottom_nav">
   		   <div class="content_menu">
			</div>
		</div>
		<form action="foodpage?action=query" method="post">
		<div class="col-md-6 content_dropdown1">
		   <!-- <div class="content_dropdown">    
		       <select class="dropdown" name="faddress" tabindex="10" data-settings='{"wrapperClass":"metro"}'>
		       			<option value="0">全部</option>	
            			<option value="0">开封</option>	
						<option value="1">郑州</option>
						<option value="2">信阳</option>
						<option value="3">洛阳</option>
		        </select>
		     </div> -->
		     <div class="content_dropdown">    
		       <select class="dropdown" name="ftype" tabindex="10" data-settings='{"wrapperClass":"metro"}'>
            			<option >火锅</option>	
						<option >小吃</option>
						<option >海鲜</option>
						<option >炸鸡</option>
		        </select>
		       </div>
		       <div class="sale" style="width: 100px; height: 35px;">
		       		<button style="border:none ;width: 80px; height: 25px;">搜索</button>
		       
		       </div>
		</div>
		</form>
		<div class="content_menu">
			</div>
   	</div>
   </div>
   <div class="content_middle">
   	  <div class="container">
   	    <div class="content_middle_box">
   		<div class="bottom_grid wow bounce" data-wow-delay="0.4s">
   		
   			<c:forEach items="${foods}" var="food">
   		  	<div class="col-md-3 index-grids">
   			  <div class="grid1">
   				<div class="view view-first">
                  <div class="index_img"><img src="${food.fpicture }" class="img-responsive" alt="" style="width: 262px; height: 180px"/></div>
   				     <div class="sale">￥：${food.fprice }</div>
   			          <div class="mask">
                      <div class="info"><i class="search"> </i>联系商家： ${food.fphone }</div>
                      </div>
                  </div> 
                  <i class="b_home"></i>
   				  <div class="inner_wrap2">
   				 	<h3>${food.fname } / ${food.ftype}</h3>
   				 	<ul class="star1">
   				 	  <h4 class="green">${ food.fstore}</h4>
   				 	  <li>￥:${food.fprice }/份</li>
   				 	</ul>
   				  </div>
   			   </div>
   			</div>
   			</c:forEach>
   			
   	  </div>
   	 
   	  
   </div>
   <div style="clear:both;"> ${pageTool}</div>

  <%@ include file="footer.jsp" %>
  
</body>
</html>		