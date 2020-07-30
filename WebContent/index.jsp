<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>路趴后台登录</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./index.html">路趴后台管理</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${sessionScope.manager.mname }</a>
                    
                </li>
                <li class="layui-nav-item to-index">
                    <a href="index1.jsp">前台首页</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="用户信息管理">&#xe723;</i>
                            <cite>用户信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('用户信息列表','personal-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>用户信息列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="酒店信息管理">&#xe723;</i>
                            <cite>酒店信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('酒店信息列表','hotel-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>酒店信息列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                   <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="门票信息管理">&#xe723;</i>
                            <cite>门票信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('门票信息列表','ticket-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>门票信息列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="美食信息管理">&#xe723;</i>
                            <cite>美食信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('美食信息列表','food-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>美食信息列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="商品信息管理">&#xe723;</i>
                            <cite>商品信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('商品信息列表','goods-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>商品信息列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="旅游信息管理">&#xe723;</i>
                            <cite>旅游资讯</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('旅游资讯列表','travel-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>旅游资讯列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="约伴信息管理">&#xe723;</i>
                            <cite>约伴信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('约伴信息列表','appoint-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>约伴信息列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="用户动态管理">&#xe723;</i>
                            <cite>用户动态管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('旅游资讯列表','dynamic-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>用户动态列表</cite></a>
                            </li>
                       
                        </ul>
                    </li>
                  
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a  onclick="xadmin.add_tab('管理员列表','manager-list.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite></a>
                            </li>
                           
                    </li>
                    
                   
                  
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='./welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
       <!--  <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script> -->
    </body>

</html>