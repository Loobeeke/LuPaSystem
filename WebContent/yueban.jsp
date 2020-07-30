<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8" import="java.util.*,com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/style.css" />
<link rel="stylesheet" href="assets/css/vendor.css" />
<link rel=stylesheet href="css/common.css">
<link rel=stylesheet href="css/jdc-side-panel.css">
<link rel="stylesheet" href="css/yueban.css" />
<link rel = "stylesheet" href = "css/cityselect.css" >
<script type="text/javascript" src="assets/js/active.js" ></script>
<script type="text/javascript" src="assets/js/vendor.js" ></script>
<script type="text/javascript" src="js/cityselect.js" ></script>
<style type="text/css">
.bann img{
	width: 100%;
	height: 100%;
	margin-top: -9px;
}	
.demo {
    width: 418px;
    /* margin: 50px auto; */
    margin-left: 50%;
    margin-top: 50px;
}
.demo input {
    padding: 12px 18px;
    width: 300px;
   
}
#cityselect {
    width: 100px;
    heigth: 20px;
    text-align: center;
    background-color: pink;
    /* font-size: 23px; */
    height: 49px;
    margin-top: 21px;
}
.han img{
	max-width:60%;
}
</style>
</head>
<body>
	<div class="han">
	<%@ include file="header2.jsp" %>
    </div>
	<!-- <div class="demo">
		在输入框加入id
		<input type="text" class="cityinput" id="citySelect" placeholder="请输入目的地">
		<button id="cityselect">搜索</button>
	</div>	 -->
	<div class="bann" style="margin-top:100px;">
		<img src="img1/路趴-约伴.png" />
	</div>
	
	
	<div class="container py-lg-4 py-sm-3">
		<h2 class="heading text-capitalize text-center"> 寻找旅行约伴，享受美好生活</h2>
		<p class="text mt-2 mb-5 text-center">带着兴趣出发，途径幸福村，好运镇，开心市，平安大道，最后尽兴而归，祝每一位旅途愉快</p>
		<div class="type">
			<!-- <p>国内游</p> -->
			<form action="appointment" method="post">
			<div class="demo">
				<!-- 在输入框加入id -->
				<input type="text" class="cityinput" id="atitle" name="atitle" placeholder="请输入标题信息">
				<input type="hidden" name="action" value="query" >
				<button id="cityselect">搜索</button>
			</div>
			</form>	
			<hr style="width: 80%;" />
		</div>
		
		<div class="row">
			<c:forEach items="${appoints}" var="appoint">
			<div class="col-lg-3 col-sm-6 mb-5">
				<div class="image-tour position-relative">
					<img src="${appoint.apicture}" alt="" class="img-fluid" style="width:270px;height:270px;" />
					<p><span class="fa fa-tags"></span> <span>${appoint.aprice}</span></p>
				</div>
				<div class="package-info">
					<h6 class="mt-1"><span class="glyphicon glyphicon-user"></span>发布人：${appoint.aautor}</h6>
					<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span>出发地：${appoint.astartaddress}</h6>
					<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span>目的地：${appoint.aendaddress}</h6>
					<h5 class="my-2">标题：${appoint.atitle}</h5>
					<p class="">内容：${appoint.acontent}</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span>天数 : <span>${appoint.atime}</span></li>
					</ul>
					<p class="phone">联系方式：${appoint.aphone}</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<div style="clear:both;"> ${pageTool}</div>
	
	<section class="destinations py-5" id="destinations">
	<div class="container py-xl-5 py-lg-3">
		<h3 class="heading text-capitalize text-center"> Popular Destinations</h3>
		<p class="text mt-2 mb-5 text-center">Vestibulum tellus neque, sodales vel mauris at, rhoncus finibus augue. Vestibulum urna ligula, molestie at ante ut, finibus vulputate felis.</p>
		<div class="row inner-sec-w3layouts-w3pvt-lauinfo">
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">China</h4>
				<div class="image-position position-relative" id="immg" >
					<img src="img1/china.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info" id="oa-submean">
					<div class="caption mb-lg-3">
						<h4>China</h4>
						<a href="booking.html">Book Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">Malaysia</h4>
				<div class="image-position position-relative">
					<img src="img1/malaysia.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>Malaysia</h4>
						<a href="booking.html">Book Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">Japan</h4>
				<div class="image-position position-relative">
					<img src="img1/japan.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>Japan</h4>
						<a href="booking.html">Book Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">Singapore</h4>
				<div class="image-position position-relative">
					<img src="img1/singapore.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>Singapore</h4>
						<a href="booking.html">Book Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


	 <div class="footer">
        <div class="clear"></div>
        <p class="copyright">
        	©LuPa 2020.<br>
            ALL RIGHTS RESERVED
        </p>
        
    </div> 	
	
	
	
	<div class="jdc-side" style="display: block;">
  
  <div class="mod_hang_appeal">
    <div class="mod_hang_appeal_btn"><i class="jdcfont"></i> <span>咨询反馈</span></div>
    <div class="mod_hang_appeal_show">
      <ul>
        <li><a href="push.jsp" target="_blank">
          <div class="icon_box"><i class="jdcfont"></i></div>
          <div class="text_box">
            <h5 color="gray">我要发布</h5>
            
          </div>
          </a></li>
        
      </ul>
    </div>
    </div>
  
  <div class="mod_hang_qrcode mod_hang_top"><a href="#" class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>返回顶部</span></a></div>
  <div class="el-dialog__wrapper" style="display: none;">
    <div class="el-dialog el-dialog--small" style="top: 15%;">
      <div class="el-dialog__header"><span class="el-dialog__title"></span>
        <div type="button" class="el-dialog__headerbtn"><i class="el-dialog__close el-icon el-icon-close"></i></div>
      </div>
      </div>
  </div>
</div>	
</body>
<script type="text/javascript">
	var test=new Vcity.CitySelector({input:'citySelect'});
</script>
</html>