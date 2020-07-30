<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>门票信息修改</title>
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
                <form class="layui-form" action="Tickets?action=updatetickets" method="post" enctype="multipart/form-data">
	                <div class="layui-form-item">
                        <label for="id" class="layui-form-label">
                            <span class="x-red">*</span>编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="id" name="id" required value="${ticket.id }" readonly="readonly" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="name" class="layui-form-label">
                            <span class="x-red">*</span>门票名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="name" name="name" required value="${ticket.name }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text">
			            <label for="detail" class="layui-form-label">门票详情</label>
			            <div class="layui-input-block">
			                <textarea placeholder="请输入内容" id="detail"  name="detail" class="layui-textarea">
			                ${ticket.detail}
			                </textarea>
			            </div>
			        </div>
			        
                    <div class="layui-form-item">
                        <label for="price" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="price" name="price" required value="${ticket.price }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                  
                     
                     <div class="layui-form-item">
                        <label for="oldprice" class="layui-form-label">
                            <span class="x-red">*</span>原价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="oldprice" name="oldprice" value="${ticket.oldprice }" required autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="stock" class="layui-form-label">
                            <span class="x-red">*</span>库存量</label>
                        <div class="layui-input-inline">
                            <input type="text" id="stock" name="stock" value="${ticket.stock }" required autocomplete="off" class="layui-input">
                        </div>
                    </div>
			         <div class="layui-form-item">
                        <label for="picture" class="layui-form-label">
                            <span class="x-red">*</span>图片展示</label>
                        <div class="layui-input-inline">
                            <%-- <input type="text" id="fpicture" name="fpicture" required src=${food.fpicture } lay-verify="required" autocomplete="off" class="layui-input"> --%>
                            <img  id="picture1" name="picture1"  class="layui-input" style="width:190;height:100px;">
                            </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="picture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>更改图片</label>
                        <div class="layui-input-inline" style="width:250px;">
                            <input type="file" id="picture" name="picture" rautocomplete="off" class="layui-input"></div>
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
      		var id = '${param.id}';
      		$.ajax({
				url:"Tickets",
				type:"post",
				data:{"id":id,"action":"toupdate"},
				dataType:"json",
				success:function(result){
					$("#id").val(result.id);
					$("#name").val(result.name);
					$("#detail").val(result.detail);
					$("#price").val(result.price);
					$("#oldprice").val(result.oldprice);
					$("#stock").val(result.stock);
					$("#picture1").attr("src",result.picture);
				
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
      		
      	})
      	
      
      </script>
    </body>

</html>