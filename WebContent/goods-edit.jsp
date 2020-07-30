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
                <form class="layui-form" action="goods?action=updatelist" method="post" enctype="multipart/form-data">
	                <div class="layui-form-item">
                        <label for="gnumber" class="layui-form-label">
                            <span class="x-red">*</span>商品编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="gnumber" name="gnumber" required value="${good.gnumber }" readonly="readonly" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="gname" class="layui-form-label">
                            <span class="x-red">*</span>商品名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="gname" name="gname" required value="${good.gname }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="fstore" class="layui-form-label">
                            <span class="x-red">*</span>商店名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="gstore" name="gstore" required value="${good.gstore }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="gtype" class="layui-form-label">
                            <span class="x-red">*</span>类型</label>
                        <div class="layui-input-inline">
                            <select name="gtype" style="width:190px; height:30px; display:block;">
                                <option <c:if test="${good.gtype=='食品' }">selected</c:if> >食品</option>
                                <option <c:if test="${good.gtype=='日用品' }">selected</c:if> >日用品</option>
                                <option <c:if test="${good.gtype=='纪念品' }">selected</c:if> >纪念品</option>
                                <option <c:if test="${good.gtype=='服饰' }">selected</c:if> >服饰</option></select>
                        </div>
                    </div>
                   
                    <div class="layui-form-item">
                        <label for="gaddress" class="layui-form-label">
                            <span class="x-red">*</span>地址</label>
                        <div class="layui-input-inline">
                            <input type="text" id="gaddress" name="gaddress" required value="${good.getgaddress }" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                     <div class="layui-form-item">
                        <label for="gprice" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="gprice" name="gprice" required value="${good.getgprice }" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="gphone" class="layui-form-label">
                            <span class="x-red">*</span>手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="gphone" name="gphone" required value="${good.gphone }" lay-verify="phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
			        <div class="layui-form-item layui-form-text">
			            <label for="gintroduce" class="layui-form-label">美食介绍</label>
			            <div class="layui-input-block">
			                <textarea placeholder="请输入内容" id="gintroduce"  name="gintroduce" class="layui-textarea">
			                ${good.gintroduce}
			                </textarea>
			            </div>
			        </div>
			         <div class="layui-form-item">
                        <label for="gpicture1" class="layui-form-label">
                            <span class="x-red">*</span>商品图片</label>
                        <div class="layui-input-inline">
                            <img  id="gpicture1" name="gpicture1"  class="layui-input" style="width:190;height:100px;">
                            </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
                     <div class="layui-form-item">
                        <label for="gpicture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>更改图片</label>
                        <div class="layui-input-inline">
                            <input type="file" id="gpicture" name="gpicture" required required autocomplete="off" class="layui-input"> 
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
      		
      		var gnumber = '${param.gnumber}';
      		$.ajax({
				url:"goods",
				type:"post",
				data:{"gnumber":gnumber,"action":"toupdategoods"},
				dataType:"json",
				success:function(result){
					$("#gnumber").val(result.gnumber);
					$("#gname").val(result.gname);
					$("#gstore").val(result.gstore);
					$("#gtype").val(result.gtype);
					$("#gaddress").val(result.gaddress);
					$("#gprice").val(result.gprice);
					$("#gphone").val(result.gphone);
					$("#gintroduce").val(result.gintroduce);
					$("#gpicture1").attr("src",result.gpicture);
				
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
      		
      	})
      
      </script>
    </body>

</html>