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
			Dialog.opener().document.getElementById("name").value = $("#name").val()||"";    
			Dialog.opener().document.getElementById("code").value = $("#code").val()||"";    
			Dialog.opener().document.getElementById("position").value = $("#position").val()||"";    
			Dialog.opener().document.getElementById("phone").value = $("#phone").val()||"";    
			Dialog.opener().document.getElementById("image").value = $("#image").val()||"";    
			Dialog.opener().document.form1.submit();                     
			ownerDialog.close();
	}                                       
	                                        
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "policeBean.name":{            
			        CNRangeLength:[0,45]
			    },                              
			    "policeBean.code":{            
			        CNRangeLength:[0,45]
			    },                              
			    "policeBean.position":{            
			        CNRangeLength:[0,45]
			    },                              
			    "policeBean.phone":{            
			        CNRangeLength:[0,45]
			    },                              
			    "policeBean.image":{            
			        CNRangeLength:[0,30]
			    }                              
			},                                  
			messages:{                          
//			    "policeBean.code":{          
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
                            姓名<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.name" id="name"  value="${policeBean.name}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            警号<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.code" id="code"  value="${policeBean.code}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            职位<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.position" id="position"  value="${policeBean.position}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            手机号<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.phone" id="phone"  value="${policeBean.phone}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            <span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.image" id="image"  value="${policeBean.image}" class="GF-field"/>   
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
