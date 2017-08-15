<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/common/taglibs.jsp" %>  
<% 
String path = request.getContextPath();      
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>    
  <head>  
   
    <title>信息</title> 
	<meta http-equiv="pragma" content="no-cache">  
	<meta http-equiv="cache-control" content="no-cache">  
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">   
	<meta http-equiv="description" content="This is my page">    
	<script type="text/javascript">    
		function add(){      
			Dialog.open({Title:"新增", Width:600, Height:360, URL:"<%=path%>/police/Note!toAddNote.action"});   
		}      
		function mod(){      
			var id = getCheckRowValue();     
			if(id==null) {     
				return;   
			}    
			Dialog.open({Title:"编辑", Width:600, Height:360, URL:"<%=path%>/police/Note!toAddNote.action?oper=1&noteBean.id="+id});
		}      
		function detail(){   
			var id = getCheckRowValue();     
			if(id==null) {     
				return;   
			}    
			Dialog.open({Title:"详情", Width:500, Height:360, URL:"<%=path%>/Note!toAddNote.action?read=1&oper=1&noteBean.id="+id});    
		}      
		function del(){      
			if(!isCheckAny("idArr")){      
				Dialog.alert("请至少勾选一个！");   
				return;   
			}    
			Dialog.confirm("确定删除吗", function(){     
				var action_tmp = form1.action; 
				form1.action = "<%=path%>/police/Note!delNotes.action";
				form1.target = "fram";
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
			Dialog.open({Title:"查询", Width:650, Height:220, URL:"<%=path%>/police/Note!search.action",OnLoad:function(){
			     this.innerDoc.getElementById("police_id").value = $("#police_id").val();
			     this.innerDoc.getElementById("content").value = $("#content").val();
			     this.innerDoc.getElementById("name").value = $("#name").val();
			     this.innerDoc.getElementById("phone").value = $("#phone").val();
			     this.innerDoc.getElementById("is_read").value = $("#is_read").val();
			     this.innerDoc.getElementById("content2").value = $("#content2").val();
			     this.innerDoc.getElementById("submit_time").value = $("#submit_time").val();
			     this.innerDoc.getElementById("reply_time").value = $("#reply_time").val();
           }
			});    
		}      
		
	</script>
  </head> 
  <body>  
  <GF:BodyCaption label="信息" ico="images/ico/user.gif"> 
  	<GF:ToolBar id="123">     
	  	<GF:ToolBarItem id="search" label="查询" ico="images/ico/search.gif" onclick="search();" />    
	  	
	  
	  	<GF:ToolBarItem id="detail" label="详情" ico="images/ico/detail.gif" onclick="detail();"/>     
	  	
	  	<GF:ToolBarItem id="refresh" label="刷新" ico="images/ico/refresh.gif" onclick="refresh();"/>  
	</GF:ToolBar>   
    <form action="<%=path%>/Note!list.action" name="form1" id="form1" method="get">  
   
			<input type="hidden" name="noteBean.policeId" id="policeId" value="${noteBean.policeId}"/> 
			<input type="hidden" name="noteBean.content" id="content" value="${noteBean.content}"/> 
			<input type="hidden" name="noteBean.name" id="name" value="${noteBean.name}"/> 
			<input type="hidden" name="noteBean.phone" id="phone" value="${noteBean.phone}"/> 
			<input type="hidden" name="noteBean.is_read" id="isRead" value="${noteBean.is_read}"/> 
			<input type="hidden" name="noteBean.content2" id="content2" value="${noteBean.content2}"/> 
			<input type="hidden" name="noteBean.submit_time" id="submitTime" value="${noteBean.submit_time}"/> 
			<input type="hidden" name="noteBean.reply_time" id="replyTime" value="${noteBean.reply_time}"/> 
		   	<input type="hidden" name="sortname" value="${page.sortname}"/>    
		   	<input type="hidden" name="sortorder"  value="${page.sortorder }"/>
		   	<input type="hidden" name="pageSize" value="${page.pageSize}"/>    
		   	<input type="hidden" name="pageNo"  value="${page.pageNo }"/>      
			<table id="table1" width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0"> 
			   	 <thead>
			   		<tr>  
			   			<th><span><input type="checkbox" onClick="checkAll(this,'idArr')"  width="20px"/></span></th>     
			   			<th sortname="police_id" width="15%">民警id</th>	   
			   			<th sortname="content" width="25%">短信内容</th>	   
			   			<th sortname="name" width="10%">姓名</th>	   
			   			<th sortname="phone" width="25%">手机号</th>	   
			   			<th sortname="is_read" width="10px">已读未读</th>	   
			   			<!--  <th sortname="content2" width="20%">回复内容</th>-->	   
			   			<th sortname="submit_time" width="15%">提交时间</th>	   
			   			<!--<th sortname="reply_time" width="15%">回复</th>	-->   
			   		</tr> 
			   	</thead>
			   	<tbody> 
			   		<s:iterator value="#request.list" id="map"> 
		   			 <tr> 
		   			 	 <td align="left"><input type="checkbox" name="idArr"  value="${map.id}"/></td> 
		   			 	 <td>${map.police_id}</td>    
		   			 	 <td>${map.content}</td>    
		   			 	 <td>${map.name}</td>    
		   			 	 <td>${map.phone}</td>    
		   			 	 <td><s:if test="#request.noteBean.is_read='1'">已读</s:if>
						     <s:else>未读</s:else> 
						  </td>    
		   			 	 <!-- <td>${map.content2}</td> -->    
		   			 	 <td><GF:ConvertTime value="${map.submit_time}" format="yyyy-MM-dd HH:mm:ss"/></td>   
		   			 	<!-- <td>${map.reply_time}</td> -->   
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
