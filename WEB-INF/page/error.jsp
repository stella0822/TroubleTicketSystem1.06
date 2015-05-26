<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="tool.Constants"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String statString=StringUntil.getParameter(request,Constants.errorState,"操作失败请重试！！！！");
//statString=session.getAttribute(Constants.errorState).toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
  </head>
  
  <body id="body">
    <script type="text/javascript">
    
    alert('<%=statString %>');

    function GetCurrentStyle (obj, prop) {     
        if (obj.currentStyle) {        
            return obj.currentStyle[prop];     
        }      
        else if (window.getComputedStyle) {        
            propprop = prop.replace (/([A-Z])/g, "-$1");           
            propprop = prop.toLowerCase ();        
             return document.defaultView.getComputedStyle (obj,null)[prop];     
        }      
        return null;  
    }   
    var dd=document.getElementById("body");   
    //alert(GetCurrentStyle(dd,"overflow"));  




    
    //top.location="index.action?pageRoeid="+new Date().getTime();
    top.location="_login_.action?pageRoeid=1364372256187";
    </script>
  </body>
</html>
