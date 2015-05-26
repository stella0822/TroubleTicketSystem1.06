<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <title>Administrator - 故障单 - vTiger CRM系统</title>
<link REL="SHORTCUT ICON" HREF="themes/images/vtigercrm_icon.ico">
<style type="text/css">
@import url("themes/softed/style.css?v=5.4.0");
</style>
<!-- ActivityReminder customization for callback -->
<style type="text/css">
div.fixedLay1 { position:fixed; }
</style>
<!--[if lte IE 6]>
	<style type="text/css">div.fixedLay { position:absolute; }</style>
	<![endif]-->
<style type="text/css">
	div.drop_mnu_user { position:fixed; }
 
body {
	background-color: #FAFAFA;
}
 
</style>
<!--[if lte IE 6]>
	<style type="text/css">div.drop_mnu_user { position:absolute; }</style>
	<![endif]-->
<!-- End -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
