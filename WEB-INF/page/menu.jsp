<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.Constants"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="purview.action.I.PurviewActionI"%>
<%@page import="tool.StringUntilDatabase"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String menu_Fid=StringUntil.getParameter(request,"menu_Fid","");          // 一级菜单编号
String page_menu_ID=StringUntil.getParameter(request,"page_menu_ID",""); // 二级 菜单编号
TUser tu=(TUser)session.getAttribute(Constants.LOGINUSER) ;
if(!StringUntil.chickLogin().equals(""))
{
  out.print(StringUntil.chickLogin());
  return; 
}
WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
PurviewActionI PurviewActionI= (PurviewActionI)wac.getBean("PurviewAtion");
String[] menus  = PurviewActionI.getHeadMenu() ;
%>

 <TABLE border=0 cellspacing=0 cellpadding=0 width=100% class="small" bgcolor="#FFFFFF">
  <tr>
  
  <td valign=top align=left >
  <img src="themes/softed/logo/sibotechLog.gif" alt="vtiger-crm-logo.gif" title="vtiger-crm-logo.gif" border=0 style="width: 15em;height: 4.2em;"></td>
  <td class='small nowrap' align="right" style="padding-right:10px;">
  
  <table border=0 cellspacing=0 cellpadding=0>
    <tr>
      <td valign="top" class="genHeaderSmall" style="padding-left:10px;padding-top:3px;"><span class="userName"> <%=StringUntilDatabase.getGroupNameByID(tu.getDepartmentId().toString(),"")+":"+tu.getReadName()%>(<%=StringUntilDatabase.getRoleUser() %>)【<a href="#" onclick="updateProword();return false;">修改密码</a>】 【<a href="<%=basePath %>">退出</a>】</span> </td>
     
      <td  
    valign="bottom" nowrap style="padding-bottom: 1em;"  class="small" nowrap>
      <a> <img src="themes/softed/images/info.PNG" border=0 style="padding: 0px;padding-left:5px"></a>
    </td>
    <td  valign="bottom" nowrap style="padding-bottom: 1em;" 
	class="small"
	nowrap>
    <img src="themes/softed/images/mainSettings.PNG"  border=0 style="padding: 0px;padding-left:5px "/>
    </td>
    </tr>
  </table>
  </td>
  </tr>
</TABLE>
<div id='miniCal' style='width:300px; position:absolute; display:none; left:100px; top:100px; z-index:100000'></div>
 <TABLE border=0 cellspacing=0 cellpadding=0 width=100% >
  <tr class="hdrTabBg">
    <td style="width:15%;" class='tabUnSelected' align="right"></td>
    <td class=small nowrap>
	<table border=0 cellspacing=0 cellpadding=0>
        <tr>
          <script>
		 function show(menu_ID)
		 {
		    
		    $('tr[id^=mendu_]').hide();
		    $('#'+menu_ID).show();
		 }
		
		</script>
          <td class="tabUnSelected"  align="center" nowrap><a href="index.php?module=Calendar&action=index"></a></td>
          <td class="tabUnSelected"  align="center" nowrap><a href= "index.php?module=Home&action=index&parenttab=My Home Page"> 
          <img src="themes/softed/images/Home.PNG" style="width:16px;height:16px;" border="0" /></a></td>
          <td class="tabSeperator"><img src="themes/softed/images/spacer.gif"></td>
          <td class="tabUnSelected"  align="center" nowrap><a href="#"></a></td>
           <%=menus[0] %>
          <td class="tabUnSelected"  align="center" onMouseOut="fnHide_Event('allMenu');" onMouseOver="fnvshobjMore(this,'allMenu','');" nowrap><a href="javascript:;" >快速导航<img src="themes/softed/images/menuDnArrow.gif" border=0 style="padding-left:5px" /></a></td>
          <td class="tabSeperator"><img src="themes/softed/images/spacer.gif"></td> </tr>
      </table>
	  </td>
  </tr>
  <tr  >
    <td colspan="2" align="center"  style="padding-right:10px;" nowrap ><!--子菜单 没个菜单的子菜单为一行-->
      <table border=0 cellpadding="0" cellspacing="0" class="allMnuTable"  padding="0" 
	  style="border-bottom-width: thick;border-bottom-style: double;border-bottom-color: #578fc8;">
	    <%=menus[1] %>
	  
	  </TABLE>
 </td>
 </tr>
 </TABLE>
<div id="allMenu" onMouseOut="fnHide_Event('allMenu');" onMouseOver="fnvshNrm('allMenu');" 
style="z-index: 2147483647;visibility:hidden;display:block;overflow-x:auto;">
  <table border=0 cellpadding="0" cellspacing="0" class="allMnuTable" padding="0" 
  style="width:20px;">
    <tr>
    <%=menus[2] %>
   </tr>
  </table>
</div>
<style>
<!--
.mb_ {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 120%;
	z-index: -4;
	background-color: #CCCCCC;
	background-attachment: fixed;
	opacity: 0.5; /*设置透明度*/
	-moz-opacity: 0.5; /* Firefox 透明度  有效*/
	filter: alpha(opacity = 50); /*ie透明度*/
}
.mb2_ {
	position:absolute;
	left:300px;
	top:240px;
	width:20%;
	z-index: 5;
	background-color:white;
    
}

.mb3_ {
	position:absolute;
	left:500px;
	top:260px;
	width:25%;
	z-index: 5;
	background-color:white;
    
}
-->
</style>
    <script type="text/javascript">
      function updateProword()
      {
    	   $("#forward1").val("");
           $("#forward2").val("");
           $("#forward3").val("");
           $("#tip").text("");
    	  $('#updateProword').html($('#updateProword2').html());
    	  $('#mb_').attr('style','z-index: 4;');
		  $('#updateProword').show(300);
       }

      function updatepw()
      {
    	   
          var forward1=$("#forward1").val().replace(/[ ]/g,"");
          var forward2=$("#forward2").val().replace(/[ ]/g,"");
          var forward3=$("#forward3").val().replace(/[ ]/g,"");
          
          if(forward1==''||forward2==''||forward3=='')
          {
               alert("每项必填");
               return false;
          }else if(forward2!=forward3)
          {
        	     alert("两次密码输入不一样！");
        	     $("#forward2").val("");
                 $("#forward3").val("");
                 return false;
          }else if($("#tip").text()!="三种"||forward2.length<6)
          {    
               alert("密码强度太弱");
               return false;
          }
          
          $.get("NoChickUserAction_updateProssword.action?pageId"+new Date().getTime(),{"user.loginPossword":forward1,"Newforward":forward2},function(date)
                  {
                         if(date=='1')
                         {
                             alert("原密码不正确！！");
                          }else if(date=="2")
                          {
                                alert("修改密码成功");
                                window.location="<%=basePath%>";
                          }else
                          {
                               alert("修改密码失败！！请稍后再试");
                          }
                    

              });

      }
    </script>
       <script type="text/Javascript">
   var NUMTEST = /[0-9]/;
   var LETTERTEST = /[a-zA-Z]/;
   var OTHERTEST = /[^a-zA-Z0-9]/;
   
    window.onload = function(){
        var tip = document.getElementById('tip');
        var psd = document.getElementById('forward2');
        psd.onkeyup = function(){
            var hasNum = NUMTEST.test(this.value);
            var hasLetter = LETTERTEST.test(this.value);
            var hasOther = OTHERTEST.test(this.value);
            tip.innerHTML = hasNum ? (hasLetter? (hasOther? '三种':'两种'):(hasOther? '两种':'一种')):(hasLetter? (hasNum?('两种'):('一种')):(hasOther?('一种'):(''))); 
        } 
   }
 
  </script>
<div id="mb_"  class="mb_" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
    

   <div id="updateProword" class="mb3_" style="padding: 20px;display: none;">  
 
   <table>
   <tr>
   <td>   用户名：</td>  <td><label><%=tu.getReadName() %></label></td>
   </tr>
      <tr>
   <td>   原密码：</td>  <td> <input type="password" id="forward1"  value=""/></td>
   </tr>
         <tr>
   <td>  新密码：</td>  <td> <input type="password" id="forward2"  value=""/><span  id="tip"></span><br><span>必须包含数字、字母、任意特殊符号</span></td>
   </tr>
    
    <tr>
   <td>  重复密码：</td>  <td> <input type="password" id="forward3"   value=""/></td>
   </tr>
   </table>
	<button class="delete" type="button"   onclick="$('#updateProword,#mb_').hide(100);">关闭</button>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<button id="" class="save" onclick="updatepw();">确定</button>
   
  </div>


<script type="text/javascript">
  if("<%=menu_Fid%>"=="")
  {
	 /** $("tr[id^='mendu_']").eq(0).show();
	  $("td[id^='zMenu_']").eq(0).attr("class","tabSelected");*/
	 // window.location = "index.action?pageRoeid="+new Date().getTime();  
   }else
   {
	   $("#zMenu_<%=menu_Fid%>").eq(0).attr("class","tabSelected"); 
	   $("#mendu_<%=menu_Fid%>").eq(0).show();
   }
 
</script>