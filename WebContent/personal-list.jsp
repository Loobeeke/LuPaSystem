<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>用户信息列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
    </head>
    
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input type="text" id="theading" name="theading" placeholder="请输入账号" autocomplete="off" class="layui-input"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <button class="layui-btn" id="search" >
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <!-- <button class="layui-btn layui-btn-danger" onclick="delAll()">
                                <i class="layui-icon"></i>批量删除</button> -->
                            <button class="layui-btn" onclick="xadmin.open('添加管理员信息','./personal-add.jsp',800,600)">
                                <i class="layui-icon"></i>添加</button></div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                                <thead>
                                    <tr>
                                        <th>姓名</th>
										<th>年龄</th>
										<th>性别</th>
										<th>手机号</th>
										<th>地址</th>
										<th>个人介绍</th>
                                        <th>操作</th></tr>
                                </thead>
                                <tbody class="foodlsit">
                                    
                                   <%--  <c:forEach items="${foods}" var="food">
										<tr>
											<td>
	                                            <input type="checkbox" name="" lay-skin="primary">
	                                        </td>
											<td>${food.fnumber}</td>
											<td>${food.fname}</td>
											<td>${food.fstore}</td>
											<td>${food.ftype}</td>
											<td>${food.faddress}</td>
											<td>${food.fprice}</td>
											<td>${food.fphone}</td>
											<td>${food.fintroduce}</td>
											<td>${food.fpicture}</td>
											<td class="td-manage">
											   <!--  如果点击的时候就弹出页面  需要在food-edit。jsp  发送ajax请求获取数据 -->
	                                            <a title="修改" onclick="xadmin.open('编辑','food-edit.jsp')" href="foodpage?action=toupdate&fnumber=${food.fnumber }">
	                                                <i class="layui-icon">&#xe63c;</i></a>
	                                            <a title="删除"  href="foodpage?action=delete&fnumber=${food.fnumber }">
	                                                <i class="layui-icon">&#xe640;</i></a>
	                                                <!-- onclick="member_del(this,'要删除的id')" -->
                                        	</td>
										</tr>
									</c:forEach> --%>
                                </tbody>
                            </table>
                        </div>
                      
                       <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                    <a class="prev" href="">&lt;&lt;</a>
                                    <a class="num" href="">1</a>
                                    <span class="current">2</span>
                                    <a class="num" href="">3</a>
                                    <a class="num" href="">489</a>
                                    <a class="next" href="">&gt;&gt;</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script>
      
       
       	$(function(){
       		
    			$.ajax({
    				url:"userinfo",
    				type:"post",
    				data:{"action":"userinfolist"},
    				dataType:"json",
    				success:function(result){
    					console.log(result)
    					$(".layui-table").html("");
    					$.each(result,function(index,item){
    						$(".layui-table").append(`
									<tr>
										<td>`+item.uname+`</td>
										<td>`+item.uage+`</td>
										<td>`+item.usex+`</td>
										<td>`+item.uphone+`</td>
										<td>`+item.uaddress+`</td>
										<td>`+item.uexplain+`</td>
										<td class="td-manage">
										   <!--  如果点击的时候就弹出页面  需要在food-edit。jsp  发送ajax请求获取数据 -->
                                            <div class="layui-btn-group">
	                                        	<button type="button" onclick="xadmin.open('编辑','personal-edit.jsp?uphone=`+item.uphone+`')" class="layui-btn ">修改</button>
	                                            <button type="button" href="userinfo?action=delete&uphone=`+item.uphone+`" class="layui-btn">删除</button>
	                                         </div>
	                                	</td>
									</tr>
								`)	
    					})
    				},
    				error:function(){
    					alert("系统发生错误，请联系管理员！");
    				}
    			})
    			
    			/* $("#search").onclick(function(){
    				$.ajax({
        				url:"Info",
        				type:"post",
        				data:{"theading":$("#theading").val(),"action":"travellist"},
        				dataType:"json",
        				success:function(result){
        					console.log(result)
        					$(".layui-table").html("");
        					$.each(result,function(index,item){
        						$(".layui-table").append(`
    									<tr>
    										<td>`+item.tnumber+`</td>
    										<td>`+item.tauthor+`</td>
    										<td>`+item.theading+`</td>
    										<td>`+item.tcontent+`</td>
    										<td>`+item.tdate+`</td>
    										<td>`+item.ttime+`</td>
    										<td><img src='`+item.tpicture+`'/></td>
    										<td class="td-manage">
    										   <!--  如果点击的时候就弹出页面  需要在food-edit。jsp  发送ajax请求获取数据 -->
    	                                        <a title='修改' onclick="xadmin.open('编辑','travel-edit.jsp?tnumber=`+item.tnumber+`')" >
    	                                            <i class="layui-icon">&#xe63c;</i></a>
    	                                        <a title="删除" href="Info?action=delete&tnumber=`+item.tnumber+`" >
    	                                            <i class="layui-icon">&#xe640;</i></a>
    	                                	</td>
    									</tr>
    								`)	
        					})
        				},
        				error:function(){
        					alert("系统发生错误，请联系管理员！");
        				}
        			})
    			}) */
       		
       	})

        </script>

</html>