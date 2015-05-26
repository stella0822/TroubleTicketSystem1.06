<%@ page contentType="image/jpeg" import="tool.chickImg.*" %>
<%@page import="tool.chickImg.RandImgCreater"%>

<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
RandImgCreater rc=null;
try{
  rc = new RandImgCreater(response);
  String rand = rc.createRandImage();
  session.setAttribute("rand",rand);
}catch(Exception e)
{
	System.out.println(e.getMessage());	
}
 out.clear();   
 out = pageContext.pushBody();  
%>
