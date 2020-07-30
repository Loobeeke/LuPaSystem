<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--[if IE 7]><html class="no-js ie7 oldie" lang="en-US"> <![endif]-->
<!--[if IE 8]><html class="no-js ie8 oldie" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>路趴—酒店信息</title>
		
	   
        <!-- Font Icon -->
        <link href="hodel/css/plugin/font-awesome.min.css" rel="stylesheet" type="text/css">  

        <!-- CSS Global -->
        <link href="hodel/css/plugin/bootstrap.min.css" rel="stylesheet" type="text/css">  
        <link href="hodel/css/plugin/bootstrap-select.min.css" rel="stylesheet" type="text/css">     
        <link href="hodel/css/plugin/owl.carousel.css" rel="stylesheet" type="text/css">
        <link href="hodel/css/plugin/animate.css" rel="stylesheet" type="text/css"> 
        <link href="hodel/css/plugin/subscribe-better.css" rel="stylesheet" type="text/css"> 

        <!-- Custom CSS -->
        <link href="hodel/css/style.css" rel="stylesheet" type="text/css">

        <!-- Color CSS --> 

        <!--[if lt IE 9]>
        <script src="hodel/js/plugin/html5shiv.js"></script>
        <script src="hodel/js/plugin/respond.js"></script>
        <![endif]-->        
    </head>

    <body id="home" class="wide">

         

        <div id="loading">
            <div class="loader">
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
            </div>
        </div> 

        <!-- WRAPPER -->
        <main class="wrapper home-wrap"> 
            <!-- CONTENT AREA -->
		<header class="main-header">  
			<div class="container-fluid rel-div">
                    <div class="col-lg-4 col-sm-8">
                        <div class="main-logo">
                            <a href="hotel2.jsp"> <strong> 路趴<img src="/LuPa/WebContent/images/lupa_logo_wid.png" alt="" /> </strong> <span class="light-font"></span>  </a>
                            <span class="medium-font">酒店查询</span>
                        </div>
                    </div>

                    <div class="col-lg-6 responsive-menu">  
                        <div class="responsive-toggle fa fa-bars"> </div>
                        <nav class="fix-navbar" id="primary-navigation">            
                            <ul class="primary-navbar">                                                
                                <li><a href="#"> 首页</a></li>
                                <li><a href="#">查询</a></li>
								<li><a href="#">约伴</a></li> 
								<li><a href="#">商城 </a></li>        
								<li><a href="#"> 社交广场 </a></li>
                            </ul>                           
                        </nav>
                    </div>

                    

                </div>  
		</header>
              <!-- Main Slider Start -->
            <section class="main-slide" style="margin-top:80px;">
                <img src="hodel/img/lupa_hotel.png" />
               <!-- <div class="tbl-wrp slide-1">
                    <div class="text-middle">
                        <div class="tbl-cell">
                            <div class="slide-caption container text-center">
                                <div class="slide-title">
                                    <img src="hodel/img/lupa_hotel.png" alt="" />
                                    <span>100% Guarantee</span>
                                </div>
                                <div class="slide-title2 pb-50">
                                    <h2 class="section-title"> <span class="light-font">Live </span> <strong>organic </strong> <span class="light-font">for live </span> <strong>healthy </strong> </h2>
                                    <h4 class="sub-title"> ORGANIC FRUITS, VEGETABLES, AND LOT MORE TO YOUR DOOR </h4>
                                </div>
                                <div class="slide">
                                    <a href="#" class="slide-btn"> Shop Now</a>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
            </section>
            <!-- / Main Slider Ends -->   

            < <!-- Subscribe Newsletter Starts-->
            <section class="subscribe-wrap sec-space light-bg">
                <img alt="" src="hodel/img/extra/sec-img-5.png" class="right-bg-img" />  
                <img alt="" src="hodel/img/extra/sec-img-6.png" class="left-bg-img" />  

                <div class="container"> 
                    <div class="row"> 
                        <div class="col-md-4"> 
                            <h4 class="sub-title"> 查询你有意向的酒店 </h4>
                            <h2 class="fsz-35"> <span class="light-font">查询</span> <strong>酒店</strong> </h2>
                        </div>
                        <div class="col-md-8"> 
                            <form class="newsletter-form row" method="post"action="Hotel">
                                <div class="form-group col-sm-8">
                                    <input style="height: 50px;" name="hname"class="form-control" placeholder="请输入您要查询酒店的名称..." required=""  type="text">                                                                                     
                                </div>
                                <div class="form-group col-sm-4">
                                <input type="hidden" name="action" value="queryname">                                               
                                    <button class="theme-btn btn-block" type="submit">查询<i class="fa fa-long-arrow-right"></i> </button>                                            
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Subscribe Newsletter Ends -->


            <!-- Organic All Starts-->
            <section class="organic-all sec-space-bottom">
                <div class="pattern"> 
                    <img alt="" src="hodel/img/icons/white-pattern.png" />
                </div>
                <div class="section-icon"> 
                    <img style="width:10%;" alt="" src="images/lupa_logo_wid.png" />
                </div>
                
                <div class="container-fluid"> 
                    <div class="col-md-12"> 
                        <div class="tab-content organic-content row"> 
                            <div id="product-tab-1" class="tab-pane fade active in"> 
                                <div class="product-slider-1 dots-1"> 

                                   <c:forEach items="${hotels}" var="hotels"> 
                                    <div class="item1" style="margin-right:30px;"> 
                                        <div class="product-box"> 
                                            <div class="product-media"> 
                                                <img class="prod-img" alt="" src="${hotels.hpicture}" />     
                                                <img class="shape" alt="" src="${hotels.hpicture}" />
                                                <span class="prod-tag tag-1">推荐</span> <span class="prod-tag tag-2">${hotels.htype}</span>
                                                <div class="prod-icons"> 
                                                    <a href="#" class="fa fa-heart"></a>
                                                    <a href="#" class="fa fa-shopping-basket"></a>
                                                   <a  href="#product-preview"  data-id="${hotels.hnumber}" data-toggle="modal" class="fa fa-expand" id="hotel"></a>
                                                </div>
                                            </div
                                            >

                                            <div class="product-caption"> 
                                                <h3 class="product-title">
                                                    <a href="#product-preview"> <span class="light-font"> </span>  <strong>${hotels.hname}</strong></a>
                                                </h3>
                                                <div class="price"> 
                                                    <strong class="clr-txt">¥ ${hotels.hprice} </strong>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    </c:forEach>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </section>
            <!-- / Organic All Ends -->

            <!-- naturix Goods Starts-->
            <section class="naturix-goods sec-space-bottom">
                <div class="container"> 
                    <div class="title-wrap">
                        <h4 class="sub-title"> 酒店推荐列表 </h4>
                        <h2 class="section-title"> <span class="round-shape">  <span class="light-font">路趴 </span> <strong> 酒店 <img src="hodel/img/icons/logo-icon.png" alt="" /></strong> </span> </h2>
                    </div>

                 
                    <div class="tab-content organic-content row"> 
                        <div id="naturix-tab-1" class="tab-pane fade active in"> 
                            <div class="naturix-slider-1 dots-1"> 
                               <c:forEach items="${hotels}" var="hotels"> 
                                <div class="item"> 
                                    <div class="product-box"> 
                                        <div class="product-media"> 
                                            <img class="prod-img" alt="" src="${hotels.hpicture}" />     
                                            <img class="shape" alt="" src="hodel/img/icons/shap-small.png" />
                                            <div class="prod-icons"> 
                                                <a href="#" class="fa fa-heart"></a>
                                                <a href="#" class="fa fa-shopping-basket"></a>
                                                <a  href="#product-preview"  data-id="${hotels.hnumber}" data-toggle="modal" class="fa fa-expand"></a>
                                            </div>
                                        </div>

                                        <div class="product-caption"> 
                                            <h3 class="product-title">
                                                <a href="#"> <span class="light-font"></span>  <strong>${hotels.hname}</strong></a>
                                            </h3>
                                            <div class="price"> 
                                                <strong class="clr-txt">¥ ${hotels.hprice} </strong> <del class="light-font"></del>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product-box"> 
                                        <div class="product-media"> 
                                            <img class="prod-img" alt="" src="${hotels.hpicture}" />     
                                            <img class="shape" alt="" src="hodel/img/icons/shap-small.png" />  
                                            <div class="prod-icons"> 
                                                <a href="#" class="fa fa-heart"></a>
                                                <a href="#" class="fa fa-shopping-basket"></a>
                                               <a  href="#product-preview" data-id="${hotels.hnumber}" data-toggle="modal" class="fa fa-expand"></a>
                                            </div>
                                        </div>                                           
                                        <div class="product-caption"> 
                                            <h3 class="product-title">
                                                <a href="#"> <span class="light-font"></span>  <strong>${hotels.hname}</strong></a>
                                            </h3>
                                            <div class="price"> 
                                                <strong class="clr-txt">¥ ${hotels.hprice} </strong> <del class="light-font"> </del>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                               </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <!-- / naturix Goods Ends -->

            
            <!-- Random Products Starts-->
            <section class=" sec-space-bottom">
                <div class="pattern"> 
                    <img  alt="" src="hodel/img/icons/white-pattern.png">
                </div>
                <div class="section-icon"> 
                    <img style="width:8%;" alt="" src="images/lupa_logo_wid.png">
                    <div class="pt-15 icon"> 
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>  
                        <span class="light-font"> 页面 </span> <strong>推荐</strong>
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>  
                    </div>
                </div>
                <div class="container"> 
                    <!-- Random Products -->
                   

                    <!-- Banner -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="prod-banner green-banner">
                                <h4 class="title"> <span class="light-font"> 路趴: </span> <strong> 查询 </strong> </h4>
                                <div class="banner-box">
                                    <div class="banner-content">
                                        <h3 class="title-sec">Tickets</h3>
                                        <h2 class="section-title"> <span class="light-font">门票 </span> <strong>查询 </strong> </h2>
                                        <h4 class="sub-title"> 查询你的门票信息 </h4>
                                        <a href="tickets.jsp" class="btn"> <span> 去 查 询 门 票</span> <i class="fa fa-long-arrow-right"></i> </a>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="prod-banner orange-banner">
                                <h4 class="title"> <span class="light-font"> 路趴  </span> <strong>旅游资讯 </strong> </h4>
                                <div class="banner-box">
                                    <div class="banner-content">
                                        <h3 class="title-sec">Tourist information</h3>
                                        <h2 class="section-title"> <span class="light-font">旅游</span> <strong> 资讯</strong> </h2>
                                        <h4 class="sub-title">查看旅游资讯 </h4>
                                        <a href="info.jsp" class="btn"> <span> 去 查 看 资 讯</span> <i class="fa fa-long-arrow-right"></i> </a>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Random Products Ends -->

           

            <!-- latest news Starts-->
            
            <!-- latest news Ends -->

            <!-- / CONTENT AREA -->

           
            <div id="to-top-mb" class="to-top mb"> <i class="fa fa-arrow-circle-o-up"></i> </div>
        </main>
        <!-- /WRAPPER -->

        <!-- 详情弹出框 -->
        <section class="modal fade" id="product-preview" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg product-modal">
                <div class="modal-content">
                    <a aria-hidden="true" data-dismiss="modal" class="sb-close-btn close" href="#"> <i class=" fa fa-close"></i> </a>                 

                    <div class="product-single pb-50 clearfix">
                       
                        <div class="col-lg-6 col-sm-8 col-sm-offset-2 col-lg-offset-0 pt-50">
                            <div class="prod-slider sync1">
                                <div class="item"> 
                                    <img id="P1" src="" alt="">
                                    <a href="hodel/img/products/prod-big-1.png" data-gal="prettyPhoto[prettyPhoto]" title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                                </div>
                                <div class="item"> 
                                    <img id="P2" src="hodel/img/products/prod-single-2.png" alt=""> 
                                    <a href="hodel/img/products/prod-big-2.png" data-gal="prettyPhoto[prettyPhoto]" title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                                </div>
                                <div class="item"> 
                                    <img id="P3" src="hodel/img/products/prod-single-3.png" alt=""> 
                                    <a href="hodel/img/products/prod-big-3.png" data-gal="prettyPhoto[prettyPhoto]" title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                                </div> 
                                <div class="item"> 
                                    <img id="P4" src="hodel/img/products/prod-single-1.png" alt=""> 
                                    <a href="hodel/img/products/prod-big-1.png" data-gal="prettyPhoto[prettyPhoto]" title="Product" class="caption-link"><i class="arrow_expand"></i></a>
                                </div> 
                            </div>

                            <div  class="sync2">
                                <div class="item"> <a href="#"> <img id="P5" src="hodel/img/products/thumb-1.png" alt=""> </a> </div>
                                <div class="item"> <a href="#"> <img id="P6" src="hodel/img/products/thumb-2.png" alt=""> </a> </div>
                                <div class="item"> <a href="#"> <img id="P7" src="hodel/img/products/thumb-3.png" alt=""> </a> </div>
                                <div class="item"> <a href="#"> <img id="P8" src="hodel/img/products/thumb-1.png" alt=""> </a> </div>
                            </div>
                        </div>
                       

                        <div class="col-lg-6 pt-50">
                            <div class="product-content block-inline">

                                <div class="tag-rate">
                                    <span class="prod-tag tag-1">推荐</span> <span class="prod-tag tag-2">热门</span>
                                    <div class="rating">
                                        <span class="star active"></span>
                                        <span class="star active"></span>
                                        <span class="star active"></span>
                                        <span class="star active"></span>
                                        <span class="star active"></span>
                                        <span class="fsz-12" id="D1"> 类型</span>
                                    </div>
                                </div>

                                <div class="single-caption"> 
                                    <h3 class="section-title">
                                        <a href="#"> <span class="light-font"></span>  <strong id="N1">名字</strong></a>
                                    </h3>
                                    <span class="divider-2"></span>
                                    <p class="price"> 
                                        <strong class="clr-txt fsz-20" id="PI1">价格</strong> <del class="light-font"></del>
                                    </p>

                                    <div class="fsz-16">
                                        <p id="D">详情</p>
                                    </div>

                                    <div class="prod-btns">
                                   </div>
                                    <ul class="meta">
                                        <li> <strong> 地址： </strong> <span id="S1"> 地址 </span> </li>
                                        <li> <strong> 电话： </strong> <span id="PH1">电话</span> </li>
                                    </ul>
                                    <div class="divider-full-1"></div>
                                    <!-- <div class="add-cart pt-15">
                                        <a href="#" class="theme-btn btn"><i class=" fa fa-close"> <strong> 关闭 </strong></i> </a>
                                    </div> -->
                                </div>
                            </div>
                        </div> 
                    </div>  

                </div>
            </div>
        </section>
        <div  style="padding:35px 0;font-size:12px;color:rgba(0,0,5,.8); background-color:rgba(55,55,55,.03);text-align:center;">   
				版 权 所 有 © 路 趴  All Right Reserved
		 	</div>
        
        
        <!-- / Product Preview Popup -->


        <!-- 弹窗 -->
        <section id="subscribe-popups" class="subscribe-me popups-wrap">                
            <div class="modal-content">   
                <button type="button" class="sb-close-btn close popup-cls"> <i class="fa-times fa clr-txt"></i> </button>
                <div class="subscribe-wrap">                                                                   
                    <div class="main-logo">
                        <a href="#"> <strong>路趴 <img src="images/lupa_logo.png" alt="" /> </strong> <span class="light-font">酒店查询</span>  </a>
                    </div>

                    <div class="title-wrap">
                        <h2 class="section-title"> <strong>欢迎来到路趴酒店</strong> </h2>
                        <h4 class="fsz-12"> 在旅途中找到家的感觉 </h4>
                    </div>

                    <form class="newsletter-form">
                        <div class="form-group">
                                                                                                                 
                        </div>
                        <div class="form-group">                                               
                                                            
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- / Subscribe Popup-Dark -->

        <!-- JS Global -->
        <script src="hodel/js/plugin/jquery-2.2.4.min.js"></script>   
        <script src="hodel/js/plugin/bootstrap.min.js"></script>
        <script src="hodel/js/plugin/bootstrap-select.min.js"></script>
        <script src="hodel/js/plugin/owl.carousel.min.js"></script>
        <script src="hodel/js/plugin/jquery.plugin.min.js"></script>
        <script src="hodel/js/plugin/jquery.countdown.js"></script>
        <script src="hodel/js/plugin/jquery.subscribe-better.min.js"></script>

        <!-- Custom JS -->   
        <script src="hodel/js/theme.js"></script>
       <script src="js/silder.js"></script>
		<script src="js/vendor/modernizr-3.6.0.min.js"></script>
		<script src="js/vendor/jquery-3.3.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/main1.js"></script>
		<script src="js/jquery-1.8.2.js"></script>
		
		<!-- <script type="text/javascript">
		$(function(){
			$(".readmore").click(function(){
			})
		})

		
		</script> -->
		
	<script type="text/javascript">
	
	$(function(){
	$(".fa-expand").click(function(){
		//获得被点击的信息的id
		var hnumber = $(this).attr("data-id");
		//ajax  根据id查询这一条记录
		
		$.ajax({
			url:"Hotel",
			type:"post",
			data:{"hnumber":hnumber,"action":"querydetail"},
			dataType:"json",
			success:function(result){
				console.log(result)
				console.log(result.hpicture)
				$("#P1").attr("src",result.hpicture);
				$("#P2").attr("src",result.hpicture);
				$("#P3").attr("src",result.hpicture);
				$("#P4").attr("src",result.hpicture);
				$("#P5").attr("src",result.hpicture);
				$("#P6").attr("src",result.hpicture);
				$("#P7").attr("src",result.hpicture);
				$("#P8").attr("src",result.hpicture);
				$("#N1").html(result.hname);
				$("#D").html(result.hdetail);
				$("#D1").html(result.htype);
				$("#PI1").html("价格：¥"+result.hprice);
				$("#S1").html(result.haddress);
				$("#PH1").html(result.hphone);
			},
			error:function(){
				alert("系统发生错误，请联系管理员！");
			}
		})
		/* $('.quick-view-modal').toggleClass('is-visible');
		$('.quick-view-modal').find('.body-overlay').toggleClass('is-visible');  */
	})
})


</script>  



    </body>
</html>
