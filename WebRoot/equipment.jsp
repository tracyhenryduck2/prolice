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
<meta charset="utf-8">
<title>电梯系统</title>
<link href="css/basic.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<!--[if IE]><script src="Scripts/html5.js"></script><![endif]-->
</head>

<body scroll="no" style="width:100%;overflow:scroll;overflow-y:hidden;overflow-x:hidden;text-align:center;">
<div class="right" style=" width:100%">
  <div class="right_ctn">
    <table id="table1" width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
      <colgroup>
      <col style="width: 4%" />
      <col style="width: 14%" />
      <col style="width: 8%" />
      <col style="width: 7%" />
      
      <col style="width: 7%" />
      <col style="width: 16%" />
       
      
      <col style="width: 8%" />
      <col style="width: 7%" />
      
      </colgroup>
      <thead>
        <tr>
          <th>民警姓名</th>
          <th>短信内容</th>
          <th>发送时间</th>
          <th>姓名</th>
          <th>手机号</th>
          <th>回复内容</th>
          
          
          <th>回复时间</th>
          <th>状态</th>
        </tr>
      </thead>
      <tbody>
      <s:iterator value="#request.list" id="map">
        <tr>
          <td>${map.policeName }</td>
          <td>${map.content }</td>
          <td><GF:ConvertTime value="${map.submit_time}"/></td>
          <td>${map.name }</td>
          <td>${map.phone }</td>
          <td>${map.content2 }</td>
          
          
          <td><GF:ConvertTime value="${map.reply_time}"/></td>
          <td><s:if test="#map.content2!=''">已回复</s:if><s:else>未回复</s:else></td>
        </tr>
       </s:iterator> 
      </tbody>
    </table>
  </div>
</div>
</body>
<script type="text/javascript">   
   	$(function(){      
   		/* 渲染表格 DataGrid */      
   		$("#table1").render().sort("form1");     
   	});  
</script> 
</html>
