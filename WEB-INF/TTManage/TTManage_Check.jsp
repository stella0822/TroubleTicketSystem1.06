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
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String page_MENU_ID="1";

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
TTManageSearchActionI sch=(TTManageSearchActionI)wac.getBean("TTManageSearchActionImp");
List list0=(List)request.getAttribute("searchtt");
TTroubleticket tt= (TTroubleticket)list0.get(0);
String strDes=tt.getDescription();
if(strDes!=null&&strDes.indexOf("\n")!=-1){
	strDes=strDes.replaceAll("\n","<br>");
}
String strSol=tt.getSolution();
if(strSol!=null&&strSol.indexOf("\n")!=-1){
	strSol=strSol.replaceAll("\n","<br>");
}

List list1=(List)request.getAttribute("searchtt2");

List list2=(List)request.getAttribute("searchtt3");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>故障单管理--查看故障单</title>

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
            <td class="dvtSelectedCell" align=center nowrap> 故障单信息</td>
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
                           <input title="返回 [Alt+X]" accessKey="X" class="crmbutton small cancel" onClick="window.location='TTManage_Search.action?menu_Fid=68&page_menu_ID=75'" type="button" name="button" 
							value="返回 " style="width:70px">
<%
if(tt.getStatus()==20)
{
 %>
							<input title="转入FAQ" class="crmbutton small save"
							onclick="convertToFAQ('<%=tt.getTitle() %>',' ','<%=tt.getId() %>')"
							type="button" name="button" value="  转入FAQ  " style="width:70px;" >
<%} %>               
							</div></td>
<script type="text/javascript"> 
function convertToFAQ(title,des,ttid)
{
	$('#mb').attr('style','z-index: 4;');
	$("#tt_titleFAQ").val(title);
	$("#tt_desFAQ").val(des);
	$('#faqGroup').show(100);
	$("#faq_ttid").val(ttid);
}

function check_radio(type)
{
	switch(type){
		case 1:
			$("#level1").attr("checked","checked");
			$("#faqLevel").val("1");
			break;
		case 2:
			$("#level2").attr("checked","checked");
			$("#faqLevel").val("2");
			break;
		case 3:
			$("#level3").attr("checked","checked");
			$("#faqLevel").val("3");
			break;
	}
}
</script>						
                      </tr>
                      <!-- included to handle the edit fields based on ui types -->
                      <!-- This is added to display the existing comments -->
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>故障单信息</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <td width=20% class="dvtCellLabel" align=right>
						<font color="red"></font>故障单编号 </td>
                        <td   colspan="3" align=left class="dvtCellInfo">
					    	<%=tt.getTtNo() %>
                        </td>
                         
                      </tr>
					          <tr style="height:25px">
                     
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>标题 </td>
                        <td align=left colspan="3" class="dvtCellInfo">
							<%=tt.getTitle() %>
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right>  状态 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntilDatabase.getTextByid(tt.getStatus()) %>
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> 优先级 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntilDatabase.getTextByid(tt.getPriority()) %>
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>产品名称 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntilDatabase.getProNameByID(tt.getProId()) %>
						</td>
						<td width=20% class="dvtCellLabel" align=right>分配给 </td>
                        <td width=30% align=left class="dvtCellInfo">
							<%=StringUntilDatabase.getUserRnameByID(tt.getChargeId()) %>
						</tr>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font> 联系人 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=tt.getContactName() %>
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>联系方式 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=tt.getContactPhonenum() %>
                        </td>
                      </tr>
                      <tr style="height:25px;display:none"   >
                        <td width="20%" class="dvtCellLabel" align=right> 负责部门 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=tt.getChargeId() %>
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font>负责人 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntilDatabase.getUserRnameByID(tt.getChargeId()) %>
                        </td>
                      </tr>
                      <tr style="height:25px">
                      <td width="20%" class="dvtCellLabel" align=right> 公司名称 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntilDatabase.getCorpNameByid(tt.getCorpId())%>
						</td>
                        <td width="20%" class="dvtCellLabel" align=right> 创建人 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=StringUntilDatabase.getUserRnameByID(tt.getCreateId()) %>
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> 创建时间 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<%=tt.getCreateTime() %>
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
for(i=0;i<list1.size();i++){
	TDocument tt2= (TDocument)list1.get(i);
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
                            <%=tt.getComment() %>
                          </div></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      
                      
                      <!-- Added to display the Product Details in Inventory-->
                      <tr>
                        <td  colspan=4 style="padding:5px">
						<div align="center">
                            <input title="返回[Alt+X]" accessKey="X" class="crmbutton small cancel" onClick="window.location='TTManage_Search.action?menu_Fid=68&page_menu_ID=75'" 
							type="button" 
							name="button" value="  返回  " style="width:70px">
<%
if(tt.getStatus()==20)
{
 %>
							<input title="转入FAQ" class="crmbutton small save"
							onclick="convertToFAQ('<%=tt.getTitle() %>','<%=tt.getDescription() %>','<%=tt.getId() %>')"
							type="button" name="button" value="  转入FAQ  " style="width:70px;" >
<%} %>    
							</div></td>
                      </tr>
					  <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>工单操作历史记录</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr  >
                       <td colspan=4    > 
					     <table border=0 cellspacing=1 cellpadding=3 width=100% class="lvt small">
						 <tr>
                      <td width="20%" class="lvtCol"><a href='javascript:;'  class='listFormHeaderLinks'>操作时间</a></td>
                      <td width="20%" class="lvtCol"><a href='javascript:;'  class='listFormHeaderLinks'>操作人</a></td>
                      <td class="lvtCol"><a href='javascript:;'  class='listFormHeaderLinks'>备注</a></td>
                     
                    </tr>
<%
int j;
for(j=0;j<list2.size();j++){
	TTtHistory tt2= (TTtHistory)list2.get(j);
%>
					  <tr bgcolor=white onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData'" id="row_38">
                      <td><%=tt2.getUpdateDate() %></td>
                      <td><%=StringUntilDatabase.getUserRnameByID(tt2.getUpdateUserId()) %></td>
                      <td><%=tt2.getComment() %></td>
					   </tr>
<%} %>					    
					     </table>
					   
                        </td>
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
		
<!--
FAQ
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="faqGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
 <form id="" action="<%=basePath %>FAQAction_save.action" method="post" >
   <br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;标题：&nbsp;&nbsp;&nbsp;
   	<input type="text" id="tt_titleFAQ" name="faq.title"/><br /><br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;关键字：
   	<input type="text" id="keyFAQ" name="faq.keyword"/><br /><br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;补充描述：&nbsp;<br />
   	&nbsp;&nbsp;<textarea id="tt_desFAQ" name="faq.text"></textarea><br /><br />
   	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;共享级别：
   	<input type="hidden" id="faqLevel" name="faq.sharingLevel" value="1"/>
   	<input type="hidden" id="faq_ttid" name="faq.ttid" value=""/>
   	<input type="radio" id="level1" name="level" checked onclick="check_radio(1)">&nbsp; &nbsp; &nbsp;个人
   	<input type="radio" id="level2" name="level" onclick="check_radio(2)">&nbsp; &nbsp; &nbsp;部门
   	<input type="radio" id="level3" name="level" onclick="check_radio(3)">&nbsp; &nbsp; &nbsp;全部<br /><br />
     &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
	<input class="delete" type="button" value="关闭" onclick="$('#faqGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="deleteMenuSave" class="save" type="submit" value="确定" onclick=""/>
</form>
  </div>

	</body>
</html>
