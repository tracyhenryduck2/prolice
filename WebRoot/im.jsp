<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"  %>
<%@ taglib uri="/gdk-tags" prefix="GF"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
<title>无标题文档</title>
<script type="text/javascript">
	function reply(id){
		//alert(id);
			$("#mask").addClass("mask").fadeIn("slow");
			$("#LoginBox").fadeIn("slow");
			$("#bn").val(id);
	}
	function cancel(){
		$("#LoginBox").fadeOut("fast");
		$("#mask").css({ display: 'none' })
	}
</script>
</head>
 <style>
/*全局样式*/
html, body, table, tr, td, span, ul, li {
	margin: 0 auto;
	padding: 0;
	font-family: "微软雅黑";
}
body {
	
}
ul, li {
	list-style: none;
	padding: 0;
	margin: 0;
}
a {
	color: #fff;
	text-decoration: none;
}
a:hover {
	color: #fff;
}
.list-add a {
	text-decoration: none;
	color: black;
}
</style>
<body >
<div style="background:url(image/1.png) no-repeat; margin:0 auto; width:460px; height:900px; ">
   <div  style=" width:373px; height:570px;  margin-left:53px; top: 170px;overflow:auto; position:relative;  background: url(../image/sd_02.png);
">

   	<div id="refreshDiv">
      <div  >
      <s:iterator value="#request.list" id="map">
    <div  class="kuanjia" >
          <div >
        <div class="xiangmu">
              <p><span>姓名:${map.name}</span></p>
              <p><span>电话号码:${map.phone}</span></p>
              <div class="clear"></div>
            </div>
      </div>
          <div class="neirong" >
        <p class="oneline"><span>内容:${map.content}</span></p>
        <p><span>状态:</span>
        <s:if test="#map.content2==''">
        <font >未回复</font>
        </s:if>
        <s:else><font >已回复</font></s:else>
        </p>
        <p><span>提交时间:<GF:ConvertTime value="${map.submit_time}"/></span></p>
        <div class="clear"></div>
      </div>
          <div class="xi">
        <div style="width:50%; float:right;">
              <div class="newss"><a href="javascript:reply(${map.id });">回&nbsp;&nbsp;复</a></div>
            </div>
        <div class="clear"></div>
      </div>
        </div>
        </s:iterator>
  </div>
    </div>
   </div>
   <div id="LoginBox">
   		<form method="post" action="<%=path %>/police/Note!add.action">
   		<br/>
        &nbsp;&nbsp;&nbsp;回复内容：&nbsp;&nbsp;
        <textarea style="border:1px solid black;width:200px;height:80px;margin-left:10px" name="content2"></textarea><br/>
        <input type="hidden" id="bn" name="id" value=""/>
        <div style="width:70px;margin-left:150px">
        <input type="submit" value="提交" >
         <input type="button" value="关闭" onclick="javascript:cancel();">
         </div>
         </form>
    </div>

</div>
</body>
</html>
