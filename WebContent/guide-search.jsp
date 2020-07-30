<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="zh-CN" id="bgimg">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<meta name="baidu_union_verify" content="84a16d6239c2064e1bbeb4808518e86b">
<title>路趴信息查询</title>

<link rel="icon" href="" mce_href="/dir/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="https://www.bootcss.com/p/buttons/css/buttons.css">
<link rel="stylesheet" type="text/css" href="https://www.bootcss.com/p/buttons/css/showcase.css">

<meta name="referrer" content="no-referrer" />
<script type="text/javascript">

var omitformtags=["input", "textarea", "select"]

omitformtags=omitformtags.join("|")

function disableselect(e){ 
if (omitformtags.indexOf(e.target.tagName.toLowerCase())==-1) 
return false 
}

function reEnable(){ 
return true 
}

if (typeof document.onselectstart!="undefined") 
document.onselectstart=new Function ("return false") 
else{ 
document.onmousedown=disableselect 
document.onmouseup=reEnable 
} 
</script>

<script> 
function stop(){ 
return false; 
} 
document.oncontextmenu=stop; 

	function click(e) {
		if (document.layers) {
			if (e.which == 3) {
				oncontextmenu='return false';
			}
		}
	}
	if (document.layers) {
		document.captureEvents(Event.MOUSEDOWN);
	}
	document.onmousedown=click;
	document.oncontextmenu = new Function("return false;")
	document.onkeydown =document.onkeyup = document.onkeypress=function(){ 
		if(window.event.keyCode == 123) { 
			window.event.returnValue=false;
			return(false); 
		} 
	}
</script>

<script type="text/javascript">
	function change(){
		var bodyBgs = [];
		bodyBgs[0] = "gui/images/F_01.jpg";
		bodyBgs[1] = "gui/images/F_07.jpg";
		bodyBgs[2] = "gui/images/G_09.JPG";
		bodyBgs[3] = "gui/images/G_10.JPG";
		
		
//注意 bodyBgs[50] 50是当前序号, 按照顺序添加或删除即可, 但是序号必须是连续的

		//bodyBgs[] = "";

		var randomBgIndex = Math.round( Math.random() * 3);//这里的10是随机取值范围, 取最后一个 bodyBgs[*] 的值即可
		//document.write('<style>html{background-image:url(' + bodyBgs[randomBgIndex] + ')}</style>');
		var img1= document.getElementById('bgimg');
		img1.style.backgroundImage='url(' + bodyBgs[randomBgIndex] + ')';
	        window.setTimeout(function(){change()},1000);//图片切换时间 1000=1s
	}
	change();
</script>
<style>
/* basic styles for black background and crosshair cursor */
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-o-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box
}

html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video {
	margin: 0;
	padding: 0;
	border: 0;
	font-style: normal;
	font-weight: normal;
	font-size: 100%;
	vertical-align: baseline;
}

article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section {
	display: block
}

blockquote,q {
	quotes: none
}

blockquote:before,blockquote:after,q:before,q:after {
	content: '';
	content: none
}

input,textarea {
	margin: 0;
	padding: 0
}

ol,ul {
	list-style: none
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

caption,th {
	text-align: left
}

a:focus {
	outline: 0
}

html {
	position: relative;
	width: 100%;
	height: 100%;
	font-family: Microsoft YaHei,sans-serif;
	z-index: 1;
	line-height: 1.5;
	background-color: #121925;
	font-weight: 300;
	background-size: cover;
	background-position: 50% 50%;
	background-attachment: fixed;
	-webkit-transition: .5s linear;
	-moz-transition: .5s linear;
	-o-transition: .5s linear;
	transition: .5s linear;
	/*overflow:hidden*/
}

body{
	position: relative;
	width: 100%;
	height: 100%;
	min-width: 300px;
	z-index: 2;
	cursor:url('./style/default.cur'), url(./style/default.cur), auto;
}
body:before {
  content: ' ';
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: url(./style/mask.png) center 0 repeat;
}
a {
	color: #858585;
	text-decoration:none;
	cursor: url('./style/hand.cur'), url(./style/hand.cur), auto;
}

a:hover {
	color: #00b3ba
}

b {
	background-color: rgba(0,179,186,0.4)
}

::selection {
	background: #00b3ba
}

::-moz-selection {
	background: #00b3ba
}

.top_hr_style01 {
	width: 70%;
	margin: 5px auto;
	border: 0;
	border-bottom: 1px solid #fff
}

.top_hr_style02 {
	border: 0;
	border-bottom: 1px dashed #858585
}

.slider {
	width: 100%;
	height: 150px;
	-webkit-transition: .2s ease;
	-moz-transition: .2s ease;
	-o-transition: .2s ease;
	transition: .2s ease;
	background-image: url(./img/topBG.jpg);
	background-color: #121925;
	background-size: cover;
	background-position: 50% 50%;
	background-attachment: fixed
}

#top {
	width: 100%;
	height: 100%;
	position: relative;
	margin: auto;
	z-index: 11
}

#top_img {
	width: 100%;
	height: 100%;
	position: relative;
	background-image: url(./img/topBG.jpg);
	background-color: #121925;
	background-size: cover;
	background-position: 50% 50%;
	background-attachment: fixed;
	z-index: 11
}

#top_main {
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	padding: 40px 0 10px 0
}

#top_logo {
	height: 30%;
	min-height: 50px;
	max-height: 244px;
	display: block
}

#top_logo img {
	-webkit-animation: A 15s linear 0s infinite;
	animation: A 15s linear 0s infinite;
	margin-right: auto;
	margin-left: auto;
	display: block;
	height: 100%
}

@-webkit-keyframes A {
	0% {
		-webkit-transform: rotate(0deg)
	}

	100% {
		-webkit-transform: rotate(360deg)
	}
}

@keyframes A {
	0% {
		transform: rotate(0deg)
	}

	100% {
		transform: rotate(360deg)
	}
}

#top_title {
	text-align: center;
	padding-top: 15px;
	display: block;
	height: 10%
}

#top_title img {
	margin-right: auto;
	margin-left: auto;
	display: block
}

#top_title #top_title01 {
	height: 83%;
	max-height: 59px;
	min-height: 30px
}

#top_title #top_title02 {
	height: 9px
}
#top_title #top_title02:hover{
	background:rgba(0,0,0,0.8);
}
#top_navlist {
	display: block;
	width: 30%;
	height: 220px;
	max-width: 220px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px
}

#top_navlist::after {
	content: " ";
	display: block;
	width: 20%;
	height: 150px
}

.top_nav {
	background-image:url(./style/nav_bg.png);
	border-radius: 5px;
	display: block;
	width: 100%;
	max-height: 40px;
	min-height: 10px;
	margin-top: 15px;
	text-decoration: none;
	font-size: 90%;
	vertical-align: middle central;
	color: #fff;
	letter-spacing: .5px;
	text-align: center;
	-webkit-transition: .2s linear;
	-moz-transition: .2s linear;
	-o-transition: .2s linear;
	transition: .2s linear;
	line-height: 180%
}

.top_nav:hover {
	border-radius: 5px;
	background: #fff
}

#top_footer {
	padding: 4px 10px 4px 10px;
	background-color: #000;
	background-color: rgba(0,0,0,0.9);
	color: #858585;
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 12;
	-webkit-transition: .2s linear;
	-moz-transition: .2s linear;
	-o-transition: .2s linear;
	transition: .2s linear
}
#top_footer:hover{
	background-color: #FFF;
	background-color: rgba(255,255,255,0.8);
	color: #000;
}
#top_copyright {
	display: block;
	-webkit-transition: .2s linear;
	-moz-transition: .2s linear;
	-o-transition: .2s linear;
	transition: .2s linear;
	font-size: 10px;
	letter-spacing: 1.5px;
	text-align: center
}

@media screen and (max-width:500px) {
	#top_footer {
		padding: 1px
	}

	#top_copyright {
		font-size: 8px;
		letter-spacing: 0;
		text-align: center
	}
}
.tooltips{
-webkit-animation: A 3s linear 0s infinite;
animation: A 3s linear 0s infinite;
width:12px;
height:12px;
top:10px;
left:10px;
background: url(./style/snow0.gif);
font-size: 10px;
position:absolute; /*这个是关键*/
z-index:102;
}
.tooltips:hover{
-webkit-animation: none;
animation: none;
z-index:103;
background:none; /*没有这个在IE中不可用*/
}
.tooltips span{
display: none;
}
.tooltips:hover span{ /*span 标签仅在 :hover 状态时显示*/
display:block;
position:relative;
}
</style>
<div style="text-align:center;clear:both">
</div>
<div class="tooltips">
<span>

<!--<iframe src="http://music.163.com/outchain/player?type=0&amp;id=314572618&amp;auto=1&amp;height=280" width=330 height="300" frameborder="no" marginwidth="0" marginheight="0"></iframe>
--></span>
</div>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?fdf2184efaf851b3205918e981935a44";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
<div id="top">
<main id="top_main">
<div id="top_logo"><img src="./htmlimg/tx.png" onmouseover="mouseOver()" onmouseout="mouseOut()" id="mainimg"></div>
<div id="top_title"><img id="top_title01" alt="" src="gui/img/toptilte01.png">
<br class="top_hr_style01">
<img id="top_title02" alt="" src="gui/htmlimg/toptitle02.png">
</div><br><br>s
<div class="showcase-examples l-over l-center">
  <a href="Tickets?action=query" class="button button-rounded button-plain button-small-caps button-border">酒店信息展示</a>
  <a href="Tickets?action=query" class="button button-rounded button-plain button-small-caps button-border">门票信息展示</a>
  <!-- <a href="https://www.404v.com/" class="button button-rounded button-plain button-small-caps button-border">查询3</a> -->
  </div>

</main>
<script>
	function mouseOver(){
		document.getElementById("mainimg").src="gui/img/tx2.png";//鼠标悬浮时的旋转图标
	}
	function mouseOut()
	{
		document.getElementById('mainimg').src ="gui/img/tx.png"//默认的旋转图标
	}
</script>
</div>

</body>

<script src="gui/javascript/snow.js"></script>
<script>
createSnow('', 60);
</script>
</html>