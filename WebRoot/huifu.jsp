<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"  %>
<%
String path = request.getContextPath();
Map<String,Object> map=(Map<String,Object>)request.getAttribute("content");
String content=map.get("content")+"";
String content2=map.get("content2")+"";
long size=Long.parseLong(map.get("size")+"");
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>
  
  <body scroll="no" style="width:100%;overflow:scroll;overflow-y:hidden;overflow-x:hidden;text-align:center;">
<div class="body">
  <div class="logo"><img src="images/logo_03.png"  alt=""/></div>
  <div class="neirong">
    <div class="zhao1"><img src="images/${policeBean.image }"  alt=""/>
      <div class="wenzi">姓名：${policeBean.name }<br/>
        职务：${policeBean.position }<br/>
        </div>
    </div>
    <div class="huifu">
      <div class="wenzi1"><%=content %></div>
      <div class="wenzi2"><%=content2 %></div>
    </div>
    <div class="wenben">
    <% if(size>1 ){%>
    	<div class="anniu6"  onclick="javascript:refresh();">下一条</div>
    <% } %>
    
      	
      <div class="anniu7" onclick="javascript:goBack();">关闭</div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	function refresh(){
		window.location.reload(); 
	}
	function goBack(){
	window.location.href="Police!index.action";
	}
</script>
</html>
