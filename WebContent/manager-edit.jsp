<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>美食信息修改</title>
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
        	<%-- <%
				Food food = (Food)request.getAttribute("food");
			%> --%>
            <div class="layui-row">
                <form class="layui-form" action="manager?action=updatemanager" method="post" enctype="multipart/form-data">
	                <div class="layui-form-item">
                        <label for="mid" class="layui-form-label">
                            <span class="x-red">*</span>编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="mid" name="mid" required value="${manager.mid }" readonly="readonly" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="mname" class="layui-form-label">
                            <span class="x-red">*</span>账号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="mname" name="mname" required value="${manager.mname }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
			        
                    <div class="layui-form-item">
                        <label for="mpassword" class="layui-form-label">
                            <span class="x-red">*</span>密码</label>
                        <div class="layui-input-inline">
                            <input type="text" id="mpassword" name="mpassword" required value="${manager.mpassword }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="mpicture1" class="layui-form-label">
                            <span class="x-red">*</span>图片</label>
                        <div class="layui-input-inline">
                            <%-- <input type="text" id="apicture" name="apicture" required src=${food.fpicture } lay-verify="required" autocomplete="off" class="layui-input"> --%>
                            <img  id="mpicture1" name="mpicture1"  class="layui-input" style="width:190;height:100px;">
                            </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="mpicture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>更改图片</label>
                        <div class="layui-input-inline">
                            <input type="file" id="mpicture" name="mpicture" required autocomplete="off" class="layui-input"> 
                            </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
                  
                    <%--  value="${food.fpicture }" --%>
			        <div class="layui-form-item">
			            <label for="L_repass" class="layui-form-label"></label>
			            <button class="layui-btn">确认修改</button>
			        </div>
		        </form>
	        </div>
        </div>
      <script type="text/javascript" src="js/jquery-1.8.2.js"></script>  
      <script type="text/javascript">
      	$(function(){
      		var mid = '${param.mid}';
      		$.ajax({
				url:"manager",
				type:"post",
				data:{"mid":mid,"action":"toupdate"},
				dataType:"json",
				success:function(result){
					$("#mid").val(result.mid);
					$("#mname").val(result.mname);
					$("#mpassword").val(result.mpassword);
					$("#mpicture1").attr("src",result.mpicture);
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
      		
      	})
      	
      
      </script>
    </body>

</html>