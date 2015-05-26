<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div align="center" id="login" >
			 
					<form action="TTLoginAction_ifSuccess.action" method="post">
						<table border="0" cellpadding="0" cellspacing="4"
							style="background: white;">
							<tr>
								<td>
									<div class="STYLE1">
										用户名:
									</div>
								</td>
								<td align="left">
									<input id="loginName" name="name" size="10" />
								</td>
						    </tr>
						    <tr>
								<td align="left">
									<div class="STYLE1">
										密&nbsp;&nbsp;&nbsp;码:
									</div>
								</td>
								<td>
									<div align="left">
										<input id="loginPossword" size="10" name="pwd"
											type="password" />
									</div>
								</td>
							 </tr>
							 <tr>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="submit" name="Submit" value="登陆" />
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input disabled="disabled" type="button" onclick="$('#login').hide(200);"
										name="Submit2" value="取消" />
								</td>
							</tr>
						</table>
					</form>
			 </div>
  </body>
</html>
