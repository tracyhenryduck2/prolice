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
	function search(){                          
			Dialog.opener().document.getElementById("policeId").value = $("#policeId").val()||"";    
			Dialog.opener().document.getElementById("content").value = $("#content").val()||"";    
			Dialog.opener().document.getElementById("name").value = $("#name").val()||"";    
			Dialog.opener().document.getElementById("phone").value = $("#phone").val()||"";    
			Dialog.opener().document.getElementById("isRead").value = $("#isRead").val()||"";    
			Dialog.opener().document.getElementById("content2").value = $("#content2").val()||"";    
			Dialog.opener().document.getElementById("submitTime").value = $("#submitTime").val()||"";    
			Dialog.opener().document.getElementById("replyTime").value = $("#replyTime").val()||"";    
			Dialog.opener().document.form1.submit();                     
			ownerDialog.close();
	}                                       
	                                        
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "noteBean.policeId":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "noteBean.content":{            
			        CNRangeLength:[0,1024]
			    },                              
			    "noteBean.name":{            
			        CNRangeLength:[0,45]
			    },                              
			    "noteBean.phone":{            
			        CNRangeLength:[0,45]
			    },                              
			    "noteBean.isRead":{            
			        number:true,range:[0,9999999999]
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
<form name="form1" id="form1" action="#" method="post" target="fram" >   
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
  <tr>                                    
    	<td align="right" width="30%" > 
                            民警id<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.policeId" id="policeId"  value="${noteBean.policeId}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            短信内容<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.content" id="content"  value="${noteBean.content}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            姓名<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.name" id="name"  value="${noteBean.name}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            手机号<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.phone" id="phone"  value="${noteBean.phone}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            0:未读，1:已读<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.isRead" id="isRead"  value="${noteBean.isRead}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            回复内容<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.content2" id="content2"  value="${noteBean.content2}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            提交时间<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.submitTime" id="submitTime"  value="${noteBean.submitTime}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            回复<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="noteBean.replyTime" id="replyTime"  value="${noteBean.replyTime}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                
      <td>&nbsp;</td>		
      <td><input type="button" name="查询" value="查询" onclick="search();" class="GF-btn"/></td>		
  </tr>                                
</table>                                 
<iframe name="fram" id="fram" style="display:none"></iframe>   
</form>                                  
</body>                                  
</html>                                  
