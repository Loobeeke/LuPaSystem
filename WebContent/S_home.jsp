<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.model.Goods" import="com.service.DBGoodsImplement" import="com.Dao.DBGoodsDao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>S_home</title>
    <%@ include file="header2.jsp" %>
    <!--meta tags -->
    <!--
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="" />
    -->
    <script>
      addEventListener("load", function () {
      	setTimeout(hideURLbar, 0);
      }, false);
      
      function hideURLbar() {
      	window.scrollTo(0, 1);
      }
    </script>
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//stylesheets-->
   <!-- Web-Fonts -->
	<link href="http://fonts.googleapis.com/css?family=Poiret+One&amp;subset=cyrillic,latin-ext" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Mada:200,300,400,500,600,700,900&amp;subset=arabic" rel="stylesheet">
	<!-- //Web-Fonts -->
	<link rel="stylesheet" href="style.css">

  </head>
  <body>
  
    <div class="main-top" id="home">
      <!-- header -->
      <div class="headder-top">

      </div>
      <!-- //header -->
      <!-- banner -->
     <div class="header">
		<div class="bann">
			<img src="F_images/Goods_banner.png" style="padding-left: 0%; margin-top: 7%;" >
		</div>           
   </div>

    <!-- //banner -->
    <!-- about -->
    <section class="about py-lg-4 py-md-3 py-sm-3 py-3" id="about">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
      <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">好物社区</h3>
        <div class="row">
		 <div class="col-lg-6 about-imgs-txt">
             <img src="F_images/S_community.jpg" alt="news image" class="img-fluid">
          </div>
         <div class="col-lg-6 text-right about-two-grids">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3"><a href="S_all.jsp">好物社区</a></h3>
            <div class="about-para-txt">
              <p>山中走兽云中燕，陆地牛羊海底鲜。中华美食素来品种丰富，口味独特。各地风土人情孕育出各地独特的的味道，共同造就了精妙的中华美食文化。<br>与风景一样，唯一美食同样不可辜负！</p>
              <p class="mt-2">路趴引领美食新风尚！交上三两好友踏遍千山万水，共享人间至味！</p>
            </div>
            <div class="view-buttn mt-lg-5 mt-md-4 mt-3">
              <a href="single.html" class=" scroll"><font color="#1E90FF"><a href="S_all.jsp">更多</a></font></a>
            </div>
          </div>
		  
        </div>
      </div>
    </section>
    <!-- //about -->
	<section class="blog_w3ls pb-5" id="why">
		<div class="container pb-xl-5 pb-lg-3">
			<h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3"><a href="S_all.jsp">榜单收藏栏</a></h3>
			<div class="row">
				<!-- blog grid -->
				<div class="col-lg-4 col-md-6">
					<div class="card border-0 med-blog">
						<div class="card-header p-0">
							<a href="S_all.jsp">
								<img class="card-img-bottom" src="F_images/G_01.jpg" alt="Card image cap">
							</a>
						</div>
						<div class="card-body border border-top-0">
							<div class="mb-3">
								<h5 class="blog-title card-title m-0"><a href="S_all.jsp">信阳 - 毛尖</a></h5>
								<div class="blog_w3icon">
									<span>xinyang -- maojian</span>
								</div>
							</div>
							<p>Cras ultricies ligula sed magna dictum porta auris blandita.</p>
						</div>
					</div>
				</div>
				<!-- //blog grid -->

				<!-- blog grid -->
				<div class="col-lg-4 col-md-6 mt-lg-0 mt-5">
					<div class="card border-0 med-blog">
						<div class="card-header p-0">
							<a href="S_all.jsp">
								<img class="card-img-bottom" src="F_images/G_03.jpg" alt="Card image cap">
							</a>
						</div>
						<div class="card-body border border-top-0">
							<div class="mb-3">
								<h5 class="blog-title card-title m-0"><a href="S_all.jsp">洛阳 -牡丹饼</a> </h5>
								<div class="blog_w3icon">
									<span>
										luoyang -- mudanbing</span>
								</div>
							</div>
							<p>Cras ultricies ligula sed magna dictum porta auris blandita.</p>
						</div>
					</div>
				</div>
				<!-- //blog grid -->
				<!-- blog grid -->
				<div class="col-lg-4 col-md-6 mt-md-0 mt-5">
					<div class="card border-0 med-blog">
						<div class="card-header p-0">
							<a href="S_all.jsp">
								<img class="card-img-bottom" src="F_images/G_02.jpg" alt="Card image cap">
							</a>
						</div>
						<div class="card-body border border-top-0">
							<div class="mb-3">
								<h5 class="blog-title card-title m-0"><a href="S_all.jsp">开封 - 花生糕</a></h5>
								<div class="blog_w3icon">
									<span>kaifeng -- huashenggao</span>
								</div>
							</div>
							<p>Cras ultricies ligula sed magna dictum porta auris blandita.</p>
						</div>
					</div>
				</div>
				<!-- //blog grid -->
			</div>
		</div>
	</section>


    <!-- service -->

    <!-- //service -->
  
	 <!-- collection -->
    <section class="collection py-lg-4 py-md-3 py-sm-3 py-3">
    <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">城市打卡</h3>
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <!--row -->
        <div class="row">
          <div class="col-lg-7 col-md-6 collection-w3layouts">
            <h4> 河南-开封</h4>
            <p class="mt-2"><font size="3">开，是富丽祥和的开幕，封，是锦绣盛世的封藏。<br>举目则青楼画阁，绣户珠帘。雕车竞驻于天街，宝马争驰于御路，金翠耀日，罗绮飘香。新声巧笑于柳陌花衢，按管调弦于茶坊酒肆。八荒争凑，万国咸通。集四海之珍奇，皆归市易；会寰区之异味，悉在庖厨。——《东京梦华录》</font></p>
            <div class="view-buttn mt-lg-4 mt-3">
              <a href="S_all.jsp" class=""><font color="#1E90FF">更多</font></a>
            </div>
          </div>
          <div class="col-lg-5 col-md-6">
          <a href="S_all.jsp">
            <img src="F_images/S_Kaifeng.jpg" alt="news image" class="img-fluid" style="width:570px; height:334px">
            </a>
          </div>
        </div>
        <!--// row -->
        <!-- row -->
        <div class="row my-lg-5 my-md-4 my-3">
          <div class="col-lg-5 col-md-6">
          <a href="S_all.jsp">
            <img src="F_images/S_xiangyang.jpg" alt="news image" class="img-fluid" style="width:570px; height:334px">
            </a>
          </div>
          <div class="col-lg-7 col-md-6 collection-w3layouts">
            <h4>湖北-襄阳</h4>
            <p class="mt-2"><font size="3">史书中的襄阳，是风雨欲来、英雄出世的襄阳。登临城墙，凭水远望，各路豪杰争霸江湖的演义在脑海中一一浮现，怎能不教人心潮澎湃，思绪飞扬。<br>我们总觉得襄阳人的身上有一股武侠气质。认为生在武侠城市的人就应该有武侠气质。

结结实实的古城墙贯穿着从历史里总结出的骄傲，并一直延续到每个人的生活态度里。最宽达二百五十米的护城河更像是一汪惬意的湖水，一艘脚踏船便荡出了和平年代的逍遥自在。</font></p>
            <div class="view-buttn mt-lg-4 mt-3">
              <a href="S_all.jsp" class=""><font color="#1E90FF">更多</font></a>
            </div>
          </div>
        </div>
        <!--// row -->
        <!-- row -->
        <div class="row">
          <div class="col-lg-7 col-md-6 collection-w3layouts">
            <h4>甘肃-敦煌</h4>
            <p class="mt-2"><font size="3">甘肃敦煌,一个承载着中国千年文化与故事的城市。<br>敦煌，除了丝路的商旅繁华，玄奘取经的圣迹传说，婀娜多姿的飞天，还流转着一番不为人知的千年芳华，那就是，在敦煌世代洞窟中，默默地住着三世三千个佛，它们见证了敦煌的荣辱盛衰，生生世世，不离不弃。<br>莫高窟现存洞窟中，几乎每一窟内都绘有千佛图，莫高窟也被称为千佛洞。千佛往往和佛陀说法的画面如影相随，通俗点来说，在一部制作精良的影片里，佛陀是主角，千佛就是当之无愧的黄金配角。红花当需绿叶配，这个不起眼的小角色，把佛陀以及佛法捧为佛国的一线明星。</font></p>
            <div class="view-buttn mt-lg-4 mt-3">
              <a href="S_all.jsp" class=" scroll"><font color="#1E90FF">更多</font></a>
            </div>
          </div>
          <div class="col-lg-5 col-md-6">
          <a href="S_all.jsp">
            <img src="F_images/S_dunhuang.jpg" alt="news image" class="img-fluid" style="width:570px; height:334px">
              </a>
          </div>
        </div>
        <!--// row -->
      </div>
    </section>
    <!-- collection -->
   
    <!-- footer -->
    <footer class="py-lg-4 py-md-3 py-sm-3 py-3">
    <%@ include file="footer.jsp" %>
    </footer>
    <!--//footer -->
  </body>
</html>