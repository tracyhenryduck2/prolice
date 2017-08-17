<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ include file="/common/taglibs.jsp" %>  
<%                                       
String path = request.getContextPath();  
System.out.println(path);
%>                                       
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>   
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/Huploadify-master/Huploadify.css" /> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Huploadify-master/jquery.Huploadify.js"></script>                                
<title></title>       
                 
<script type="text/javascript">        
 var isCommit=false 
	function save(){      
      alert("save");  
		if($("#form1").valid()) {           
        if(isCommit==false){   
         isCommit=true       
			form1.submit();                     
      }                 
		}
		alert("无效");                                     
	}                                       
	                                        
	function result(messageType, message){  
		if(messageType=="error"){           
			Dialog.error(message);				      
		} else if (messageType == "reload_success") {   
			Dialog.alert(message,function(){    
				Dialog.opener().location.reload(); //;= "<%=path%>/police/Police!list.action";   
				parentDialog.close();             
			});                                 
		} else if(messageType == "exception") { 
			                                    
		}                                     
	}                                       
	                                        
	$(function(){                           
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			    "policeBean.name":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "policeBean.code":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "policeBean.position":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "policeBean.phone":{            
			        required : true,CNRangeLength:[0,45]
			    },                              
			    "policeBean.image":{            
			        required : true,CNRangeLength:[0,255]
			    },                           
			},                                  
			messages:{                          
//			    "policeBean.code":{          
//				    required : "",CNRangeLength:""  
//			    },                            
			}                                   
		}); 
		setTimeout(function(){
			$('#file').uploadify({
				'fileObjName':'file',
				'buttonText':'选择文件',
				'method'   :'post',
				'multi'    :false,
				'queueSizeLimit' : 1,
				'auto'     :true,  
				'swf'      : '<%=path%>/js/uploadify/uploadify.swf?pp=1',
				'uploader' : '<%=request.getContextPath()%>/Police!importFile.action',
				'onUploadSuccess' : function(file, data, response) {
					$("#pic").html("<img src='/photo/"+data+"' style='width:100px;height:100px;'/>");
					$("#fileUrl").val(data);
			    }
			});
		},10);                                   
	});                                     
	                                        
	function removeFile() {
	 	Dialog.confirm("确定删除附件吗？", function(){     
		$.ajax({
		 type :"post",
		 url : '<%=request.getContextPath()%>/Police!removeFile.action',
				data : {
					"fileName" : $("#fileUrl").val()
				},
				success : function(data) {
					if (data) {
						$("#pic").html("");
						Dialog.alert("删除成功！");
						$("#touxiang").val("");
					} else {
						Dialog.alert("删除失败！");
					}
				}
			});
}, function() {
	//否      
});		
	}
	
</script>                                
</head>                                  
<body>                                   
<form name="form1" id="form1" action="<%=path %>/Police!addPolice.action" method="post" target="fram" >   
<input type="hidden" name="oper" value="${oper}" />
<input type="hidden" name="policeBean.id" id="id" value="${policeBean.id }"/>
<input type="hidden" name="policeBean.password" id="password" value="${policeBean.password}"/>   
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
  <tr>                                    
    	<td align="right" width="10%" > 
                            部门<span class="mark">*</span>   
        </td>                            
        <td>                             
            <s:select list="#request.depList"  cssClass="GF-field" name="policeBean.depId" id="typeId"   theme="simple" listKey="id" listValue="name"  value="#request.policeBean.depId" ></s:select>
        </td>                            
  </tr>
  <tr>                                    
    	<td align="right" width="30%" > 
                            姓名<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.name" id="name"  value="${policeBean.name}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            警号<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.code" id="code"  value="${policeBean.code}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            职位<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.position" id="position"  value="${policeBean.position}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            手机号<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="policeBean.phone" id="phone"  value="${policeBean.phone}" class="GF-field"/>   
        </td>                            
  </tr>                                
                                      
  <tr id="upload_pic">  
  		<td align="right">上传警员照片</td>                                     
    	<td><input type="file" name="file" id="file" /><br/>建议图片格式jpg,png,gif</td>                     
  </tr>
  <script type="text/javascript">
    var ds = ${read};
    if(ds==1){
    $("#upload_pic").css("display","none");
    }
  </script>  
  <tr>                                    
    	<td align="right">预览警员照片  
	
</td>
    	<td>
    	<div id="pic">
    		<s:if test="#request.policeBean.image!=null && #request.policeBean.image!=''">
			<img src='/photo/${policeBean.image}' style='width:100px;height:100px;'/>
				
	    	</s:if>
	    </div>
		<input type="text" name="policeBean.image" id="fileUrl" value="${policeBean.image }" class="GF-field"/>	
    	<input type="button" value="删除" onclick="removeFile()" class="GF-btn" />
		</td>                     
  </tr>                                 
   

  <tr>                                
      <td>&nbsp;</td>		
      <td><input type="button" name="提交" value="提交" onclick="save()" class="GF-btn"/></td>		
  </tr>                                
</table>                                 
<iframe name="fram" id="fram" style="display:none"></iframe>   
</form>                                  
</body>                                  
</html>                                  
