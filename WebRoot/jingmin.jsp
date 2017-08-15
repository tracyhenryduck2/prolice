<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="/struts-tags" prefix="s"  %>
<%@ taglib uri="/gdk-tags" prefix="GF"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery1.9.js"></script>
<%                                       
String path = request.getContextPath();  
%>                                       
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>   
<link href="css/police.css" rel="stylesheet" type="text/css" /> 
<title>警民通</title>
<script type="text/javascript">

function goMsg(id){
	document.URL="Note!toAddNote.action?policeBean.id="+id;
}

function goResult(id){
	window.location.href="Note!unReadList.action?policeBean.id="+id
}
function goBack(){
	window.location.href="index1.html";
}
function getAjaxData(){
	$.post("Note!getResult.action",function(data){
		var list=eval(data);
		for(var i=0;i<list.length;i++){
			var x=list[i];
			if(x.cnt==""||x.cnt==0){
				$("#show_"+x.id).hide();
				$("#show2_"+x.id).show();
			}else{
				$("#count_"+x.id).html(x.cnt);
				$("#show_"+x.id).show();
				$("#show2_"+x.id).hide();
			}
		}
	});
}

$(function(){
	setInterval('getAjaxData()',3000);
	//getAjaxData();
});
</script>
</head>
<body scroll="no" style="width:100%;overflow:scroll;overflow-y:hidden;overflow-x:hidden;text-align:center;">
	
	<div class="body1">
	  <div class="logo"><img src="images/logo_03.png"  alt=""/></div>
	  <div class="neirong">
		  <s:iterator value="#request.list" id="map">
			  	<div class="zhao"><img src="images/${map.image }"  alt="" onclick="goMsg('${map.id }')" style="cursor:pointer;"/>   
				      <div class="wenzi" onclick="goMsg('${map.id }')" style="cursor:pointer;">姓名：${map.name }<br/>
				        职务：${map.position }<br/>
				      </div>
				      <div style="display:none;" class="wenzi" id="show_${map.id }" onclick="goResult('${map.id }')" style="cursor:pointer;"><span style="float:left;padding-left:12px;">未读反馈：</span><span id="count_${map.id }" style=" border-radius: 10px; background:#F00; color:#FFF; width:20px; height:20px; text-align:center; line-height:20px; float:left">0</span>
				      </div>
				      <div class="wenzi" id="show2_${map.id }"></div>
			     </div>
		  </s:iterator>
	  <a href="javascript:goBack()" style="color:#068fd5;text-decoration:none">点击此处</a>
	  </div>
	 
	 </div>
</body>

</html>