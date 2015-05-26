<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
 
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="ttmanage.action.I.TTManageSearchActionI"%>
<%@page import="ttmanage.database.TTroubleticket"%>
<%@page import="ttmanage.database.TDocument"%>
<%@page import="ttmanage.database.TTtHistory"%>
<%@page import="tool.Constants"%>

<%@page import="FAQ.dao.imp.TFaq"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String page_MENU_ID="1";

List list0=(List)request.getAttribute("listfaq");
TFaq tfaq= (TFaq)list0.get(0);

List list1=(List)request.getAttribute("listtt");
TTroubleticket ttroubletkt= (TTroubleticket)list1.get(0);

String strDes=ttroubletkt.getDescription();
if(strDes!=null&&strDes.indexOf("\n")!=-1){
	strDes=strDes.replaceAll("\n","<br>");
}
String strSol=ttroubletkt.getSolution();
if(strSol!=null&&strSol.indexOf("\n")!=-1){
	strSol=strSol.replaceAll("\n","<br>");
}

List list2=(List)request.getAttribute("listdoc");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>故障单管理--查看FAQ</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="styles.css">
		<!-- ActivityReminder customization for callback -->
		<style type="text/css">
div.fixedLay1 {
	position: fixed;
}
</style>


<style>
	#feedback { font-size: 1.4em; }
	#selectable .ui-selecting { background: #FECA40; }
	#selectable .ui-selected { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0; list-style:none;}
	#selectable li { margin: 3px; padding: 1px; float: left; width: 230px; height: 30px; font-size: 1em; text-align: left; list-style-type:none; list-style:none;}
</style>

		<!--[if lte IE 6]>
	<style type="text/css">div.fixedLay { position:absolute; }</style>
	<![endif]-->
		<style type="text/css">
div.drop_mnu_user {
	position: fixed;
}

body {
	background-color: #FAFAFA;
}

strong,table {
	font-size: 12px;
}



.mb {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: -4;
	background-color: #CCCCCC;
	background-attachment: fixed;
	opacity: 0.5; /*设置透明度*/
	-moz-opacity: 0.5; /* Firefox 透明度  有效*/
	filter: alpha(opacity = 50); /*ie透明度*/
}

.mb2 {
	position:absolute;
	left:300px;
	top:240px;
	width:20%;
	z-index: 5;
	background-color:white;
    
}

.mb3 {
	position:absolute;
	left:450px;
	top:260px;
	width:30%;
	z-index: 5;
	background-color:white;
    
}

</style>
		<!--[if lte IE 6]>
	<style type="text/css">div.drop_mnu_user { position:absolute; }</style>
	<![endif]-->
		<!-- End -->
		<!-- header -->
		<!-- header-vtiger crm name & RSS -->
		<!-- header -->
		<!-- header-vtiger crm name & RSS -->
		<script language="JavaScript" type="text/javascript" src="include/js/general.js?v=5.4.0"></script>
		<!-- vtlib customization: Javascript hook -->
		<script language="JavaScript" type="text/javascript"
			src="include/js/vtlib.js?v=5.4.0"></script>
		<!-- END -->
		<script type="text/javascript"
			src="include/jquery/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="include/jquery/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="include/js/checkDate.js"></script>
		<script type="text/javascript" src="include/js/showdate.js"></script>
		<link rel="stylesheet" href="themes/softed/style.css" type="text/css"></link>
		
		<link rel="stylesheet" href="<%=basePath %>js/autopoint/autopoint.css" type="text/css"></link>
        <script src="<%=basePath %>js/autopoint/autopoint.js"></script>
 
	<script src="js/chickFrom/vanadium.js"></script>
	<link rel="stylesheet" href="js/chickFrom/css/chickFrom.css" type="text/css"></link>

		<script type="text/javascript" src="js/ajaxfileupload.js"></script>

	</head>
	<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small>
		<!-- header - master tabs -->
		<%--
 菜单
--%>
		<jsp:include page="../page/menu.jsp" flush="true">
        <jsp:param value="<%=page_MENU_ID %>" name="page_MENU_ID"/>
		</jsp:include><%--
网页body
--%>

		<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="17%" valign=top>
					&nbsp;
				</td>
				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->

					<div id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px;">
						<form action="<%=basePath %>" method="get" >
						
						
						
						<table border=0 cellspacing=0 cellpadding=0 width=95% align=center>
    <tr>
      <td><table border=0 cellspacing=0 cellpadding=3 width=100% class="small">
          <tr>
            <td class="dvtTabCache" style="width:10px" nowrap>&nbsp;</td>
            <td class="dvtSelectedCell" align=center nowrap> FAQ信息</td>
            <td class="dvtTabCache" style="width:10px">&nbsp;</td>
            <td class="dvtTabCache" style="width:100%">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td valign=top align=left ><table border=0 cellspacing=0 cellpadding=3 width=100% class="dvtContentSpace">
          <tr>
            <td align=left><table border=0 cellspacing=0 cellpadding=0 width=100%>
                <tr>
                  <td id ="autocom"></td>
                </tr>
                <tr>
                  <td style="padding:10px"><!-- General details -->
                    <table border=0 cellspacing=0 cellpadding=0 width=100% class="small">
                      <tr>
                        <td  colspan=4 style="padding:5px"><div align="center">
                           <input title="返回 [Alt+X]" accessKey="X" class="crmbutton small cancel" onClick="window.location='FAQ_list.action?menu_Fid=70&page_menu_ID=80'" type="button" name="button" 
							value="返回 " style="width:70px">
              
							</div></td>
						
                      </tr>
                      <!-- included to handle the edit fields based on ui types -->
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>FAQ信息</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <td width=20% class="dvtCellLabel" align=right>
						<font color="red"></font>FAQ编号 </td>
                        <td   colspan="3" align=left class="dvtCellInfo">
					    	<%=tfaq.getId() %>
                        </td>
                         
                      </tr>
					          <tr style="height:25px">
                     
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>标题 </td>
                        <td align=left colspan="3" class="dvtCellInfo">
							<%=tfaq.getTitle() %>
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right>  关键字 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntil.isNull(tfaq.getKeyword()) %>
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> 共享级别 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntil.getFAQname(tfaq.getSharingLevel()) %>
                        </td>
                      </tr>
                      
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right>
						<font color="red">*</font> 补充描述 </td>
                        <td colspan=3 class="dvtCellInfo">
							<%=StringUntil.isNull(tfaq.getText()) %>
                        </td>
                      </tr>
                      
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>详细信息</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right>
						<font color="red">*</font> 描述 </td>
                        <td colspan=3 class="dvtCellInfo">
						<%=strDes %>
                        </td>
                      </tr>
                      
					  <!--附件-->
					   <tr>
                        <td colspan=4 class="detailedViewHeader"><b>附件</b> </td>
                      </tr>
                       <tr style="height:25px">

										<td width=20% class="dvtCellLabel" align=right >
										<font color="red"></font>附件列表 </td>
										<td colspan=3 valign="top" class="dvtCellInfo" >
<ul id="selectable">
<%
int i;
String pathstr;
String[] pathstr2=new String[2];
for(i=0;i<list2.size();i++){
	TDocument tt2= (TDocument)list2.get(i);
	pathstr=tt2.getNewName().toString();
	pathstr2=pathstr.split("\\.");
	pathstr=pathstr2[0];
%>
<li id="<%=pathstr %>" class='ui-state-default'>【<a href='download.action?fileName=<%=tt2.getNewName() %>' ><%=tt2.getOldName() %></a>】</li>
<%} %>
</ul>
</td>
                   </tr>
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>解决方案详情</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right><font color="red"></font> 解决方案 </td>
                        <td colspan=3 class="dvtCellInfo">
							<%=strSol %>
                        </td>
                      </tr>
					     
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan=4 class="dvInnerHeader"><b>备注信息</b> </td>
                      </tr>
                      <tr>
                        <td colspan=4 class="dvtCellInfo"><div id="comments_div" style="overflow: auto;height:200px;width:100%;">
                            <%=ttroubletkt.getComment() %>
                          </div></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      
                      
                      <!-- Added to display the Product Details in Inventory-->
                      <tr>
                        <td  colspan=4 style="padding:5px">
						<div align="center">
                            <input title="返回[Alt+X]" accessKey="X" class="crmbutton small cancel" onClick="window.location='FAQ_list.action?menu_Fid=70&page_menu_ID=80'" 
							type="button" 
							name="button" value="  返回  " style="width:70px">

							</div></td>
                      </tr>
					  <tr>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
						
						
						
						</form>
						
					</div>
				</td>
				<td width="17%">
				</td>
			</tr>
		</table>


		<%--
网页body
--%>
		<jsp:include page="../page/down.jsp" flush="true"></jsp:include>
		


	</body>
</html>
