<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'note.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body scroll="no" style="width:100%;overflow:scroll;overflow-y:hidden;overflow-x:hidden;text-align:center;">
  	<div>
    <form action="<%=path %>/police/Note!add.action" method="post">
    	短息内容：<s:select list="#request.list" 
    	listKey="id" listValue="content" name="id"></s:select><br/>
    	<br/>
    	回复内容：<textarea rows="5" cols="30" name="content2"></textarea><br/>
    	<input type="submit" value="提交"/>
    </form>
    </div>
  </body>
</html>
