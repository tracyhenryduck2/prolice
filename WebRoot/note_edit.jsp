<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="/struts-tags" prefix="s"  %>
<%@ taglib uri="/gdk-tags" prefix="GF"%>
<%@ taglib uri="http://org.mytaglibs/page-tag" prefix="p"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery1.9.js"></script>
<%                                       
String path = request.getContextPath();  
%>                                       
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>   
<link href="css/police.css" rel="stylesheet" type="text/css" />                                
<title></title>                          
<script type="text/javascript">  
String.prototype.trim=function() {  
    return this.replace(/(^\s*)|(\s*$)/g,'');  
};

function goback(){
	history.go(-1);
}     
function save(){
	var msg="";
	if($("#name").val().trim()==""){
		msg="提示！客户姓名不能为空！";
	}else if($("#phone").val().trim()==""){
		msg="提示！联系电话不能为空！";
	}else if($("#content").val().trim().length>50){
		msg="提示！留言内容不大于50个字！";
	}
	if(msg!=""){
		$("#error_body").html(msg);
		$("#error_show").show();
	}else{
		form1.submit();
	}                              
}

function hideMsg(){
	$("#error_show").hide();
}                                     
	                                        
</script>                                
</head>                                  
<body scroll="no" style="width:100%;overflow:scroll;overflow-y:hidden;overflow-x:hidden;text-align:center;">                                   
<form name="form1" id="form1" action="<%=path %>/police/Note!addNote.action" method="post" target="_self" >   
<input type="hidden" name="oper" value="${oper}" />
<input type="hidden" name="noteBean.id" id="id" value="${noteBean.id }"/>
<input type="hidden" name="policeBean.id"  value="${policeBean.id }"/>
<div class="body1">
  <div class="logo"><img src="images/logo_03.png"  alt=""/></div>
  <div class="neirong">
    <div class="pho_zhao"><img src="images/${policeBean.image }"  alt=""/>
      <div class="wenzi">姓名：${policeBean.name }<br/>
        职务：${policeBean.position }<br/>
        </div>
    </div>
    <div class="exchange-suggemain">
      <ul>
       
          <li>
            <label class="fl tit">姓　　名：</label>
            <div class="inputbox fl">
            <input onfocus="hideMsg()" type="text" name="noteBean.name" id="name"  value="${noteBean.name}" class="textsty text01"/> 
            </div>
          </li>
          <li>
            <label class="fl tit">联系电话：</label>
            <div class="inputbox fl">
            	<input onfocus="hideMsg()" type="text" name="noteBean.phone" id="phone"  value="${noteBean.phone}" class="textsty text01"/>
            </div>
          </li>
          <li>
            <label class="fl tit">留　　言：</label>
            <div class="inputbox fl">
              <textarea onfocus="hideMsg()" class="textsty textarea02" name="noteBean.content" id="content">${noteBean.content}</textarea>
            </div>
          </li>
       
      </ul>
      </div>
       <div class="anniu6" onclick="goback()" style="cursor:pointer;">关&nbsp;&nbsp;闭</div>
      <div class="anniu7" onclick="save();" style="cursor:pointer;">发&nbsp;&nbsp;送</div>
    
    <div id="error_show" style=" width:500px;  float:left; margin-top:50px; font-size:28px; color:#F00 ;display:none;"><img src="images/baoc.png" alt="" style="vertical-align:middle;"/><span id="error_body">提示！电话号码不能为空。</span></div>
   
  </div>
</div>                                  
<iframe name="fram" id="fram" style="display:none"></iframe>   
</form>                                  
</body>                                  
</html>                                  
