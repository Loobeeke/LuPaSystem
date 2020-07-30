<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发布</title>
<link rel = "stylesheet" href = "css/push.css" />
<link rel="stylesheet" href="assets/css/style.css" />
<link rel="stylesheet" href="assets/css/vendor.css" />
<script type="text/javascript" src="assets/js/active.js" ></script>
<script type="text/javascript" src="assets/js/vendor.js" ></script>
</head>

<body>
		<header class="header-area"style="left: 0;">
        <!-- main header start -->
        <div class="main-header d-none d-lg-block "style="top:100px;z-index:9;">
            <!-- header top start -->
            <div class="header-top bdr-bottom">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="welcome-message">
                                <p>欢迎来到路趴</p>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
            <!-- header top end -->

            <!-- header middle area start -->
            <div class="header-main-area sticky is-sticky "style="left:0;">
                <div class="container">
                    <div class="row align-items-center position-relative">

                        <!-- start logo area -->
                        <div class="col-lg-3">
                            <div class="logo">
                                <a href="index.jsp">
                                    <img src="assets/img/logo/lupa_logo_wid.png" alt="回到首页">
                                </a>
                            </div>
                        </div>
                        <!-- start logo area -->

                        <!-- main menu area start -->
                        <div class="col-lg-6 position-static">
                            <div class="main-menu-area">
                                <div class="main-menu">
                                    <!-- main menu navbar start -->
                                    <nav class="desktop-menu">
                                        <ul>
                                             <li><a href="#">首页</a></li>
                                                <li><a href="#">查询</a></li>
                                                <li><a href="#">约伴</a></li>
                                                <li><a href="#">商城</a></li>
                                                <li><a href="#">社交广场</a></li>
                                        </ul>
                                    </nav>
                                    <!-- main menu navbar end -->
                                </div>
                            </div>
                        </div>
                        <!-- main menu area end -->

                        <!-- mini cart area start -->
                        <div class="col-lg-3">
                            <div class="header-configure-wrapper">
                                <div class="header-configure-area">
                                    <ul class="nav justify-content-end">
                                        <li>
                                            <a href="#" class="offcanvas-btn">
                                                <i class="lnr lnr-magnifier"></i>
                                            </a>
                                        </li>
                                  
                                        <li>
                                        	<!--购物车商品数量-->
                                            <a href="#" class="minicart-btn">
                                                <i class="lnr lnr-cart"></i>
                                                <div class="notification">2</div>
                                            </a>
                                        </li>
                                        <li class="user-hover">
                                            <a href="#">
                                                <i class="lnr lnr-user"></i>
                                            </a>
                                            <ul class="dropdown-list">
                                                <li><a href="#">个人中心</a></li>
                                                <li><a href="#">订单中心</a></li>
                                                <li><a href="#">信息</a></li>
                                                <li><a href="#">退出登录</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- mini cart area end -->

                    </div>
                </div>
            </div>
            <!-- header middle area end -->
        </div>
        <!-- main header start -->

        <!-- mobile header start -->
        <div class="mobile-header d-lg-none d-md-block sticky">
            <!--mobile header top start -->
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="mobile-main-header">
                            <div class="mobile-logo">
                                <a href="index.html">
                                    <img src="assets/img/logo/logo.png" alt="Brand Logo">
                                </a>
                            </div>
                            <div class="mobile-menu-toggler">
                                <div class="mini-cart-wrap">
                                    <a href="#">
                                        <i class="lnr lnr-cart"></i>
                                    </a>
                                </div>
                                <div class="mobile-menu-btn">
                                    <div class="off-canvas-btn">
                                        <i class="lnr lnr-menu"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- mobile header top start -->
        </div>
        <!-- mobile header end -->
    </header>
         <div class="pushcontent">
			<form action="appointment?doGet" method="post" enctype="multipart/form-data">
				<h3 style="font-size: 30px;">发布约伴信息</h3>
				<div class="form-group">
					<label for="atitle">标题</label><br />
					<input type="text" name="atitle" style="width: 30%;height: 51px;" placeholder="请输入发布约伴的标题" />	
					<label for="aautor">发布人</label>
					<input type="text" name="aautor" style="width: 30%;height: 51px;" placeholder="请输入您的昵称" />	
					
				</div>
				<div class="form-group">
					<label for="acontent" class="taa">内容</label><br />
					<textarea input type="text" id="content" name = "acontent" placeholder="请输入约伴的内容" rows="10" cols="60"></textarea>
					<!-- <textarea rows="10" cols="60" name="acontent" id="content">请输入约伴的内容</textarea> -->
					<!--<input type="text" name="content" style="width: 300px;height: 33px;" placeholder="请输入发布约伴的内容" />-->
					
				</div>
				<div class="form-group">
					<label for="astartaddress">出发地</label><br />
					<input type="text" name="astartaddress" style="width: 417px;height: 51px;" placeholder="输入的地址越详细越好" />
					<label for="aphone">电话</label>
					<input type="text" name="aphone" style="width: 30%;height: 51px;" placeholder="请输入您的联系方式" />		
				</div>
				<div class="form-group">
					<label for="aendaddress">目的地</label><br />
					<input type="text" name="aendaddress" style="width: 417px;height: 51px;" placeholder="输入的地址越详细越好" />	
				</div>
				<div class="form-group">
					<label for="aprice">人均价格</label><br />
					<input type="text" name="aprice" style="width: 417px;height: 51px;"  />	
					<label for="atime">日期</label>
					<input type="text" name="atime" style="width: 417px;height: 51px;"  />	
				</div>
				<div class="form-group">
					<label for="apicture">图片</label><br />
					<input type="file" name="apicture" style="width: 417px;height: 51px;" placeholder="传入图片" />	
				</div>
				<input type="submit" value="提交"  id="sub-appoint"/>
			</form>
		</div>
  	 <div class="footer">
        <div class="clear"></div>
        <p class="copyright">
        	©LuPa 2020.<br>
            ALL RIGHTS RESERVED
        </p>
        
    </div> 	
     
</body>
<script type="text/javascript">
	function con(){
		var text = document.getElementById("content").value;
	}
</script>
</html>