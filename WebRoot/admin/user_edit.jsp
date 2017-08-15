<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/common/taglibs.jsp" %> 
<% 
String path = request.getContextPath(); 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<title></title> 

<script type="text/javascript"> 
	function save(){ 
	alert("${suserBean.nickname}");
		if($("#form1").valid()) { 
		if($("#msg").val()==1){
			if($("#passwd2").val()!=$("#password").val()) {
				Dialog.alert("两次输入新密码不一致"); 
				return; 
			}
		
			//验证密码是否错误
			var html = $.ajax({
			  data: "suserBean.id="+$("#id").val()+"&suserBean.password="+$("#old_passwd").val(),
			  url: g_Path+"/Police!checkPwd.action",
			  type: 'POST',
			  async: false
			 }).responseText;
			 if(html==true || html=="true") {
				 //return true;
			 } else {
				 Dialog.alert("原密码输入错误"); 
				 return; 
			 }
			 }
			  alert("${suserBean.nickname}");
			form1.submit(); 
			 alert("1");
		} 
	} 
	 
	function result(messageType, message){ 
		if(messageType=="error"){ 
			message = "修改失败";
			Dialog.error(message);				 
		} else if (messageType == "reload_success") { 
			Dialog.alert(message,function(){ 
				parentDialog.close(); 
			}); 
		} else if(messageType == "href_success") { 
			message = "修改成功";
			Dialog.alert(message,function(){ 
				parentDialog.close(); 
			}); 
		} else if(messageType == "exception") { 
			 
		} 
	} 
	 
	$(function(){ 
		/* form1表单进行验证 */ 
		$("#form1").validate({ 
		 
			rules:{ 
				"suserBean.nickname":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "suserBean.username":{            
			        required : true,CNRangeLength:[0,45]
			    },   
                  "suserBean.tel":{            
			        required : true,CNRangeLength:[0,45]
			    }, 
			    "suserBean.password":{ 
			        required : true,
			        minlength:2,
			        maxlength:20
			    }, 
			    "passwd2":{ 
			        required : true,CNRangeLength:[0,20]
			    }, 
			    "old_passwd":{ 
			        required : true,CNRangeLength:[0,20]
			    } ,
							
			}, 
			messages:{ 
				"suserBean.password":{ 
			        required : '请输入新密码',
			        minlength :'密码最小长度为6',
			        maxlength : '密码最大长度为20'
			    }, 
			    "passwd2":{ 
			    	required : '请输入新密码确认'
			    }, 
			    "old_passwd":{ 
			    	required : '请输入原密码'
			    }
			} 
		}); 
	}); 
	function check(obj){
	var html="";
	if(obj.checked==true){
	$("#table1").html(getHtml());
	$("#msg").val(1);
	}else{
	$("#table1").html(html);
	$("#msg").val(0);
	}
	}
	function getHtml(){
	var html=' <tr><td align="right" >原密码<span class="mark">*</span></td><td>';
	html+='<input type="password" name="old_passwd" id="old_passwd"  value="" class="GF-field"/></td></tr>';
	html+='<tr> <td align="right" > 新密码<span class="mark">*</span></td> <td>';
	html+=' <input type="password" name="suserBean.password" id="password"  value="" class="GF-field"/> </td>  </tr>';
	html+=' <tr> <td align="right" > 新密码确认<span class="mark">*</span></td> <td>'; 
    html+='<input type="password" name="passwd2" id="passwd2"  value="" class="GF-field"/> </td></tr>';
    return html;
	}
</script> 
</head> 
<body> 
<form name="form1" id="form1" action="<%=path %>/Police!updateUserPwd.action" method="post" target="fram" > 
<input type="hidden" name="oper" value="${oper}" /> 
<input type="hidden" name="suserBean.id" id="id" value="${suserBean.id }"/> 
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
	
	<tr> 
    	<td align="right" > 
        	姓名<span class="mark"></span>
        </td> 
        <td> 
		<input type="text" name="suserBean.nickname" id="nickname"  value="${suserBean.nickname}" class="GF-field"/>
            
        </td> 
    </tr>
     <tr> 
    	<td align="right" > 
        	登录名<span class="mark"></span>
        </td> 
        <td> 
		<input type="text" name="suserBean.username" id="username"  value=" ${suserBean.username}" class="GF-field"/>
           
        </td> 
    </tr> 
    <tr> 
    	<td align="right" > 
        	电话<span class="mark"></span>
        </td> 
        <td> 
            <input type="text" name="suserBean.tel" id="phone"  value="${suserBean.tel }" class="GF-field"/> 
        </td> 
    </tr>
    
   
    	<td align="right" > 
        	修改密码<span class="mark"></span>
        </td> 
        <td> 
            <input type="checkbox" id="msg" name="msg" onclick="check(this)"/> 
        </td>
    </tr>
    <tr>
    <td colspan="2">
    <table  cellpadding="0" cellspacing="0" width="100%" class="GF-grid" id="table1">
   
     
    
    </table></td>
    </tr>
    <tr> 
    	<td></td> 
    	<td><input type="button" name="提交" value="提交" onclick="save();" class="GF-btn"/></td> 
    </tr> 
</table> 
  
	
<iframe name="fram" id="fram" style="display:none"></iframe> 
</form> 
</body> 
</html>




