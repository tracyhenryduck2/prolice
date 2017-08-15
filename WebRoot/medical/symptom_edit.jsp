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
				Dialog.opener().location.reload(); //;= "<%=path%>/medical/Symptom!list.action";   
				parentDialog.close();             
			});                                 
		} else if(messageType == "exception") { 
			                                    
		}                                     
	}                                       
	 function show(name) {
	 	Dialog.open({InnerHtml:"<img src='/upload/medical/"+name+"' width='700'/>",Width:700, Height:500,Title:'图片详情'}); 
	 }                                       
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "symptomBean.userId":{            
			        required : true,number:true,range:[0,9999999999]
			    },                              
			    "symptomBean.description":{            
			        required : true,CNRangeLength:[0,256]
			    },                              
			    "symptomBean.deptId":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "symptomBean.doctorId":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "symptomBean.cases":{            
			        CNRangeLength:[0,128]
			    },                              
			    "symptomBean.laboratory":{            
			        CNRangeLength:[0,128]
			    },                              
			    "symptomBean.affectedPart":{            
			        CNRangeLength:[0,128]
			    },                              
			    "symptomBean.serviceId":{            
			        number:true,range:[0,9999999999]
			    },                              
			    "symptomBean.status":{            
			        required : true,number:true,range:[0,9999999999]
			    }                              
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
<form name="form1" id="form1" action="<%=path %>/medical/Symptom!addSymptom.action" method="post" target="fram" >   
<input type="hidden" name="oper" value="${oper}" />
<input type="hidden" name="symptomBean.id" id="id" value="${symptomBean.id }"/>  
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
  <tr>                                    
    	<td align="right" width="20%" > 
                            用户<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="symptomBean.userName" id=userName  value="${symptomBean.userName}" class="GF-field"/>   
        </td>                            
    	                        
  </tr> 
  <tr>
  <td align="right" width="20%" > 
                            症状描述<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="symptomBean.description" id="description"  value="${symptomBean.description}" class="GF-field"/>   
        </td>    
  </tr>                
  <tr>                                    
    	<td align="right"  > 
                            病例<span class="mark"></span>   
        </td>                            
        <td >  
        	<s:iterator value="#request.cases" id="map1">
        		 <img src='/upload/medical/${map1}' onclick="show('${map1}')" style='width:100px;height:100px;'/>
        	</s:iterator>
        </td>                       
  </tr> 
  <tr>
  		<td align="right"  > 
                            化验单<span class="mark"></span>   
        </td>                            
        <td >     
        	<s:iterator value="#request.laboratory" id="map2">
        		 <img src='/upload/medical/${map2}' onclick="show('${map2}')" style='width:100px;height:100px;'/>
        	</s:iterator>                        
        </td> 
  </tr>                               
  <tr>                                    
    	<td align="right"  > 
                            患处<span class="mark"></span>   
        </td>                            
        <td>                     
        	<s:iterator value="#request.affected" id="map3">
        		 <img src='/upload/medical/${map3}' onclick="show('${map3}')" style='width:100px;height:100px;'/>
        	</s:iterator>         
        </td>                            
  </tr>                                
  <tr>    
  		<td align="right"  > 
                            填写时间<span class="mark"></span>   
        </td>                            
        <td>                             
            <input type="text" name="symptomBean.cdate" id="cdate"  value="${symptomBean.cdate}" class="GF-field"/>   
        </td>                          
    	                           
  </tr>  
  <tr>
  		<td align="right"  > 
                            状态<span class="mark"></span>   
        </td>                            
        <td>                             
            <s:if test="#request.symptomBean.status==0">未接单</s:if><s:elseif test="#request.symptomBean.status==1">已接单</s:elseif><s:elseif test="#request.symptomBean.status==2">服务中</s:elseif><s:else>已完成</s:else>
        </td> 
  </tr>                              
  <tr>                                
      <td>&nbsp;</td>		
      <td colspan="3"><input type="button" name="保存" value="保存" onclick="save();" class="GF-btn"/></td>		
  </tr>                                
</table>                                 
<iframe name="fram" id="fram" style="display:none"></iframe>   
</form>                                  
</body>  
<div id="showInfo"></div>                                
</html>                                  
