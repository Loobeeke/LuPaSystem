<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>header</title>

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="assets/img/logo/lupa_logo.png" type="image/x-icon" />

    <!-- Google fonts include -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear" rel="stylesheet">

    <!-- All Vendor & plugins CSS include -->
    <link href="assets/css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
	
    <!--[if lt IE 9]>
		<script src="/oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="/oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
<!-- Start Header Area -->
    <header class="header-area"style="left: 0;">
        <!-- main header start -->
        <div class="main-header d-none d-lg-block "style="top:100px;z-index:9;">
            <!-- header top start -->
            <div class="header-top bdr-bottom">
                <div class="container">
                    <div class="row align-items-center">
                       
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
                            <div class="logo" >
                                <a href="index1.jsp">
                                    <img src="assets/img/logo/lupa_logo_wid.png" alt="回到首页" >
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
                                         		<li><a href="guide-search.jsp">查询</a></li>
                                         		<li><a href="guide-shop.jsp">商城</a></li>
                                                <li><a href="Info?action=query">旅游资讯</a></li>
                                                <li><a href="appointment?action=query">约伴</a></li>
                                                <li><a href="Dynamic?action=query">社交广场</a></li>
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
                                        
                                        <!--<li>
                                            <a href="#">
                                                <i class="lnr lnr-heart"></i>
                                                <div class="notification">0</div>
                                            </a>
                                        </li>-->
                                        
                                        <li class="user-hover">
                                            <a href="#">
                                                <i class="lnr lnr-user"></i>
                                            </a>
                                            <ul class="dropdown-list">
                                                <li><a href="userinfoindex.jsp">完善个人信息</a></li>
                                                <li><a href="user?action=exit">退出登录</a></li>
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
    <!-- end Header Area -->

    <!-- off-canvas menu start -->
    
    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->

    <!-- All vendor & plugins & active js include here -->
    <!--All Vendor Js -->
 <!--   <script src="assets/js/vendor.js"></script>
    Active Js
    <script src="assets/js/active.js"></script>  -->
</body>
</html>