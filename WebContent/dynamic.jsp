<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,com.model.*,com.servlet.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link rel=stylesheet href="css/common.css">
<link rel=stylesheet href="css/jdc-side-panel.css">
<title>用户旅游动态</title>
</head>
<body>
<header style="top:100px;">

<%@include file="header2.jsp" %>
</header>
	
<div class="banner"style="margin-top:80px;">
</div>

<article>
   <h2 class="title_tj">
    <p>文章<span>推荐</span></p>
  </h2>
  <div class="bloglist left">
  		
  		<c:forEach items="${dynamic}" var="dynamic">
  		<h3>${ dynamic.getDtitle()} </h3>
	    <figure><img src="${ dynamic.getDpicture()}"></figure>
	    <ul>
	      <p>${ dynamic.getDcontent()}</p>
	      <a title="${ dynamic.getDtitle()}" href="/" target="_blank" class="readmore">阅读全文>></a>
	    </ul>
	    <p class="dateview"><span>${ dynamic.getDdate()}</span><span>发布时间：[${ dynamic.getDtime()}]</span><span>作者：${ dynamic.getDautor()}</span></p>
  		
	  </c:forEach>
	   ${pageTool}
	 </div>
	
		
  <aside class="right">
  		 <h3>
      <p>本地<span>天气</span></p>
    </h3>
    <div class="weather">
    	<iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
    <div class="news">
    <h3>
      <p>旅游<span>资讯</span></p>
    </h3>
    <ul class="rank">
      <li><a href="https://news.cncn.com/291641.html" title="文旅部发布旅行社有序恢复经营疫情防控措施指南" target="_blank">有序恢复经营疫情防控措施指南</a></li>
      <li><a href="https://news.cncn.com/291642.html" title="文化和旅游部发布通知，有条件恢复跨省团队游" target="_blank">旅游部发布有条件恢复跨省团队游</a></li>
      <li><a href="https://news.cncn.com/291596.html" title="中国旅游蓄势待发" target="_blank">中国旅游蓄势待发</a></li>
      <li><a href="https://news.cncn.com/291716.html" title="2人去云南旅游5天多少钱？?" target="_blank">2人去云南旅游5天多少钱？?</a></li>
      <li><a href="https://news.cncn.com/291708.html" title="峨眉山和乐山大佛景区最大接待量调至最大承载量50％" target="_blank">峨眉山和乐山大佛景区承载量50％</a></li>
      <li><a href="https://news.cncn.com/291532.html" title="7月8日起长沙橘子洲景区闭园时间调整至18时" target="_blank">长沙橘子洲景区闭园时间调整至18时</a></li>
      <li><a href="https://news.cncn.com/291704.html" title="2020年“大美吉林，悦动消夏”全省广场文化活动拉开帷幕" target="_blank">2020年“大美吉林，悦动消夏”拉开帷幕</a></li>
      <li><a href="https://news.cncn.com/291531.html" title="龙宫景区今日因水位上涨暂停售票及乘船游览" target="_blank">龙宫景区今日因水位上涨暂停售票</a></li>
    </ul>
    <h3 class="ph">
      <p>热点<span>资讯</span></p>
    </h3>
    <ul class="paih">
      <li><a href="https://news.cncn.com/291334.html" title="黄腾峡空中玻璃 T台汉服秀精彩上演" target="_blank">黄腾峡空中玻璃 T台汉服秀精彩上演</a></li>
      <li><a href="https://news.cncn.com/291372.html" title="福建德化：发力全域旅游，撬动山城活力" target="_blank">福建德化：发力全域旅游，撬动山城活力</a></li>
      <li><a href="https://news.cncn.com/291518.html" title="广西开展旅游景区安全应急演练" target="_blank">广西开展旅游景区安全应急演练</a></li>
      <li><a href="https://news.cncn.com/291334.html" title="黄腾峡空中玻璃 近期不宜出国旅行或旅游" target="_blank">近期不宜出国旅行或旅游</a></li>
      <li><a href="https://news.cncn.com/291371.html" title="7月15日起，九江19个景区暑期对全国学子免门票" target="_blank">九江19个景区暑期对全国学子免门票</a></li>
    </ul>
  
    </div>  
   </aside>
  <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
    <script type="text/javascript" id="bdshell_js"></script> 


<div class="jdc-side" style="display: block;">
  <div class="mod_hang_qrcode jdc_feedback_qrcode">
    <a href="resertDynamic.jsp"><div class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>发布动态</span></div></a>
    
     <div class="mod_hang_qrcode_show">
      
      <div class="mod_hang_qrcode_show_bg">
        <div id="canvas" style="height: 123px; width: 123px;"><img src="images/re.png"width="100%" height="150%"></div>
      </div><br />
      <p>发布动态</p>
    </div>
  </div>
 
  <div class="mod_hang_qrcode jdc_hang_qrcode"><a class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>扫码反馈</span></a>
    <div class="mod_hang_qrcode_show">
      <div class="mod_hang_qrcode_show_bg"></div>
      <p>扫码与客服反馈</p>
    </div>
  </div>
  <div class="mod_hang_qrcode mod_hang_top"><a href="#" class="mod_hang_qrcode_btn"><i class="jdcfont"></i><span>返回顶部</span></a></div>
  <div class="el-dialog__wrapper" style="display: none;">
    <div class="el-dialog el-dialog--small" style="top: 15%;">
      <div class="el-dialog__header"><span class="el-dialog__title"></span>
        <div type="button" class="el-dialog__headerbtn"><i class="el-dialog__close el-icon el-icon-close"></i></div>
      </div>
      </div>
  </div>
  
</div>
</article>
<footer>
 <%@ include file="footer.jsp" %>
</footer>
<script src="js/silder.js"></script>
</body>
</html>