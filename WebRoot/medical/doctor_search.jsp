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
			Dialog.opener().document.getElementById("deptId").value = $("#deptId").val()||"";    
			Dialog.opener().document.getElementById("hospitalId").value = $("#hospitalId").val()||"";    
			Dialog.opener().document.getElementById("roleId").value = $("#roleId").val()||"";    
			Dialog.opener().document.getElementById("description").value = $("#description").val()||"";    
			Dialog.opener().document.getElementById("iconPath").value = $("#iconPath").val()||"";    
			Dialog.opener().document.form1.submit();                     
			ownerDialog.close();
	}                                       
	                                        
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "doctorBean.name":{            
			        CNRangeLength:[0,45]
			    },                              
			    "doctorBean.deptId":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "doctorBean.hospitalId":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "doctorBean.roleId":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "doctorBean.description":{            
			        CNRangeLength:[0,256]
			    },                              
			    "doctorBean.iconPath":{            
			        CNRangeLength:[0,256]
			    }                              
			},                                  
			messages:{                          
//			    "doctorBean.code":{          
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
                            医生姓名<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.name" id="name"  value="${doctorBean.name}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            所属科室<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.deptId" id="deptId"  value="${doctorBean.deptId}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            所属医院<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.hospitalId" id="hospitalId"  value="${doctorBean.hospitalId}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            所属职位<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.roleId" id="roleId"  value="${doctorBean.roleId}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            医生描述<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.description" id="description"  value="${doctorBean.description}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" width="30%" > 
                            头像<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.iconPath" id="iconPath"  value="${doctorBean.iconPath}" class="GF-field"/>   
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
