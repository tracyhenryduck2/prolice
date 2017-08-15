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
			Dialog.opener().document.getElementById("userName").value = $("#userName").val()||"";    
			Dialog.opener().document.getElementById("phone").value = $("#phone").val()||"";   
			Dialog.opener().document.getElementById("status").value = $("#status").val()||"";    
			Dialog.opener().document.form1.submit();                     
			ownerDialog.close();
	}                                       
	                                        
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			                              
			},                                  
			messages:{                          
//			    "symptomBean.code":{          
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
    	<td align="right" width="20%" > 
                            用户姓名<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="symptomBean.userName" id="userName"  value="${symptomBean.userName}" class="GF-field"/>   
        </td>              
  </tr>
  <tr>
  		<td align="right" width="20%" > 
                            手机号<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="symptomBean.phone" id="phone"  value="${symptomBean.phone}" class="GF-field"/>   
        </td> 
  </tr>                                 
  <tr>                         
    	<td align="right" width="20%" > 
                            状态<span class="mark"></span>   
        </td>                            
        <td>    
        	<s:select list="#{0:'未兑换',1:'已兑换',2:'服务中',3:'已完成'}"  emptyOption="true"  theme="simple" listKey="key" listValue="value" name="symptomBean.status" id="status"  cssClass="GF-field"></s:select>                             
        </td>                            
  </tr>                                
  <tr>                                
      <td>&nbsp;</td>		
      <td colspan="3"><input type="button" name="查询" value="查询" onclick="search();" class="GF-btn"/></td>		
  </tr>                                
</table>                                 
<iframe name="fram" id="fram" style="display:none"></iframe>   
</form>                                  
</body>                                  
</html>                                  
