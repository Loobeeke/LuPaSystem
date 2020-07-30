<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>约伴信息添加</title>
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
                <form class="layui-form" action="appointment?action=addappoint" method="post" enctype="multipart/form-data">
                    <!-- <div class="layui-form-item">
                        <label for="akid" class="layui-form-label">
                            <span class="x-red">*</span>编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="akid" name="akid" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div> -->
                    <div class="layui-form-item">
                        <label for="aautor" class="layui-form-label">
                            <span class="x-red">*</span>作者</label>
                        <div class="layui-input-inline">
                            <input type="text" id="aautor" name="aautor" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                   <div class="layui-form-item">
                        <label for="astartaddress" class="layui-form-label">
                            <span class="x-red">*</span>出发地</label>
                        <div class="layui-input-inline">
                            <input type="text" id="astartaddress" name="astartaddress" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                   
                    <div class="layui-form-item">
                        <label for="aendaddress" class="layui-form-label">
                            <span class="x-red">*</span>目的地</label>
                        <div class="layui-input-inline">
                            <input type="text" id="aendaddress" name="aendaddress" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="aphone" class="layui-form-label">
                            <span class="x-red">*</span>手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="aphone" name="aphone" required="" lay-verify="phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label for="aprice" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="aprice" name="aprice" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label for="atitle" class="layui-form-label">
                            <span class="x-red">*</span>标题</label>
                        <div class="layui-input-inline">
                            <input type="text" id="atitle" name="atitle" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
			        <div class="layui-form-item layui-form-text">
			            <label for="acontent" class="layui-form-label">内容</label>
			            <div class="layui-input-block">
			                <textarea placeholder="请输入内容" id="acontent" name="acontent" class="layui-textarea"></textarea>
			            </div>
			        </div>
			        <div class="layui-form-item">
                        <label for="atime" class="layui-form-label">
                            <span class="x-red">*</span>天数</label>
                        <div class="layui-input-inline">
                            <input type="text" id="atime" name="atime" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
			         <div class="layui-form-item">
                        <label for="apicture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>图片上传</label>
                        <div class="layui-input-inline" style="width:250px;">
                            <input type="file" id="apicture" name="apicture" required autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
			        <div class="layui-form-item">
			            <label for="L_repass" class="layui-form-label"></label>
			            <button class="layui-btn" id="add">增加</button>
			        </div>
		        </form>
	        </div>
        </div>
    
    </body>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#add").onclick(function(){
			
			$.ajax({
				url:"appointment",
				type:"post",
				data:{"action":"addappoint"},
				dataType:"text",
				success:function(result){
					if(result=='1'){
						window.location.href="appoint-list.jsp";
					}else{
						alert("添加失败，请稍微再试！");
					}
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
			
		})
		
	})

</script>
</html>