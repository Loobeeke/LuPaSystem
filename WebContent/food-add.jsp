<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>美食信息添加</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]--></head>
    
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" action="foodpage?action=addfood" method="post" enctype="multipart/form-data">
                    <div class="layui-form-item">
                        <label for="fname" class="layui-form-label">
                            <span class="x-red">*</span>美食名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fname" name="fname" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="fstore" class="layui-form-label">
                            <span class="x-red">*</span>餐馆名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fstore" name="fstore" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="ftype" class="layui-form-label">
                            <span class="x-red">*</span>类型</label>
                        <div class="layui-input-inline">
                            <select name="ftype" style="width:190px; height:30px; display:block;">
                                <option>火锅</option>
                                <option>小吃</option>
                                <option>家常菜</option>
                                <option>炸鸡</option>
                             </select>
                        </div>
                    </div>
                   
                    <div class="layui-form-item">
                        <label for="faddress" class="layui-form-label">
                            <span class="x-red">*</span>地址</label>
                        <div class="layui-input-inline">
                            <input type="text" id="faddress" name="faddress" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label for="fprice" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fprice" name="fprice" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="fphone" class="layui-form-label">
                            <span class="x-red">*</span>手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fphone" name="fphone" required="" lay-verify="phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
			        <div class="layui-form-item layui-form-text">
			            <label for="fintroduce" class="layui-form-label">美食介绍</label>
			            <div class="layui-input-block">
			                <textarea placeholder="请输入内容" id="fintroduce" name="fintroduce" class="layui-textarea"></textarea>
			            </div>
			        </div>
			         <div class="layui-form-item">
                        <label for="fpicture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>美食图片上传</label>
                        <div class="layui-input-inline" style="width:250px;">
                            <input type="file" id="fpicture" name="fpicture" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
			        <div class="layui-form-item">
			            <label for="L_repass" class="layui-form-label"></label>
			            <button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
			        </div>
		        </form>
	        </div>
        </div>
    
    </body>

</html>