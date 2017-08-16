<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ include file="/common/taglibs.jsp" %>  
<%                                       
String path = request.getContextPath();  
%>                                       
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>                                   
<title></title>
<link rel="stylesheet" href="<%=path %>/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=path %>/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=path %>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=path %>/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=path %>/kindeditor/plugins/code/prettify.js"></script>     
	<style>
	#file_upload_1-button {width:100px;padding:8px;}
	</style>                        
<script type="text/javascript">  
var editor1;      
 var isCommit=false 
	function save(){  
	          editor1.sync();                 
			form1.submit();                     
                        
	}                                       
	                                        
	function result(messageType, message){  
		if(messageType=="error"){           
			Dialog.error(message);				      
		} else if (messageType == "reload_success") {   
			Dialog.alert(message,function(){    
				Dialog.opener().location.reload(); //;= "<%=path%>/Notice!list.action";   
				parentDialog.close();             
			});                                 
		} else if(messageType == "exception") { 
			                                    
		}                                     
	}                                                                         
	                                        
	  
	  
	$(function(){ 
		KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="noticeBean.content"]', {
				allowUpload : true,
				cssPath : '<%=path%>/kindeditor/plugins/code/prettify.css',
				uploadJson : "<%=path%>/kindeditor/jsp/upload_json.jsp?dirName=article",
				fileManagerJson : '<%=path%>/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				allowImageUpload : true,
				urlType:'relative',
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						if($("#fileUrl").val()==null || $("#fileUrl").val()=="") {
							Dialog.alert("请上传简介图片");
							return;
						}
						if($("#form1").valid()) {
							document.forms['form1'].submit();
						}
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						if($("#fileUrl").val()==null || $("#fileUrl").val()=="") {
							Dialog.alert("请上传简介图片");
							return;
						}
						if($("#form1").valid()) {
							document.forms['form1'].submit();
						}
					});
				}
			});
			editor1.readonly(${read});
			prettyPrint();
		});                          
		/* form1表单进行验证 */               
		$("#form1").validate({              
			rules:{                             
			                                 
			    "noticeBean.title":{            
			        CNRangeLength:[0,255]
			    }                              
			},                                  
			messages:{                          
//			    "marketNewsBean.code":{          
//				    required : "",CNRangeLength:""  
//			    },                            
			}                                   
		});                                   
	setTimeout(function(){
							var up = $('#upload').Huploadify({
						auto:true,
						fileTypeExts:'*.*',
						multi:true,
						fileSizeLimit:99999999999,
						showUploadedPercent:true,
						showUploadedSize:true,
						removeTimeout:9999999,
						uploader : '<%=request.getContextPath()%>/Notice!importFile.action',
						onUploadSuccess : function(file, data, response) {
							if(data!=null){
								var name=data.substring(13,data.length);
								$("#msg").html(name);
								}
									$("#fileUrl").val(data);
									Dialog.alert("上传成功！");
									$("#_del").hide();
									$("#_del1").show();
									
						    },
						    'onSWFReady': function() {
						    	if($("#baikeId").val()==""){
									$('#file').uploadify('disable',true);
								}
							}
						});
		},10);


	});   	  
	     
	     
	     
	     
	function removeFile()
 {
 	Dialog.confirm("确定删除附件吗？", function(){     
				$.ajax({
					type :"post",
					url : '<%=request.getContextPath()%>/Notice!removeFile.action',
					data : {"fileName":$("#fileUrl").val()},
					success : function(data) {
						if(data)
						{
							
							Dialog.alert("删除成功！");
							$("#_del1").hide();
							$("#_del").show();
						}
						else
						{
							Dialog.alert("删除失败！");
						}
					}
			});   
			}, function(){     
				//否      
			});  
 	
 }   
	 
	                                        
</script>                                
</head>                                  
<body>                                   
<form name="form1" id="form1" action="<%=path %>/Notice!addNotice.action" method="post" target="fram" >   
<input type="hidden" name="oper" value="${oper}" />
<input type="hidden" name="read" value="${read}" />
<input type="hidden" name="noticeBean.id" id="id" value="${noticeBean.id }"/> 
<input type="hidden" name="noticeBean.fileUrl" id="fileUrl"
				value="${noticeBean.fileUrl }" /> 
<table cellpadding="0" cellspacing="0" width="100%" class="GF-grid"> 
  <tr>                                    
    	<td align="right" width="30%" > 
                            标题<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="noticeBean.title" id="title"  value="${noticeBean.title}" class="GF-field"/>   
        </td>                            
  </tr>                                
  <tr>                                    
    	<td align="right" > 
                            内容<span class="mark">*</span>   
        </td>                            
        <td> 
                	<textarea cols="120" rows="16" style="width:800px;height:400px;visibility:hidden;" name="noticeBean.content" id="content" >${noticeBean.content}</textarea>                            

        </td>                            
  </tr>                                
                               
  <tr>      
      	<!--<td align="right" > 
                            内容<span class="mark">*</span>   
        </td>                            
        <td>                             
            <input type="text" name="noticeBean.fileUrl" id="fileUrl"  value="${noticeBean.fileUrl}" class="GF-field"/>   
        </td>   -->                               
    					 <td align="right">
						附件
						<span class="mark"></span>
					</td>
					<s:if test="#request.oper==1">
						<s:if test="#request.noticeBean.fileUrl!=''">
							<td id="_del" style="display: none">
								<div id="upload"></div>
							</td>
							<td id="_del1">
								<span id="msg">${msg }</span>
								<input type="button" value="删除" onclick="removeFile()"
									class="GF-btn" />
							</td>
						</s:if>
						<s:else>
							<td id="_del">
								<div id="upload"></div>
							</td>
							<td id="_del1" style="display: none">
								<span id="msg"></span>
								<input type="button" value="删除" onclick="removeFile()"
									class="GF-btn" />
							</td>
						</s:else>
					</s:if>
					<s:else>
						<td id="_del">
							<div id="upload"></div>
						</td>
						<td id="_del1" style="display: none">
							<span id="msg"></span>
							<input type="button" value="删除" onclick="removeFile()"
								class="GF-btn" />
						</td>
					</s:else>                         
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
