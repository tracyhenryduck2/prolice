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
				Dialog.opener().location.reload(); //;= "<%=path%>/police/Note!list.action";   
				parentDialog.close();             
			});                                 
		} else if(messageType == "exception") { 
			                                    
		}                                     
	}                                       
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "noteBean.policeId":{            
			        required : true,number:true,range:[0,9999999999]
			    },                              
			    "noteBean.content":{            
			        required : true,CNRangeLength:[0,1024]
			    },                              
			    "noteBean.name":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "noteBean.phone":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "noteBean.isRead":{            
			        required : true,number:true,range:[0,9999999999]
			    },                              
			    "noteBean.content2":{            
			        CNRangeLength:[0,1024]
			    },                              
			    "noteBean.submitTime":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "noteBean.replyTime":{            
			        number:true,range:[0,9999999999]
			    }                              
			},                                  
			messages:{                          
//			    "noteBean.code":{          
//				    required : "",CNRangeLength:""  
//			    },                            
			}                                   
		});                                   
	});                                     
	                                        
	                                        
</script>                                
</head>                                  
<body>                                   
<form name="form1" id="form1" action="<%=path %>/police/Note!addNote.action" method="post" target="fram" >   
<input type="hidden" name="oper" value="${oper}" />
<input type="hidden" name="noteBean.id" id="id" value="${noteBean.id }"/>  
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
  <tr>                                    
    	<td align="right" width="30%" > 
                            民警id<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.policeId" id="policeId"  value="${noteBean.policeId}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            短信内容<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.content" id="content"  value="${noteBean.content}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            姓名<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.name" id="name"  value="${noteBean.name}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            手机号<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.phone" id="phone"  value="${noteBean.phone}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            0:未读，1:已读<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.is_read" id="isRead"  value="${noteBean.is_read}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            回复内容<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.content2" id="content2"  value="${noteBean.content2}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            提交时间<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.submitTime" id="submitTime"  value="${noteBean.submitTime}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            回复<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.replyTime" id="replyTime"  value="${noteBean.replyTime}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                
      <td>&nbsp;</td>		
      <td><input type="button" name="提交" value="提交" onclick="save();" class="GF-btn"/></td>		
  </tr>                                
</table>                                 
<iframe name="fram" id="fram" style="display:none"></iframe>   
</form>                                  
</body>                                  
</html>                                  
