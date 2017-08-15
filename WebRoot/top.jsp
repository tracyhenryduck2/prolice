<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%
String path = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<link href="css/css.css" rel="stylesheet"/>
<style type="text/css">
a:link {
	color: #CCC;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #CCC;
}
a:hover {
	text-decoration: none;
	color: #999;
}
a:active {
	text-decoration: none;
	color: #CCC;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.top{ width:100%; height:82px;     background-color: #00B2EE;}
.top_font{color:white;} 
#info{float:right;margin:20px 10px;}

.logo1 {width:50%;float:left}
</style>
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadimages2() { //v3.0
  var d=document; if(d.images2){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadimages2.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function logout(){
	window.parent.document.location="Index!logout.action";
}

function changeUserPWD() {
	Dialog.open({Title:"修改个人信息", Width:400, Height:300, URL:"system/User1!toPwd.action"});
}
function changeRole(){
  Dialog.open({Title:"切换职务" ,Width:400,Height:250 ,URL:"system/User1!toRole.action"});
}
</script>
</head>
<body>
<div class="top">
 <div class="logo1"><img src="images/logo_03.png" height="90px" alt=""/></div>
                      <div align="right" style="height: 25px;line-height: 25px;margin-right: 25px;text-align: center;width: 114px;float: right;margin-top: 20px;">
                   		<span style="background:url(<%=path%>/images/style/user.png) no-repeat center left;height:25px;line-height:25px;margin-right:10px;color:#FFF;padding-left:20px;">欢迎您: ${session.user.nickname}</span>
                     	<a href="javascript:logout();" style="background:url(<%=path%>/images/style/exit.png) no-repeat center left;color:#FFF;text-decoration:none;padding-left:20px;">退出</a>
					</div>
</div>
<!-- End Save for Web Slices -->
</body>
</html>