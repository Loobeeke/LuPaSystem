<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>酒店信息修改</title>
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
                <form class="layui-form" action="Hotel?action=updatehotel" method="post" enctype="multipart/form-data">
	                <div class="layui-form-item">
                        <label for="hnumber" class="layui-form-label">
                            <span class="x-red">*</span>编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="hnumber" name="hnumber" required value="${hotel.hnumber }" readonly="readonly" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="hname" class="layui-form-label">
                            <span class="x-red">*</span>酒店名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="hname" name="hname" required value="${hotel.hname }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text">
			            <label for="hdetail" class="layui-form-label">酒店详情</label>
			            <div class="layui-input-block">
			                <textarea placeholder="请输入内容" id="hdetail"  name="hdetail" class="layui-textarea">
			                ${hotel.hdetail}
			                </textarea>
			            </div>
			        </div>
			        
                    <div class="layui-form-item">
                        <label for="hprice" class="layui-form-label">
                            <span class="x-red">*</span>酒店价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="hprice" name="hprice" required value="${hotel.hprice }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                  
                     
                     <div class="layui-form-item">
                        <label for="haddress" class="layui-form-label">
                            <span class="x-red">*</span>酒店地址</label>
                        <div class="layui-input-inline">
                            <input type="text" id="haddress" name="haddress" value="${hotel.haddress }" required autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="htype" class="layui-form-label">
                            <span class="x-red">*</span>酒店类型</label>
                        <div class="layui-input-inline">
                            <input type="text" id="htype" name="htype" value="${hotel.htype }" required autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="hphone" class="layui-form-label">
                            <span class="x-red">*</span>手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="hphone" name="hphone" required value="${hotel.hphone }" lay-verify="phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
			         <div class="layui-form-item">
                        <label for="hpicture" class="layui-form-label">
                            <span class="x-red">*</span>图片展示</label>
                        <div class="layui-input-inline">
                            <%-- <input type="text" id="fpicture" name="fpicture" required src=${food.fpicture } lay-verify="required" autocomplete="off" class="layui-input"> --%>
                            <img  id="hpicture1" name="hpicture1"  class="layui-input" style="width:190;height:100px;">
                            </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span></div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="hpicture" class="layui-form-label" style="width:150px;">
                            <span class="x-red">*</span>更改图片</label>
                        <div class="layui-input-inline" style="width:250px;">
                            <input type="file" id="hpicture" name="hpicture" rautocomplete="off" class="layui-input"></div>
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
      		var hnumber = '${param.hnumber}';
      		$.ajax({
				url:"Hotel",
				type:"post",
				data:{"hnumber":hnumber,"action":"toupdate"},
				dataType:"json",
				success:function(result){
					$("#hnumber").val(result.hnumber);
					$("#hname").val(result.hname);
					$("#hdetail").val(result.hdetail);
					$("#hprice").val(result.hprice);
					$("#haddress").val(result.haddress);
					$("#htype").val(result.htype);
					$("#hphone").val(result.hphone);
					$("#hpicture1").attr("src",result.hpicture);
				
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
      		
      	})
      	
      
      </script>
    </body>

</html>