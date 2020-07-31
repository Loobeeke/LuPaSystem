<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>路趴-发动态</title>

<link rel="stylesheet" type="text/css" href="css/rbase.css">
<link rel="stylesheet" type="text/css" href="css/rhome.css">
<style type="text/css">
img{
 width: 100% ;
 height: 100%;
}


</style>
</head>
<body style="background-image: url(images/dynamic01.png); width: 100% ;height: 100%;">
<section class="aui-content">
	<div style="height:20px;"></div>
	<div class="aui-content-up">
		<form action="Dynamic?action=add" name="form1" method="post" role="form" enctype="multipart/form-data">
			<div class="aui-content-up-form">
				<h1>发布动态</h1>
			</div>
			<div class="aui-form-group clear">
				<label class="aui-label-control"for="dtitle">
					标题 <em>*</em>
				</label>
				<div class="aui-form-input">
					<input type="text" class="aui-form-control-two" name="dtitle" onBlur="checkna()" required id="1" placeholder="请输入资讯标题">
					<span class="tips" id="divname">长度1~6个字符</span>
				</div>
			</div>
			
			<div class="aui-form-group clear">
				<label class="aui-label-control"for="tcontent">
					动态内容<em>*</em>
				</label>
				<div class="aui-form-input">
					<textarea class="aui-form-control" name="dcontent" id="2" minlength="1" required onBlur="checkna1()"placeholder="请输入资讯内容..."></textarea>
					<span class="tips" id="count">内容不能为空</span>
				</div>
			</div>
			<div class="aui-form-group clear">
				<label class="aui-label-control"for="tpicture">
					照片 <em><5M</em>
					<span></span>
				</label>
				
				<div class="aui-form-input">
					<div class="aui-content-img-box aui-content-full">
						<div class="aui-photo aui-up-img clear">
							<section class="aui-file-up fl">
								
								<input type="file" id="dpicture" name="dpicture" >
							</section>
						</div>
					</div>
				</div>
				<div class="aui-form-input">
					<label class="aui-label-control"  for="tdate"></label>
					<input type="hidden"name="ddate"id="date">
				</div>
				<div class="aui-form-input">
					<label class="aui-label-control" for="dtime"></label>
					<input type="hidden"name="dtime"id="time">
				</div>
				<div class="aui-form-input">
					<%User user=(User)session.getAttribute("user"); %>
					<label class="aui-label-control" for="dautor"></label>
					<input type="hidden"name="dautor" value="<%=user.getUsername()%>">
				</div>
			</div>
			<div class="aui-form-group-text">
				<h3>请注意</h3>
				<p>发布信息不能包含但不限于以下范围：色情、暴力、恐怖主义、民族问题、诱导青少年犯罪等信息!</p>
			</div>
		
	<!-- <input type="hidden" name="action" value="add"> -->
	<div class="aui-btn-default"style="width: auto;">
	
		<button class="aui-btn aui-btn-account" id="reset"type="submit">确认发布</button>
		<button class="aui-btn aui-btn-account" id="cancel" >取消发布</button>
	</div>
	</form>
	</div>
</section>
<!-- mask begin -->
<div class="aui-mask aui-works-mask">
	<button class="aui-btn aui-btn-account">取消</button>
	<div class="aui-mask-content">
		<p class="aui-delete-text">确定要删除你上传的资料？</p>
		<p class="aui-check-text">
			<span class="aui-delete aui-accept-ok">确定</span>
			<span class="aui-accept-no">取消</span>
			
		</p>
	</div>
</div>


<!-- mask end -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/up.js"></script>
<script type="text/javascript">
	

	//验证姓名
	function checkna(){
		na=form1.yourname.value;
		if( na.length==0)
		{
			divname.innerHTML='<font class="tips_false">标题不能为空</font>';
		}else{
			divname.innerHTML='<font class="tips_true">输入正确</font>';
		}
	}
	//验证内容是否为空
	function checkna1(){
		na=form1.description.value;
		if( na.length <=0)
		{
			count.innerHTML='<font class="tips_false">请输入内容！</font>';

		}else{
			count.innerHTML='<font class="tips_true">格式正确</font>';
		}
	}
	
	//获取时间
		time = new Date();
		date = time.toLocaleDateString(); //获取当前日期
		nowtime=time.toLocaleTimeString(); //获取当前时间
		document.getElementById("date").value = date;
		document.getElementById("time").value = nowtime;
	
</script>
</body>
</html>