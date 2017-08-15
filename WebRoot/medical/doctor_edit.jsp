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
				Dialog.opener().location.reload(); //;= "<%=path%>/medical/Doctor!list.action";   
				parentDialog.close();             
			});                                 
		} else if(messageType == "exception") { 
			                                    
		}                                     
	}                                       
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "doctorBean.name":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "doctorBean.deptId":{            
			        required : true,number:true,range:[0,9999999999]
			    },                              
			    "doctorBean.hospitalId":{            
			        required : true,number:true,range:[0,9999999999]
			    },                              
			    "doctorBean.roleId":{            
			        required : true,number:true,range:[0,9999999999]
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
<form name="form1" id="form1" action="<%=path %>/medical/Doctor!addDoctor.action" method="post" target="fram" >   
<input type="hidden" name="oper" value="${oper}" />
<input type="hidden" name="doctorBean.id" id="id" value="${doctorBean.id }"/>  
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
  <tr>                                    
    	<td align="right" width="30%" > 
                            医生姓名<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.name" id="name"  value="${doctorBean.name}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            所属科室<span class="mark">*</span>   
        </td>                            
        <td>       
        	<s:select list="#request.deptList" listKey="id" emptyOption="true" listValue="name" name="doctorBean.deptId" id="deptId" theme="simple"  value="#request.doctorBean.deptId" cssClass="GF-field"></s:select>  
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            所属医院<span class="mark">*</span>   
        </td>                            
        <td>             
            <s:select list="#request.hospitalList" listKey="id" emptyOption="true" listValue="name" name="doctorBean.hospitalId" id="hospitalId" theme="simple"  value="#request.doctorBean.hospitalId" cssClass="GF-field"></s:select>
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            所属职位<span class="mark">*</span>   
        </td>                            
        <td>                     
       		<s:select list="#request.roleList" listKey="id" emptyOption="true" listValue="name" name="doctorBean.roleId" id="roleId" theme="simple"  value="#request.doctorBean.roleId" cssClass="GF-field"></s:select>  
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            医生描述<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.description"  id="description"  value="${doctorBean.description}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            头像<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="doctorBean.iconPath" id="iconPath"  value="${doctorBean.iconPath}" class="GF-field"/>   
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
