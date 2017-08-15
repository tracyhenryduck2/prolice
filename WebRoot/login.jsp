<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/common/taglibs.jsp" %>  
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<title>警民通后台管理系统</title>
<style>
*{ margin:0 auto; padding:0; border:0;}
body {font:12px "宋体";}
body,html{ height:100%;}
input { border:1px solid #004C7E;}
.main { background: url(<%=path%>/loginimage/backgr.png) repeat-x; height: 100%;
    height: 800px;}
.lable { background:url(<%=path%>/images/lable.gif) no-repeat; width:157px; height:32px; float:right; margin:81px 31px 0 0;}
.submit {    width: 123px;
    height: 39px;
    border: none;
    cursor: pointer;
    background-color: transparent;}

.reset {    width: 123px;
    height: 39px;
    border: none;
    cursor: pointer;
    background-color: transparent;} 

 #main {    background: url(/police/loginimage/kuang.jpg) no-repeat;
    width: 1200px;
    height: 500px;
    background-size: 100% 100%;
    position: relative;
    margin-top: 200px;
    margin-right: 15px;
    float: right;}
 input:-webkit-autofill {
background-color: white;
background-image: none;
-webkit-box-shadow: 0 0 0px 1000px white inset; 
}
div.login { 
   border-radius: 5px;
  background-color: white;
  -moz-box-shadow: 5px 6px 10px #06c;
  -webkit-box-shadow: 5px 6px 10px #515151;
  box-shadow: 5px 6px 10px #515151;}

div.login img {  width: 30px;
  margin-top: 4px;
  margin-left: 6px;
  float: left;}
  
  input[type=submit] {
    height: 55px;
    background-size: 100% 100%;
    font-family: "微软雅黑";
    font-size: 0.8em;
    font-weight: bold;
    width: 87px;
    line-height: 53px;
  
  }
    input[type=reset] {
    height: 55px;
    background-size: 100% 100%;
    font-family: "微软雅黑";
    font-size: 0.8em;
    font-weight: bold;
    width: 87px;
    line-height: 53px;
    
    }
    
    .dibu {  background: #3f3e3a;
  font-size: 1.5em;
  color: white;
  font-family: "微软雅黑";
  padding: 6px;}
  .deng {
    width: 87px;
    float: right;
    height:55px;
    background: url(/police/loginimage/denglu.png) no-repeat;
    position:relative;
        margin-right: 84px;
  }
  .guohui {    position: absolute;
    top: 248px;
    left: 154px;
    width: 400px;}
    .guohui img {width:100%}
</style>


<script language="javascript" type="text/javascript">
// var msg='${showMessage}';background:url(<%=path%>/images/logo.png) no-repeat;
//if(msg!=''){
//	alert(msg);
//}
</script>
</head>
<body>
<table width="100%" class="main" cellpadding="0" cellspacing="0">
  	<tr>
   			<td align="center" valign="top">
   			    <div class="guohui"><img src="loginimage/guohui.png"/></div>
			 	<form action="<%=path %>/Index!index.action" method="post" id="main" >
			 		<table  width="484" height="180" cellpadding="0" cellspacing="0" style="    margin-top: 50px;position: absolute;    top: 93px;left: 563px;" >
					     <tr  style="text-align:center">
						   <td height="40">
						   	<div class="login" style="  margin: 0 auto;width:255px;height:43px;padding-top:2px;padding-bottom:2px;float: left;">
						   		<img  src="<%=path %>/loginimage/touxiang.png"/><input placeholder="请输入用户名" name="username" type="text" id="username" value="" style="  width: 175px;height: 37px;border: none;line-height: 27px;margin-left: 7px;"/>
						   	</div>
						   	<div class="deng">
						   	<span style="position:absolute;top: 15px;left: 30px;">登陆</span>
						   	<input name="submit" type="submit" class="submit" value=""/>
						   	</div>
						   </td>
						 </tr>
					     <tr style="text-align:center">
						   <td  height="40">
						   		<div class="login" style="  margin: 0 auto;width:255px;height:43px;padding-top:2px;padding-bottom:2px;float: left;">
						   			<img src="<%=path %>/loginimage/suo.png"/><input placeholder="请输入密码" name="password" type="password" id="password" value="" style="  width: 175px;height: 37px;border: none;line-height: 27px;margin-left: 7px;"/>
						   		</div>
						   		<div class="deng">
						   			<span style="position:absolute;    top: 15px;left: 30px;">重置</span>
						   		<input name="reset" type="reset" class="reset" value="" />
						   		</div>
						   </td>
						 </tr>

					</table>
					<span style="position:absolute;top: 539px;left: 561px;;color:#999999;font-size:1.5em">宁海县桃源派出所</span>
				</form>
		 </td>
	</tr>

</table>
</body>
</html>
