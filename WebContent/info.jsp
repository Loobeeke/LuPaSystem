<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,com.model.*,com.servlet.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link rel=stylesheet href="css/common.css">
<link rel=stylesheet href="css/jdc-side-panel.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
<!-- Google font (font-family: 'Poppins', sans-serif;) -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700" rel="stylesheet">

<!-- Plugins -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/search.css" />
	
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- Style Css -->
<link rel="stylesheet" href="css/ticstyle.css">

<!-- Custom Styles -->
<link rel="stylesheet" href="css/custom.css">
<title>路趴-旅游资讯</title>
</head>
<body>
<header style="top:100px;">

<%@include file="header2.jsp" %>
</header>
	
<div class="banner"style="margin-top:80px;">
</div>

<article>
   <h2 class="title_tj">
    <p>文章<span>推荐</span></p>
  </h2>
  <div class="bloglist left">
  		<%-- <%
  			List infos = (List)request.getAttribute("infos");
  			for(int i=0;i<infos.size();i++){
  				Info info = (Info)infos.get(i);
  		%> --%>	
  		<c:forEach items="${infos}" var="info">
  		<h3>${info.theading} </h3>
	    <figure><img src="${ info.tpicture}"></figure>
	    <ul>
	     <p style="height:100px;">${ info.tcontent}</p>
	     <a title="${ info.theading}"   data-id="${info.tnumber}" target="_blank" class="readmore" >阅读全文>></a>
	    </ul>
	    <p class="dateview" style="margin-top:20px;"><span>${ info.tdate}</span><span>作者：${ info.tauthor}</span><span>发布时间：[${ info.ttime}]</span>
  		</p>
	  </c:forEach>
	   ${pageTool}
	 </div>
	
		
  <aside class="right">
  		 <h3>
      <p>本地<span>天气</span></p>
    </h3>
    <div class="weather">
    	<iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
    <div class="news">
    <h3>
      <p>旅游<span>资讯</span></p>
    </h3>
    <ul class="rank">
      <li><a href="https://news.cncn.com/291641.html" title="文旅部发布旅行社有序恢复经营疫情防控措施指南" target="_blank">有序恢复经营疫情防控措施指南</a></li>
      <li><a href="https://news.cncn.com/291642.html" title="文化和旅游部发布通知，有条件恢复跨省团队游" target="_blank">旅游部发布有条件恢复跨省团队游</a></li>
      <li><a href="https://news.cncn.com/291596.html" title="中国旅游蓄势待发" target="_blank">中国旅游蓄势待发</a></li>
      <li><a href="https://news.cncn.com/291716.html" title="2人去云南旅游5天多少钱？?" target="_blank">2人去云南旅游5天多少钱？?</a></li>
      <li><a href="https://news.cncn.com/291708.html" title="峨眉山和乐山大佛景区最大接待量调至最大承载量50％" target="_blank">峨眉山和乐山大佛景区承载量50％</a></li>
      <li><a href="https://news.cncn.com/291532.html" title="7月8日起长沙橘子洲景区闭园时间调整至18时" target="_blank">长沙橘子洲景区闭园时间调整至18时</a></li>
      <li><a href="https://news.cncn.com/291704.html" title="2020年“大美吉林，悦动消夏”全省广场文化活动拉开帷幕" target="_blank">2020年“大美吉林，悦动消夏”拉开帷幕</a></li>
      <li><a href="https://news.cncn.com/291531.html" title="龙宫景区今日因水位上涨暂停售票及乘船游览" target="_blank">龙宫景区今日因水位上涨暂停售票</a></li>
    </ul>
    <h3 class="ph">
      <p>热点<span>资讯</span></p>
    </h3>
    <ul class="paih">
      <li><a href="https://news.cncn.com/291334.html" title="黄腾峡空中玻璃 T台汉服秀精彩上演" target="_blank">黄腾峡空中玻璃 T台汉服秀精彩上演</a></li>
      <li><a href="https://news.cncn.com/291372.html" title="福建德化：发力全域旅游，撬动山城活力" target="_blank">福建德化：发力全域旅游，撬动山城活力</a></li>
      <li><a href="https://news.cncn.com/291518.html" title="广西开展旅游景区安全应急演练" target="_blank">广西开展旅游景区安全应急演练</a></li>
      <li><a href="https://news.cncn.com/291334.html" title="黄腾峡空中玻璃 近期不宜出国旅行或旅游" target="_blank">近期不宜出国旅行或旅游</a></li>
      <li><a href="https://news.cncn.com/291371.html" title="7月15日起，九江19个景区暑期对全国学子免门票" target="_blank">九江19个景区暑期对全国学子免门票</a></li>
    </ul>
  
    </div>  
   </aside>
  <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
    <script type="text/javascript" id="bdshell_js"></script> 


<div class="jdc-side" style="display: block;">
  <div class="mod_hang_qrcode jdc_feedback_qrcode">
    <a href="resetInfo.jsp"><div class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>发布资讯</span></div></a>
    
     <div class="mod_hang_qrcode_show">
      
      <div class="mod_hang_qrcode_show_bg">
        <div id="canvas" style="height: 123px; width: 123px;"><img src="images/re.png"width="100%" height="150%"></div>
      </div><br />
      <p>发布资讯</p>
    </div>
  </div>
 
  <div class="mod_hang_qrcode jdc_hang_qrcode"><a class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>扫码反馈</span></a>
    <div class="mod_hang_qrcode_show">
      <div class="mod_hang_qrcode_show_bg"></div>
      <p>扫码与客服反馈</p>
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
</article>
<div class="quick-view-modal">
            <span class="body-overlay"></span>
            <div class="quick-view-modal-inner">
                <div class="container">

                    <!-- Product Details Inner -->
                    <div class="row product-details">
					
                        <!-- Product Details Left -->
                        <div class="col-lg-5">
                            <div class="product-details-left">
                                <div class="product-details-images slider-navigation-2">
                                    <a href="img/product/large-size/product-image-1.jpg"id="P1">
                                        <img src="" alt="product image"id="i1">
                                    </a>
                                    <a href="img/product/large-size/product-image-2.jpg"id="P2">
                                        <img src="" alt="product image"id="i2">
                                    </a>
                                    <a href="img/product/large-size/product-image-3.jpg"id="P3">
                                        <img src="" alt="product image"id="i3">
                                    </a>
                                    <a href="img/product/large-size/product-image-4.jpg"id="P4">
                                        <img src="" alt="product image"id="i4">
                                    </a>
                                </div>
                                <div class="product-details-thumbs slider-navigation-2" id="P5">										
                                    <img src="" alt="product image thumb" id="i5">
                                    <img src="" alt="product image thumb"id="i6">
                                    <img src="" alt="product image thumb"id="i7">
                                    <img src="" alt="product image thumb"id="i8">
                                </div>
                            </div>
                        </div>
                        <!--// Product Details Left -->

                        <!-- Product Details Right -->
                        <div class="col-lg-7">
                            <div class="product-details-right">
                                <h5 class="product-title"id="N1"></h5>
                                
                                <div class="ratting-stock-availbility">
                                    <div class="ratting-box">
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span><i class="ti ti-star"></i></span>
                                    </div>
                                    <span class="stock-available">新发布</span>
                                </div>
                                
                                <p id="D1" style="height: 100px;font-size:16px;">1111111111</p>
                                
                                <span class="pricebox" id="PI1"></span><del id="PI2" style="font-size:16px;"></del>

                                <div class="product-details-quantity">
                                    <div class="quantity-select">
                                        <input type="text" value="1">
                                    </div>
                                    <a href="#" class="sf-button sf-button-sm">
                                        <span>ADD TO CART</span>
                                    </a>
                                </div>

                               

                                <div class="product-details-tags">
                                    <span>作者</span>
                                    <ul>
                                        <li><a href="#" id="S1" style="font-size:20px;"></a></li>
                                        
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <!--// Product Details Right -->
        			
                    </div>
                    <!--// Product Details Inner -->
                    
                </div>
                <button class="close-quickview-modal"><i class="ti ti-close"></i></button>
            </div>
        </div>
<footer>
 <%@ include file="footer.jsp" %>
</footer>
<script src="js/silder.js"></script>
<script src="js/vendor/modernizr-3.6.0.min.js"></script>
<script src="js/vendor/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main1.js"></script>
<script src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">

$(function(){
	$(".readmore").click(function(){
		//获得被点击的信息的id
		var tnumber = $(this).attr("data-id");
		//ajax  根据id查询这一条记录
		
		$.ajax({
			url:"Info",
			type:"post",
			data:{"tnumber":tnumber,"action":"querydetail"},
			dataType:"json",
			success:function(result){
				console.log(result)
				console.log(result.tpicture)
				$("#P1").attr("href",result.tpicture);
				$("#P2").attr("href",result.tpicture);
				$("#P3").attr("href",result.tpicture);
				$("#P4").attr("href",result.tpicture);
				$("#i1").attr("src",result.tpicture);
				$("#i2").attr("src",result.tpicture);
				$("#i3").attr("src",result.tpicture);
				$("#i4").attr("src",result.tpicture);
				$("#i5").attr("src",result.tpicture);
				$("#i6").attr("src",result.tpicture);
				$("#i7").attr("src",result.tpicture);
				$("#i8").attr("src",result.tpicture);
				$("#P5").attr("src",result.tpicture);
				$("#N1").html(result.theading);
				$("#D1").html(result.tcontent);
				$("#PI1").html(result.tdate);
				$("#PI2").html(result.ttime);
				$("#S1").html(result.tauthor);
				
			},
			error:function(){
				alert("系统发生错误，请联系管理员！");
			}
		})
		$('.quick-view-modal').toggleClass('is-visible');
		$('.quick-view-modal').find('.body-overlay').toggleClass('is-visible');
	})
})


</script>

</body>
</html>