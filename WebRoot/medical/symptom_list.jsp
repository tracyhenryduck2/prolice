<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/common/taglibs.jsp" %>  
<% 
String path = request.getContextPath();      
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>    
  <head>  
   
    <title>病单管理</title> 
	<meta http-equiv="pragma" content="no-cache">  
	<meta http-equiv="cache-control" content="no-cache">  
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">   
	<meta http-equiv="description" content="This is my page">    
	<script type="text/javascript">    
		function add(){      
			Dialog.open({Title:"新增", Width:600, Height:360, URL:"<%=path%>/medical/Symptom!toAddSymptom.action"});   
		}      
		function mod(){      
			var id = getCheckRowValue();     
			if(id==null) {     
				return;   
			}    
			Dialog.open({Title:"编辑", Width:600, Height:360, URL:"<%=path%>/medical/Symptom!toAddSymptom.action?oper=1&symptomBean.id="+id});
		}      
		function detail(){   
			var id = getCheckRowValue();     
			if(id==null) {     
				return;   
			}    
			Dialog.open({Title:"详情", Width:700, Height:360, URL:"<%=path%>/medical/Symptom!toAddSymptom.action?read=1&oper=1&symptomBean.id="+id});    
		}      
		function del(){      
			if(!isCheckAny("idArr")){      
				Dialog.alert("请至少勾选一个！");   
				return;   
			}    
			Dialog.confirm("确定删除吗", function(){     
				var action_tmp = form1.action; 
				form1.action = "<%=path%>/medical/Symptom!delSymptoms.action";
				form1.target = "fram";
				form1.submit();  
				form1.action = action_tmp;     
				form1.target = "";    
			}, function(){     
				//�?      
			});  
		}    
		
		function receive(id){
			Dialog.confirm("确定接单吗", function(){     
				var action_tmp = form1.action; 
				form1.action = "<%=path%>/medical/Symptom!setStatus.action";
				form1.target = "fram";
				$("#symId").val(id);
				$("#symStatus").val(1);
				form1.submit();  
				form1.action = action_tmp;     
				form1.target = "";      
			}, function(){     
				//�?      
			});         
		}   
		function service(id){       
			Dialog.confirm("确定服务吗", function(){     
				var action_tmp = form1.action; 
				form1.action = "<%=path%>/medical/Symptom!setStatus.action";
				form1.target = "fram";
				$("#symId").val(id);
				$("#symStatus").val(2);
				form1.submit();  
				form1.action = action_tmp;     
				form1.target = "";    
			}, function(){     
				//�?      
			});  
		}   
		function end(id){       
			Dialog.confirm("确定完成吗", function(){     
				var action_tmp = form1.action; 
				form1.action = "<%=path%>/medical/Symptom!setStatus.action";
				form1.target = "fram";
				$("#symId").val(id);
				$("#symStatus").val(3);
				form1.submit();  
				form1.action = action_tmp;     
				form1.target = "";    
			}, function(){     
				//�?      
			});  
		}       
		
		function result(type, message) {   
			if("reload_success" == type) { 
				Dialog.alert(message,function(){      
					form1.submit();
				});
			} else if("error" == type) {   
				Dialog.error(message);  
			}    
		}      
		function search() {  
			Dialog.open({Title:"查询", Width:650, Height:220, URL:"<%=path%>/medical/Symptom!search.action",OnLoad:function(){
			     this.innerDoc.getElementById("userName").value = $("#userName").val();
			     this.innerDoc.getElementById("phone").value = $("#phone").val();
			     this.innerDoc.getElementById("status").value = $("#status").val();
           }
			});    
		}      
		
	</script>
  </head> 
  <body>  
  <GF:BodyCaption label="病单管理" ico="images/ico/user.gif"> 
  	<GF:ToolBar id="123">     
	  	<GF:ToolBarItem id="search" label="查询" ico="images/ico/search.gif" onclick="search();" />    
	  	<GF:ToolBarItem id="delete" label="删除" ico="images/ico/delete.gif" onclick="del();"/> 
	  	<GF:ToolBarItem id="detail" label="详情" ico="images/ico/detail.gif" onclick="detail();"/>     
	  	<GF:ToolBarItem id="export" label="导出" ico="images/ico/export.gif" onclick="exportExcel();"/>
	  	<GF:ToolBarItem id="refresh" label="刷新" ico="images/ico/refresh.gif" onclick="refresh();"/>  
	</GF:ToolBar>   
    <form action="<%=path%>/medical/Symptom!list.action" name="form1" id="form1" method="get">  
   
			<input type="hidden" name="symptomBean.userId" id="userId" value="${symptomBean.userId}"/> 
			<input type="hidden" name="symptomBean.description" id="description" value="${symptomBean.description}"/> 
			<input type="hidden" name="symptomBean.deptId" id="deptId" value="${symptomBean.deptId}"/> 
			<input type="hidden" name="symptomBean.doctorId" id="doctorId" value="${symptomBean.doctorId}"/> 
			<input type="hidden" name="symptomBean.cases" id="cases" value="${symptomBean.cases}"/> 
			<input type="hidden" name="symptomBean.laboratory" id="laboratory" value="${symptomBean.laboratory}"/> 
			<input type="hidden" name="symptomBean.affectedPart" id="affectedPart" value="${symptomBean.affectedPart}"/> 
			<input type="hidden" name="symptomBean.serviceId" id="serviceId" value="${symptomBean.serviceId}"/> 
			<input type="hidden" name="symptomBean.cdate" id="cdate" value="${symptomBean.cdate}"/> 
			<input type="hidden" name="symptomBean.status" id="status" value="${symptomBean.status}"/> 
			<input type="hidden" name="symptomBean.phone" id="phone" value="${symptomBean.phone}"/>
			<input type="hidden" name="symptomBean.userName" id="userName" value="${symptomBean.userName}"/>
		   	<input type="hidden" name="sortname" value="${page.sortname}"/>    
		   	<input type="hidden" name="sortorder"  value="${page.sortorder }"/>
		   	<input type="hidden" name="pageSize" value="${page.pageSize}"/>    
		   	<input type="hidden" name="pageNo"  value="${page.pageNo }"/>      
		   	<input type="hidden" name="symId" id="symId"/> 
		   	<input type="hidden" name="symStatus" id="symStatus"/>
			<table id="table1" width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0"> 
			   	 <thead>
			   		<tr>  
			   			<th><span><input type="checkbox" onClick="checkAll(this,'idArr')"  width="20"/></span></th>     
			   			<th sortname="user_id" width="10%">用户姓名</th>	   
			   			<th sortname="description" width="30%">症状描述</th>
			   			<th sortname="cases" width="10%">所需服务</th>		   
			   			<th sortname="cdate" width="10%">发单时间</th>	   
			   			<th sortname="status" width="10%">状态</th>	  
			   			<th width="30%">操作</th> 
			   		</tr> 
			   	</thead>
			   	<tbody> 
			   		<s:iterator value="#request.list" id="map"> 
		   			 <tr> 
		   			 	 <td align="left"><input type="checkbox" name="idArr"  value="${map.id}"/></td> 
		   			 	 <td>${map.user_name}</td>    
		   			 	 <td>${map.description}</td>    
		   			 	 <td>${map.service_name}</td>  
		   			 	 <td>${map.cdate}</td>    
		   			 	 <td><s:if test="#request.map.status==0">未接单</s:if><s:elseif test="#request.map.status==1">已接单</s:elseif><s:elseif test="#request.map.status==2">服务中</s:elseif><s:else>已完成</s:else></td> 
		   			 	 <td>
		   			 	 	<s:if test="#request.map.status==0"><input type="button" class="GF-btn" onclick="receive('${map.id }');" value="接单">&nbsp;<input type="button" class="GF-btn" onclick="service('${map.id }')" value="服务中">&nbsp;<input type="button" class="GF-btn" onclick="end('${map.id }')" value="结束"></s:if>
		   			 	 	<s:if test="#request.map.status==1"><input type="button" class="GF-btn" onclick="service('${map.id }')" value="服务中">&nbsp;<input type="button" class="GF-btn" onclick="end('${map.id }')" value="结束"></s:if>
		   			 	 	<s:if test="#request.map.status==2"><input type="button" class="GF-btn" onclick="end('${map.id }')" value="结束"></s:if>
		   			 	 </td>   
		   			 </tr>
		   			 </s:iterator> 	    
		   		</tbody>		    		  
   			</table>
   			<GF:Pagination formName="form1" pageNo="${page.pageNo }" pageSize="${page.pageSize }" totalRows="${page.totalRows }"/> 
   </form>
   </GF:BodyCaption>    
   <iframe name="fram" id="fram" style="display:none"></iframe>    
  </body> 
  <script type="text/javascript">   
   	$(function(){      
   		/* 渲染表格 DataGrid */      
   		$("#table1").render().sort("form1");     
   	});  
</script> 
</html>   
