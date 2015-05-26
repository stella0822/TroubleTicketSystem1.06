<%@ page language="java" contentType="application/vnd.ms-excel;charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="tool.StringUntil"%>
<%@page import="tool.DownExcel"%>
<%@page import="java.net.URLDecoder"%>
<%
List list=(List)StringUntil.getParameterToobject(request,"list",null);
String page_menu_id=StringUntil.getPage_menu_ID(); 

if(list==null){
	list=(List)StringUntil.getParameterToobject(request,"searchtt",null);
}

if(list==null){
	list=(List)StringUntil.getParameterToobject(request,"list2",null);
}

if(list==null){
	list=(List)StringUntil.getParameterToobject(request,"list0",null);
}

list=DownExcel.exce(page_menu_id,list);
response.setHeader("Content-disposition","attachment; filename="+list.get(0).toString()+".xls"); 
request.setCharacterEncoding("UTF-8");
String heand[]=null;
%>
<html>
<head>
    <meta name="Generator" content="Microsoft Excel 11">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
#stx1 {color:windowtext;   border:5pt solid red; background:#C00000;}
<style>
</head>
<body style="margin-left: 0px;margin-top: 0px;">
<center><b><%=list.get(0).toString() %></b></center>
 <%
 String htmlString="<table border=1 cellpadding=0 cellspacing=0> <tr > ";
          heand=(String[])list.get(1); 
           
           for(String h:heand)
           {
        	 htmlString+="<td  ><center  >"+h+"</center></td>";  
           }
           htmlString+="</tr>";
     if(list.size()>2)
     {
       for(int i=2;i<list.size();i++)
       { 
    	   heand=(String[])list.get(i); 
    	   
     
    	   htmlString+="<tr>";
 
              for(String h:heand)
               {
            	  htmlString+="<td class='stx1'>"+h+"</td>";  
               }
              htmlString+="</tr>";
 
       }
     }
     htmlString+="</table>";
     %>
<%=htmlString%>
</body>
</html>