<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript" src="include/jquery/jquery-1.8.3.js"></script>
  </head>
  <script type="text/javascript">
  function refresh(){
	  
	   $("#img").attr("src","chickImg/img.jsp?random="+new Date().getTime());
	   return false;
	  }
  
  </script>
  <body>
   <form id="loginForm" name="loginForm" method="post" action="chickImg/chkImg.jsp">
Hello Image Test<br/>
checkCode: <img id="img" onclick="refresh();" src="chickImg/img.jsp"> <br/>
please input the checkCode:<input type="text" name="code" value=""><br/>
<input type="submit" name="btn1" value="check">
</form>
  </body>
</html>
