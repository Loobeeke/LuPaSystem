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
                <form class="layui-form" action="Dynamic?action=addlist" method="post" enctype="multipart/form-data">
                    <div class="layui-form-item">
                        <label for="dautor" class="layui-form-label">
                            <span class="x-red">*</span>作者</label>
                        <div class="layui-input-inline">
                            <input type="text" id="dautor" name="dautor" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="dtitle" class="layui-form-label">
                            <span class="x-red">*</span>标题</label>
                        <div class="layui-input-inline">
                            <!-- <input type="text" id="theading" name="theading" required="" lay-verify="required" autocomplete="off" class="layui-input"> -->
                             <textarea placeholder="请输入内容" id="dtitle" name="dtitle" class="layui-textarea"></textarea>
                        </div>
                    </div>
                 
                    <div class="layui-form-item">
                        <label for="dcontent" class="layui-form-label">
                            <span class="x-red">*</span>内容</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容" id="dcontent" name="dcontent" class="layui-textarea"></textarea>
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label for="ddate" class="layui-form-label">
                            <span class="x-red">*</span>日期</label>
                        <div class="layui-input-inline">
                            <input type="text" id="ddate" name="ddate" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="dtime" class="layui-form-label">
                            <span class="x-red">*</span>时间</label>
                        <div class="layui-input-inline">
                            <input type="text" id="dtime" name="dtime" required autocomplete="off" class="layui-input">
                        </div>
                    </div>
                   
			         <div class="layui-form-item">
                        <label for="dpicture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>图片上传</label>
                        <div class="layui-input-inline" style="width:250px;">
                            <input type="file" id="dpicture" name="dpicture" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
			        <div class="layui-form-item">
			            <label for="L_repass" class="layui-form-label"></label>
			           <!--  <input type="hidden" name="action" value="addlist"> -->
			            <button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
			        </div>
		        </form>
	        </div>
        </div>
    
    </body>
<script type="text/javascript">  
    //获取时间
		time = new Date();
		date = time.toLocaleDateString(); //获取当前日期
		nowtime=time.toLocaleTimeString(); //获取当前时间
		document.getElementById("ddate").value = date;
		document.getElementById("dtime").value = nowtime;
</script>
</html>