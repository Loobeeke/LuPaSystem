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
                <form class="layui-form" action="foodpage?action=updatelist" method="post" enctype="multipart/form-data">
	                <div class="layui-form-item">
                        <label for="fnumber" class="layui-form-label">
                            <span class="x-red">*</span>美食编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fnumber" name="fnumber" required value="${food.fnumber }" readonly="readonly" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="fname" class="layui-form-label">
                            <span class="x-red">*</span>美食名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fname" name="fname" required value="${food.fname }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="fstore" class="layui-form-label">
                            <span class="x-red">*</span>餐馆名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fstore" name="fstore" required value="${food.fstore }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="ftype" class="layui-form-label">
                            <span class="x-red">*</span>类型</label>
                        <div class="layui-input-inline">
                            <select name="ftype" style="width:190px; height:30px; display:block;">
                                <option <c:if test="${food.ftype=='火锅' }">selected</c:if> >火锅</option>
                                <option <c:if test="${food.ftype=='小吃' }">selected</c:if> >小吃</option>
                                <option <c:if test="${food.ftype=='家庭菜' }">selected</c:if> >家庭菜</option>
                                <option <c:if test="${food.ftype=='炸鸡' }">selected</c:if> >炸鸡</option></select>
                        </div>
                    </div>
                   
                    <div class="layui-form-item">
                        <label for="faddress" class="layui-form-label">
                            <span class="x-red">*</span>地址</label>
                        <div class="layui-input-inline">
                            <input type="text" id="faddress" name="faddress" required value="${food.faddress }" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label for="fprice" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fprice" name="fprice" required value="${food.fprice }" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="fphone" class="layui-form-label">
                            <span class="x-red">*</span>手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="fphone" name="fphone" required value="${food.fphone }" lay-verify="phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
			        <div class="layui-form-item layui-form-text">
			            <label for="fintroduce" class="layui-form-label">美食介绍</label>
			            <div class="layui-input-block">
			                <textarea placeholder="请输入内容" id="fintroduce"  name="fintroduce" class="layui-textarea">
			                ${food.fintroduce}
			                </textarea>
			            </div>
			        </div>
			         <div class="layui-form-item">
                        <label for="fpicture1" class="layui-form-label">
                            <span class="x-red">*</span>美食图片</label>
                        <div class="layui-input-inline">
                            <%-- <input type="text" id="fpicture" name="fpicture" required src=${food.fpicture } lay-verify="required" autocomplete="off" class="layui-input"> --%>
                            <img  id="fpicture1" name="fpicture1"  class="layui-input" style="width:190;height:100px;">
                            </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="fpicture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>更改图片</label>
                        <div class="layui-input-inline">
                            <input type="file" id="fpicture" name="fpicture" required required autocomplete="off" class="layui-input"> 
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
      		//request.getParameter("fnumber")
      		/* alert(fnumber)
      		$("#fintroduce").val('q312121');
      		$("#fnumber").val(fnumber); */
      		
      		var fnumber = '${param.fnumber}';
      		$.ajax({
				url:"foodpage",
				type:"post",
				data:{"fnumber":fnumber,"action":"toupdate"},
				dataType:"json",
				success:function(result){
					$("#fnumber").val(result.fnumber);
					$("#fname").val(result.fname);
					$("#fstore").val(result.fstore);
					$("#ftype").val(result.ftype);
					$("#faddress").val(result.faddress);
					$("#fprice").val(result.fprice);
					$("#fphone").val(result.fphone);
					$("#fintroduce").val(result.fintroduce);
					$("#fpicture1").attr("src",result.fpicture);
				
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
      		
      	})
      
      </script>
    </body>

</html>