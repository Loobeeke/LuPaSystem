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

	<div class="header">
	<%@ include file="header2.jsp" %>
		<div class="bann" style="width: 100%; display: inline-block;">
			<img src="F_images/Goods_banner.png" style="max-width:120%;width:100%;margin-top:150px;margin-left:-10%;" >
		</div>           
   </div>
  <%--  <header class="header sticky-header">
		<%@ include file="header2.jsp" %>

			<div class="single-hero-item bg-grey d-flex align-items-center" style="width: 100%; display: inline-block;">
				<div class="container">
					
					<img src="images/lupa_titck.png" alt="hero image" style="max-width:120%;width:120%;margin-top:150px;margin-left:-10%;">
				</div>
			</div>
	</header> --%>

    
   <div class="content_top">
   	  <div class="container">
   		<div class="col-md-3 bottom_nav">
   		   <div class="content_menu">
			</div>
		</div>
		<div class="col-md-6 content_dropdown1">
			     <form action="goods?action=query" method="post" role="search_by_ftype" >
			     <div class="content_dropdown">    
			       <select class="dropdown" tabindex="10" id="gtype" name="gtype" data-settings='{"wrapperClass":"metro"}'>
	            			<option value="纪念品">纪念品</option>	
							<option value="食品">食品</option>
							<option value="服饰">服饰</option>
							<option value="饰品">饰品</option>
			        </select>
			        <!-- <input type="hidden" name="action" value="search_by_ftype"> -->
			       </div>
			       
			       <div class="sale" style="width: 80px; height: 35px;"><button style="border:none ;width: 80px; height: 25px;">搜索</button></div>
		       </form>
		</div>
		<div class="content_menu">
			</div>
   	</div>
   </div>
   <div class="content_middle">
   	  <div class="container">
   	    <div class="content_middle_box">
   		<div class="bottom_grid wow bounce" data-wow-delay="0.4s">
   			<c:forEach items="${goods}" var="goods">
   		  	<div class="col-md-3 index-grids">
   			  <div class="grid1">
   				<div class="view view-first">
                  <div class="index_img"><img src="${goods.gpicture }" class="img-responsive" alt="" style="width: 262px; height: 260px"/></div>
   				     <div class="sale">￥：${goods.gprice }</div>
   			          <div class="mask">
                      <div class="info"><i class="search"> </i> 联系商家：${goods.gphone }</div>
                      </div>
                  </div> 
                  <i class="b_home"></i>
   				  <div class="inner_wrap2">
   				 	<h3>${goods.gname }/${goods.gtype }</h3>
   				 	<ul class="star1">
   				 	  <h4 class="green">${goods.gstore }</h4>
   				 	  <li>￥:${goods.gprice }/件</li>
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