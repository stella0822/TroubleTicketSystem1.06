<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tool.StringUntil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String a=StringUntil.getParameter(request,"date","");
System.out.println(a);
out.print("{\"success\":false,\"message\":\"此用户名不可用!\"}");
%>