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
                <form class="layui-form" action="userinfo?action=update" method="post">
	                <div class="layui-form-item">
                        <label for="uname" class="layui-form-label">
                            <span class="x-red">*</span>姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="uname" name="uname" required value="${userinfo.uname }" readonly="readonly" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="uage" class="layui-form-label">
                            <span class="x-red">*</span>年龄</label>
                        <div class="layui-input-inline">
                            <input type="text" id="uage" name="uage" required value="${userinfo.uage }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label for="usex" class="layui-form-label">
                            <span class="x-red">*</span>性别</label>
                        <div class="layui-input-inline">
                            <select name="usex" id="usex" style="width:190px; height:30px; display:block;">
                                <option <c:if test="${userinfo.usex=='男' }">selected</c:if> >男</option>
                                <option <c:if test="${userinfo.usex=='女' }">selected</c:if> >女</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="uphone" class="layui-form-label">
                            <span class="x-red">*</span>手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="uphone" name="uphone" readonly required value="${userinfo.uphone }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="uaddress" class="layui-form-label">
                            <span class="x-red">*</span>地址</label>
                        <div class="layui-input-inline">
                            <input type="text" id="uaddress" name="uaddress" required value="${userinfo.uaddress }"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
			            <label for="uexplain" class="layui-form-label">个人信息</label>
			            <div class="layui-input-block">
			                <textarea placeholder="请输入内容" id="uexplain"  name="uexplain" class="layui-textarea">
			                ${userinfo.uexplain}
			                </textarea>
			            </div>
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
      		var uphone = '${param.uphone}';
      		$.ajax({
				url:"userinfo",
				type:"post",
				data:{"uphone":uphone,"action":"toupdate"},
				dataType:"json",
				success:function(result){
					$("#uname").val(result.uname);
					$("#uage").val(result.uage);
					$("#usex").val(result.usex);
					$("#uphone").val(result.uphone);
					$("#uaddress").val(result.uaddress);
					$("#uexplain").val(result.uexplain);
				},
				error:function(){
					alert("系统发生错误，请联系管理员！");
				}
			})
      		
      	})
      	
      
      </script>
    </body>

</html>