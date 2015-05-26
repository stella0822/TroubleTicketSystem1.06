<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

 

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>vtiger CRM 5 - Commercial Open Source CRM</title>
  <script type="text/javascript" src="include/jquery/jquery-1.8.3.js"></script>
<link rel="stylesheet" href="themes/include/style.css" type="text/css"></link>
    
   

 


</head>
<body  >
	<div class="loginContainer">
<table class="loginWrapper" width="100%" height="100%" cellpadding="10" cellspacing="0" border="0">
	<tr valign="top" height="160">
		  <td colspan="3"></td>
	</tr>

	<tr>
		<td valign="top" align="center" width="50%">
			<div>
				 
			</div>
		</td>

		<td valign="top" align="center" width="50%">
			<div class="loginForm">
				<div class="poweredBy">登录</div>
				
				<form action="login_login.action" method="post" name="DetailView" id="form">
				 
					<div class="inputs">
						<div class="label">User Name</div>
						<div class="input"><input type="text" name="user.loginName"/></div>
						<br />
						<div class="label">Password</div>
						<div class="input"><input type="password" name="user.loginPossword"/></div>
						 <div class="errorMessage">
							 
						</div>
							<br />
                             <script type="text/javascript">
                             function refresh()
                             {    
                           	   $("#cc").attr("src","chickImg/img.jsp?random="+new Date().getTime());
                           	  }
                             </script>
						<div class="label" >验证码
							<input type="text" name="chickImg" style="width: 100px"/>
							 
							<img id="cc" onclick="refresh();" src="chickImg/img.jsp" alt="点击切换" />
					 
						</div> <br />
						<div class="button">
							<input type="submit" id="submitButton" value="Login" />
						</div>
						<div style="color: red;">${stateText}</div>
					</div>
				</form>
			</div>
			<div class="importantLinks">
			<a href='javascript:mypopup()'>Read License</a>
			|
			<a href='http://www.vtiger.com/products/crm/privacy_policy.html' target='_blank'>Privacy Policy</a>
			|
			&copy; 2004- 2013			</div>
		</td>
	</tr>
	
</table>

	</div>
</body>
</html>
