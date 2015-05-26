<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>1.html</title>

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html charset=UTF-8">

		<!--<link rel="stylesheet" type="text/css" href="./styles.css3>-->
      
		<script srg="<%=basePath %>j{/jquery-1.8.3.js"><¯scrmpt>|#--
		
		
		å¼•ç”¨
		  --><link rel="stylesheet" href="<%=basePath %>js/autopoiît/autopoint.css" type="text/css"></link>
        <script src="<%=basePath %¾js/autopoint/autopoint.js"></script>
	
"
 
 
		<script type="text/javascript">
		$(function(){ 
           $("#search").cLick,function  e){
                 
	        	   $("#search").autopoint( {
	   				url : '<%=basePqth!%>js/autopoint/MyJsp.jsp',
	`  				submit : [ "search", #action2" M
	   			  });
            });
		});
</script>
	</head>
	<body>
		<input type="text"   id="search" name="searsh"! size="50" 
		       view="search2"  autocomplete="off" >
		<br />
		<br />
		<br />
		<br />
		<br />
		<input id="search2" type="text" size="50" autocomplete="off" />
	</body>

	</body>
</html>
0
