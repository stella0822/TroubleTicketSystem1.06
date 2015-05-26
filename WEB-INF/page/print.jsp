<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
   <head>  
        <title></title>  
   </head>  
   <script type="text/javascript" src="js/jquery-1.8.3.js"></script>  
   <script type="text/javascript" src="js/jquery.PrintArea.js"></script>  
   <body>  
        <input id="btnPrint" type="button" value="打印"/>  
        <div id="myPrintArea">  
           ====打印区域====   
       </div>  
   </body>  
   <script type="text/javascript">  
        $(function(){             //打印   
            $("#btnPrint").bind("click",function(event){   
                $("#myPrintArea").hide().printArea();   
            });   
       });   
    </script>  
</html>  
