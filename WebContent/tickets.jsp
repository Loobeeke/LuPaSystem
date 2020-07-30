<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>路趴-门票信息</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Google font (font-family: 'Roboto', sans-serif;) -->
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
</head>
<style>
	img{
		max-width:100%;
	}
</style>
<body>
	<header class="header sticky-header">
		<%@ include file="header2.jsp" %>

			<div class="single-hero-item bg-grey d-flex align-items-center" style="width: 100%; display: inline-block;">
				<div class="container">
					
					<img src="images/lupa_titck.png" alt="hero image" style="max-width:120%;width:120%;margin-top:150px;margin-left:-10%;">
				</div>
			</div>
	</header>
	<div style="wihth:60%;margin-left:100px;">
			<form action="Tickets" method="post" class="navbar-form navbar-left" role="search">
			<input class="" id="idNumber1" name="name" placeholder="请输入查询门票的名称" style="margin-top:1.5rem;margin-left:16rem;outline-style: none;background-color: #EEE;text-indent:3rem;height:46px;text-overflow:ellipsis;">
	            
	            <input type="hidden" name="action" value="queryname">
	            <button id="search" type="submit">搜索</button>
	        </form>
			
	
			
			<!-- <p style="margin-top:0.5rem;border-top: 1px solid #9A9A9A;font-family: '微软雅黑';margin-left:16rem;">查询历史
				<div class="delete history" style="width: 100%;margin-top: rem;margin-left:16rem;">
				</div>
			 
	
			
	
			<div class="history" id="his-dele" style="cursor: pointer;"><img src="img/icon_search_del.png" style="width:.98rem;height:.92rem;display: inline-block;cursor: pointer;"/><a>清除记录</a></div>
			-->
			<!--清空历史记录-->
		
	</div>
	<!-- Wrapper -->
	<div id="wrapper" class="wrapper">

       

        <!-- Page Conttent -->
		<main class="page-content">

            <!-- Shop Grid Area -->
            <div class="shop-grid-area section-padding-lg bg-white">
                <div class="container">
                    <div class="toolbox">
                        <div class="toolbox-view">
                            <button class="active" data-product-view="grid"><i class="ti ti-layout-grid3"></i></button>
                            <button data-product-view="list"><i class="ti ti-list"></i></button>
                        </div>
                        <div class="toolbox-productcount">
                            <span>门票信息</span>
                        </div>
                        <div class="toolbox-sorting">
                            <select name="" id="">
                               <!-- <option value="default">Default Sorting</option>
                                <option value="name">Name</option>
                                <option value="price">Price</option>
                                <option value="date">Date</option>
                                <option value="sell">Sell</option>-->
                            </select>
                        </div>
                    </div>

                    <div class="row products-wrapper shop-page-products">
                    
					<c:forEach items="${tickets}" var="tickets">
					
                        <!-- Single product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="product-item">
                                <div class="product-item-topside">
                                    <div class="product-item-images">
                                        <img src="${tickets.picture}" alt="product image" style="height:179.88px;">
                                        <img src="${tickets.picture}" alt="product image" style="height:179.88px;">
                                    </div>
                                    <div>
                                    <ul class="product-item-actions">
                                        
                                        <li class="quick-view-trigger" data-id="${tickets.id}"> <a href="#" >
                                        	
                                        <i class="ti ti-eye">
                                        </i> </a></li> 
                                         
                                    </ul>
                                    	
                                    </div>
                                    <span class="product-item-badge">热门</span>
                                </div>
                                <div class="product-item-bottomside">
                                    <div class="ratting-box">
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span><i class="ti ti-star"></i></span>
                                    </div>
                                    <h6><a href="product-details.html">${tickets.name}</a></h6>
                                    <span class="pricebox"><del>¥ ${tickets.oldprice}</del> ¥ ${tickets.price}</span>
                                    <p>${tickets.detail}</p>
                                </div>
                            </div>	
                        </div>
                        <!--// Single product -->
					</c:forEach>
                       

                    </div>

                    <div class="sf-pagination text-center">
                       ${pageTool}
                    </div>
                </div>
            </div>
            <!--// Shop Grid Area -->

            <!-- Popular products -->
            <div class="popular-products-area bg-white section-padding-bottom-lg">
                <div class="container">
                    <h3 class="small-title">门票详情</h3>

                    <div class="row products-wrapper products-slider-active slider-navigation-1">
						<c:forEach items="${tickets}" var="tickets">
                        <!-- Single product -->
                        <div class="col-12">
                            <div class="product-item">
                                <div class="product-item-topside">
                                    <div class="product-item-images">
                                        <img src="${tickets.getPicture()}" alt="product image" style="height:179.88px;">
                                        <img src="${tickets.getPicture()}" alt="product image" style="height:179.88px;">
                                    </div>
                                    <ul class="product-item-actions">
                                        <li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
                                        <li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
                                        <li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
                                        <li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
                                    </ul>
                                    <span class="product-item-badge">New</span>
                                </div>
                                <div class="product-item-bottomside">
                                    <div class="ratting-box">
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span><i class="ti ti-star"></i></span>
                                        <span><i class="ti ti-star"></i></span>
                                    </div>
                                    <h6><a href="product-details.html">${tickets.name}</a></h6>
                                    <span class="pricebox">¥ ${tickets.oldprice}</span>
                                </div>
                            </div>	
                        </div>
                        <!--// Single product -->
					</c:forEach>
                        

                    </div>
                </div>
            </div>
            <!--// Popular products -->

        </main>
        <!--// Page Conttent -->

		<!-- Footer Area -->
		
		<!--// Footer Area -->
        
        <!-- Quick View Modal -->
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
                                    <span class="stock-available">推荐</span>
                                </div>
                                
                                <p id="D1"></p>
                                
                                <span class="pricebox" id="PI1"> ¥ </span><del id="PI2">¥ </del>

                                <div class="product-details-quantity">
                                    <div class="quantity-select">
                                        <input type="text" value="1">
                                    </div>
                                    <a href="#" class="sf-button sf-button-sm">
                                        <span>ADD TO CART</span>
                                    </a>
                                </div>

                               

                                <div class="product-details-tags">
                                    <span>库存:</span>
                                    <ul>
                                        <li><a href="#" id="S1"></a></li>
                                        
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
        <!--// Quick View Modal -->

	<%-- <div style="">
		<%@ include file="footer.jsp" %></div>
	</div> --%>
	<!--// Wrapper -->

	<!-- Js Files -->
	<script src="js/vendor/modernizr-3.6.0.min.js"></script>
	<script src="js/vendor/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main1.js"></script>
	<script src="js/jquery-1.8.2.js"></script></script>
	<script type="text/javascript">
	
/* 
		$(function(){
			$("#detail").click(function(){
			
				
				
					$.ajax({
						url:"Tickets&action=queryId",
						type:"post",
						data:{"searchid":$("#searchid").val()},
						dataType:"json",
						success:function(result){
							
							$.each(result,function(index,item){
								$("#N1").html(item.id);
								$("#P1").src.html(item.id);
								$("#PI1").html(item.price);
								$("#PI2").html(item.oldprice);
								$("#S1").html(item.stock);
								console.log(item.sid+'   '+item.sname);
										
							}) 
						},
						error:function(){
							alert("系统发生错误，请联系管理员！");
						}
					})
					
				
			})
			
		}) */

			$(document).delegate(".delete>div", "click", function() {
				$("#idNumber1").val($(this).text());
			});

			/*搜索记录相关*/
			//从localStorage获取搜索时间的数组
			var hisTime;
			//从localStorage获取搜索内容的数组
			var hisItem;
			//从localStorage获取最早的1个搜索时间
			var firstKey;

			function init() {
				//每次执行都把2个数组置空
				hisTime = [];
				hisItem = [];
				//模拟localStorage本来有的记录
				//localStorage.setItem("a",12333);
				//本函数内的两个for循环用到的变量
				var i = 0
				for(; i < localStorage.length; i++) {
					if(!isNaN(localStorage.key(i))) {
						hisItem.push(localStorage.getItem(localStorage.key(i)));
						hisTime.push(localStorage.key(i));
					}
				}
				i = 0;
				//执行init(),每次清空之前添加的节点
				$(".delete").html("");
				for(; i < hisItem.length; i++) {
					//alert(hisItem);
					$(".delete").prepend('<div class="word-break" id=""style=" z-index: 1000;">' + hisItem[i] + '</div>')
				}
			}
			init();

			$("#search").click(function() {
				var value = $("#idNumber1").val();
				var time = (new Date()).getTime();

				if(!value) {
					alert("请输入搜索内容");
					return false;
				}

				//输入的内容localStorage有记录
				if($.inArray(value, hisItem) >= 0) {
					for(var j = 0; j < localStorage.length; j++) {
						if(value == localStorage.getItem(localStorage.key(j))) {
							localStorage.removeItem(localStorage.key(j));
						}
					}
					localStorage.setItem(time, value);
				}
				//输入的内容localStorage没有记录
				else {
					//由于限制了只能有6条记录，所以这里进行判断
					if(hisItem.length > 10) {
						firstKey = hisTime[0]
						localStorage.removeItem(firstKey);
						localStorage.setItem(time, value);
					} else {
						localStorage.setItem(time, value)
					}
				}
				init();
				//正式的时候要提交的！！！
				//$("#form1").submit()

			});

			//清除记录功能
			$("#his-dele").click(function() {
				var f = 0;
				for(; f < hisTime.length; f++) {
					localStorage.removeItem(hisTime[f]);
				}
				init();
			});
			//苹果手机不兼容出现input无法取值以下是解决方法
			$(function() {
				$('.word-break').click(function() {
					var div = $(this).text();
					$('#idNumber1').val(div);
				})
				//取到值以后button存储无法取值，这里强迫浏览器强行刷新可解决
				$('#search').click(function() {
					window.location.reload();
				})
			})
		</script>
</body>


</html>