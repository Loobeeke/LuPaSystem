<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sgin.css" />
</head>
<body>
	<header id="header">

	        <div class="center">
		        <img src="img/heard.png" />

		        <nav class="link">
			        <ul>
				        <li class="active">
					    <a href="###">首页</a>
				        </li>
				        <li class="active">
					    <a href="yueban.jsp">约伴</a>
				        </li>
			        </ul>
		        </nav>
            </div>
        </header>
       <div class="main2">
			<div class="sign">
				
				<div class="act-apply-info">
					<ul class='act-apply-info-ul bg-fa' id='regContainer'>
						<li class="regItem">
							<h2>报名人信息</h2>
							<div class='infoname'>
								<h3><span>*</span>姓名</h3>
								
								<input type='text' name='name' class='txtName' value='' required='required' placeholder='姓名' />
							</div>
							<div class='info phone'>
								<h3><span>*</span>手机号码</h3>
								<input type='text' name='phone' class='txtPhone' value='' required='required' placeholder='手机号码' />
							</div>
							<div id="infocard">
								<h3><span>*</span>证件类型</h3>
								<select name='' required='required' class='selIDType'>
									<option selected='selected' value='0'>身份证</option>
									<option value='1'>护照</option>
									<option value='2'>军官证</option>
									<option value='3'>港澳居民内地通行证</option>
									<option value='4'>台湾居民大陆通行证</option>
								</select>
								<input type='text' name='cardNumber' class='txtCardNumber' value='' placeholder='证件号码' required='required' />
							</div>
							
		
							
							<div id="inforemark">
								<h3>备注</h3>
								<input type='text' name='remark' class='txtRemark' value='' />
							</div>
							
							<a href="javascript:void(0);" id="btn">展开</a>
						</li>
					</ul>
					<div class='act-apply-tip bg-fa'>
						
						<p>提示：为了成功购买保险，请填写真实的姓名及证件号码。</p>
						<div>
							<label><input type='checkbox' name='contact' id='IsAutoAddContact' checked='checked' />自动保存到联系人</label>
						</div>
					</div>
				</div>
				<div class="ICE">
					<h2 class='cl-f80'>紧急联系人信息</h2>
				   
					   <div class="1">姓名 <input type='text' id='ContactName' value='' class='txtEm_ContactName' /></div>
					   <div class="2">手机号码 <input type='text' id='ContactPhone' value='' class='txtEm_ContactPhone' /></div>
					   <div class="3">备注 <input type='text' id='ContactRemark' value='' class='txtEm_ContactRemark' /></div>
				  
				</div>
				<h2 class="cl-f80">报名须知</h2>
		        <div class="need">
		            1. 认同“安全、环保、自助”理念。遵从户外活动规则。<br>
		            2. 发扬团队协作精神，倡导自助与必要的互助相结合的户外理念。不擅自离开活动路线。<br>
		            3. 注意安全，不作无保护、无必要的攀爬、冒险。注意保持队伍行进紧凑，严防迷路和被打劫。<br>
		            4. 不乱丢垃圾，不破坏植被。注意环保，鼓励拾捡垃圾。做到“只留下你的脚印，只带走你的回忆”。<br>
		            5. 自行购买保险。出发前请把组织人的联系方式留给紧急联系人。<br>
		            6. 如果在活动中遇到异常情况，领队有权决定修改线路。
		            <p>
		                <input type="checkbox" checked="checked" name="" id="Auto" value="" />我已阅读并接受以上报名须知
		            </p>
		        </div>
		        <button type="submit" id="sub">提交报名信息</button>
		
			</div>
		</div>
		<div class="footer">
			<footer id="footer">
		    <div class="top sm-hidden">
		        <div class="block left">
		            <h2>合作伙伴</h2>
		            <hr>
		            <ul class="ul">
		                <li>途牛旅游网</li>
		                <li>驴妈妈旅游网</li>
		                <li>携程旅游</li>
		                <li>中国青年旅社</li>
		            </ul>
		        </div>
		
		        <div class="block center">
		            <h2>旅游FAQ</h2>
		            <hr>
		            <ul class="ul">
		                <li>旅游合同签订方式？</li>
		                <li>儿童价是基于什么制定的？</li>
		                <li>旅游的线路品质是怎么界定的？</li>
		                <li>旅游保险有些什么种类？</li>
		            </ul>
		        </div>
		        <div class="block right">
		            <h2>联系方式</h2>
		            <hr>
		            <ul class="ul">
		                <li>微博：weibo.com/maomi</li>
		                <li>邮件：sh@maomi.com</li>
		                <li>地址：西安市雁塔区xxx号</li>
		            </ul>
		        </div>
		    </div>
		    
		    
		</footer>
	</div>
</body>
	<script type="text/javascript">
		window.onload = function(){
			var hidendiv = document.getElementById("infocard");
			var beizhu = document.getElementById("inforemark");
			
			var btn = document.getElementById("btn");
			hflag = 1;
			btn.onclick = function(){
				if(hflag){
					hidendiv.style.display = "block";
					beizhu.style.display = "block";
					btn.innerHTML = "收起";
					hflag = 0;
					
				}else{
					hidendiv.style.display = "none";
					beizhu.style.display = "none";
					btn.innerHTML = "展开";
					hflag = 1;
				}
			}
		}
	</script>
		<script>
		function subsgin(){
			var sginname = document.getElementsByClassName('txtName').value;
			var sgintel = document.getElementsByClassName('txtPhone').value;
			var sgincard = document.getElementsByClassName('txtCardNumber').value;
			var beizhu = document.getElementsByClassName('txtRemark').value;
			var ICEname = document.getElementsById('ContactName').value;
			var ICEtel = document.getElementsById('ContactPhone').value;
			var ICEbeizhu = document.getElementsByClassName('ContactRemark').value;
			JdbcUtil jdbcUtil = new JdbcUtil();
		    jdbcUtil.insert_sgin(sginname, sgintel,sgincard,beizhu,ICEname,ICEtel,ICEbeizhu);
		}
	</script>
</script>
</html>