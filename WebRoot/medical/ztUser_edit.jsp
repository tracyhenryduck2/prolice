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
 var isCommit=false 
	function save(){                        
		if($("#form1").valid()) {           
        if(isCommit==false){   
         isCommit=true       
			form1.submit();                     
      }                 
		}                                     
	}                                       
	                                        
	function result(messageType, message){  
		if(messageType=="error"){           
			Dialog.error(message);				      
		} else if (messageType == "reload_success") {   
			Dialog.alert(message,function(){    
				Dialog.opener().location.reload(); //;= "<%=path%>/medical/ZtUser!list.action";   
				parentDialog.close();             
			});                                 
		} else if(messageType == "exception") { 
			                                    
		}                                     
	}                                       
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "ztUserBean.uname":{            
			        required : true,CNRangeLength:[0,64]
			    },                              
			    "ztUserBean.password":{            
			        required : true,CNRangeLength:[0,32]
			    },                              
			    "ztUserBean.name":{            
			        required : true,CNRangeLength:[0,64]
			    },                              
			    "ztUserBean.phone":{            
			        required : true,CNRangeLength:[0,32]
			    },                              
			    "ztUserBean.type":{            
			        required : true,number:true,range:[0,9999999999]
			    }                             
			},                                  
			messages:{                          
//			    "ztUserBean.code":{          
//				    required : "",CNRangeLength:""  
//			    },                            
			}                                   
		});                                   
	});                                     
	                                        
	                                        
</script>                                
</head>                                  
<body>                                   
<form name="form1" id="form1" action="<%=path %>/medical/ZtUser!addZtUser.action" method="post" target="fram" >   
<input type="hidden" name="oper" value="${oper}" />
<input type="hidden" name="ztUserBean.id" id="id" value="${ztUserBean.id }"/>  
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
  <tr>                                    
    	<td align="right" width="30%" > 
                            用户名<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="ztUserBean.uname" id="uname"  value="${ztUserBean.uname}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            密码<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="ztUserBean.password" id="password"  value="${ztUserBean.password}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            姓名<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="ztUserBean.name" id="name"  value="${ztUserBean.name}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            电话<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="ztUserBean.phone" id="phone"  value="${ztUserBean.phone}" class="GF-field"/>   
        </td>                            
  </tr>                          
            <input type="hidden" name="ztUserBean.type" id="type"  value="${ztUserBean.type}" class="GF-field"/>   
                                  
            <input type="hidden" name="ztUserBean.cdate" id="cdate"  value="${ztUserBean.cdate}" class="GF-field"/>                             
  <tr>                                
      <td>&nbsp;</td>		
      <td><input type="button" name="提交" value="提交" onclick="save();" class="GF-btn"/></td>		
  </tr>                                
</table>                                 
<iframe name="fram" id="fram" style="display:none"></iframe>   
</form>                                  
</body>                                  
</html>                                  
