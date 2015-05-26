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
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		<title>故障单管理--编辑FAQ</title>

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
						<form action="<%=basePath %>FAQAction_Update.action" method="get" >
						
						
						
						<table border=0 cellspacing=0 cellpadding=0 width=95% align=center>
    <tr>
      <td><table border=0 cellspacing=0 cellpadding=3 width=100% class="small">
          <tr>
            <td class="dvtTabCache" style="width:10px" nowrap>&nbsp;</td>
            <td class="dvtSelectedCell" align=center nowrap> FAQ信息——<%=ttroubletkt.getTtNo() %></td>
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
                        <input title="保存 [Alt+S]" accessKey="S" class="crmButton small save" 
							onclick="this.form.action.value='Save'; displaydeleted(); return formValidate() " type="submit" name="button" value="  保存  " style="width:70px" >
                           <input title="返回 [Alt+X]" accessKey="X" class="crmbutton small cancel" onClick="deletefiles(); window.location='FAQ_list.action?menu_Fid=70&page_menu_ID=80'" type="button" name="button" 
							value="返回 " style="width:70px">
              
							</div></td>
						
                      </tr>
<script type="text/javascript">  
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
                        <td   align=left class="dvtCellInfo">
					    	<input name="faq.id" value="<%=tfaq.getId() %>" readonly style="width: 190px">
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>标题 </td>
                        <td align=left  class="dvtCellInfo">
							<input name="faq.title" value="<%=tfaq.getTitle() %>" style="width: 190px">
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right>  关键字 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<input name="faq.keyword" value="<%=StringUntil.isNull(tfaq.getKeyword()) %>" style="width: 190px">
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> 共享级别 </td>
                        <td width="30%" align=left class="dvtCellInfo">
	<input type="radio" id="level1" name="level" checked onclick="check_radio(1)">个人
   	<input type="radio" id="level2" name="level" onclick="check_radio(2)">部门
   	<input type="radio" id="level3" name="level" onclick="check_radio(3)">全部
							<input type="hidden" id="faqLevel" name="faq.sharingLevel" value="<%=tfaq.getSharingLevel() %>"/>
                        </td>
                      </tr>
                      
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right>
						<font color="red">*</font> 补充描述 </td>
                        <td colspan=3 class="dvtCellInfo">
							<textarea class="detailedViewTextBox" onFocus="this.className='detailedViewTextBoxOn'" name="faq.text" 
						 onBlur="this.className='detailedViewTextBox'"><%=StringUntil.isNull(tfaq.getText()) %></textarea>
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
<script type="text/javascript"> 
function convertToFAQ(title,des)
{
	$('#mb').attr('style','z-index: 4;');
	$("#tt_titleFAQ").val(title);
	$("#tt_desFAQ").val(des);
	$('#faqGroup').show(100);
}


// 上传文件
	function ajaxFileUpload()
	{ 
		
	if ($("#file").val()!="") {// 判断 文件是否 选择 如果选择 则执行 文件上传 否则不执行
    var m="";
		$("#loading").show();
         $.ajaxFileUpload
		 (
			{
				url:'upload.action',//用于文件上传的服务器端请求地址
				secureuri:false,//一般设置为false
				fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
				dataType: 'json',//返回值类型 一般设置为json
				success: function (data, status)  //服务器成功响应处理函数
				{
					 //alert(data.message+"      +++");//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
				     m=data.message;
					if(typeof(data.error) != 'undefined')
					{
						if(data.error != '')
						{
							alert(data.error);
						}else
						{
							alert(data.message);
						}
						return ;
					}
				 	$("#loading").hide();
					if ( m.lastIndexOf(".")!=-1  ) 
					{  /// 上传成功
						 var href= $("#downA").attr("href");
						 var fileNames=m.split(",");
						 //fileNames[0]真实名称，fileNames[1]修改后名称 
						 $("#downA").attr("href",href+fileNames[1]);
						  var path2=fileNames[1].split(".");
						  var h="<li id=\""+path2[0]+"\" class='ui-state-default'>【"+fileNames[0]+"】<a href='#'  onclick=\"delUpload('"+fileNames[1]+"','"+fileNames[0]+"');return false;\" >删除</a></li>";
						  
						  $("#selectable").append(h);
						   
 
						  $("#fileNamelist").val($("#fileNamelist").val()+fileNames[1]+",");
						  $("#fileNamelist2").val($("#fileNamelist2").val()+fileNames[0]+","); 
						  
 	}else
					{
					  $("#f1").text(m); // 显示错误信息
				     } 
				},
				error: function (data, status, e)//服务器响应失败处理函数
				{
					alert(e);
				}
			}
			)
	}else
		{
			 //$("#form1").submit();

	    }
		return false;
	}

function deletefiles(){
var list=($("#fileNamelist").val()).split(",");
var i;
for(i=0;i<list.length-1;i++){
     delUpload( list[i]);
}
		}

       function delUpload(path,path0)
       {
               $.post("FileAction_del.action",{
                        "path":"interim/upload/"+path
                   },function(data){
                       var path2=path.split(".");
                       $("#"+path2[0]).remove();
                       
                       var str1=$("#fileNamelist").val();
                       var str2=$("#fileNamelist2").val();
                       path=path+",";
                       path0=path0+",";
                       str1=str1.split(path)[0]+str1.split(path)[1];
                       str2=str2.split(path0)[0]+str2.split(path0)[1];
					$("#fileNamelist").val(str1);
					$("#fileNamelist2").val(str2);
                         });
           

        }

function deletedoc(doc_newname,doc_oldname,t)
{
	$('#mb').attr('style','z-index: 4;');
	$('#deleteGroup').show(100);
	//alert(doc_oldname);
	//alert(doc_newname);
	$('#deletename').val(doc_oldname);
	$('#delete_realname').val(doc_newname);
}  

function delUpload2(path)
{
        $.post("FileAction_del.action",{
                 "path":"upload/"+path
            },function(data){
                var path2=path.split(".");
                $("#"+path2[0]).remove();

                  });
        
        $('#deleteGroup,#mb').hide(100);
        
        $.post("FileAction_deldoc.action",{
            "docpath":path
       },function(data){
alert(data);
             });

 }

function saveComments(id)
{
	var str=$('#forSaveComments').val();
	$.post("TTManageUpdate_UpdateComments.action",{
        "comments":str,"ttIdComments":"<%=ttroubletkt.getTtNo() %>","ttId":id
   },function(data){
       var str=data.split("*");
       alert(str[1]);
       $('#comments_div').html(str[0]);
       $('#forSaveComments').val(" ");
         });
}

</script>
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
<li id="<%=pathstr %>" class='ui-state-default'>【<a href='download.action?fileName=<%=tt2.getNewName() %>' ><%=tt2.getOldName() %></a>】<a href='#' onclick="deletedoc('<%=tt2.getNewName() %>','<%=tt2.getOldName() %>','<%=ttroubletkt.getTtNo()%>');return false" >删除</a></li>
<%} %>
</ul><%--
修改后名称
--%><input type="hidden" id="fileNamelist" value="" name="doc.newName"><%--
真实名称
--%><input type="hidden" id="fileNamelist2" value="" name="doc.oldName">
<input type="hidden" id="" value="<%=ttroubletkt.getId() %>" name="ttid">
</td>
                   </tr>
               <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right><font color="red"></font>附件 </td>
                        <td colspan=3 class="dvtCellInfo">
                         <s:file id="file" name="file" ></s:file> 
                         <input name="" type="button" value="上传" style="height: 18.5px" onclick="ajaxFileUpload();"> 
                         <img src="img/loading.gif" id="loading" style="display: none;">
						 <label id="f1"></label>
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
                      <tr>
                        <td colspan=4 class="detailedViewHeader"><b>备注</b> </td>
                      </tr>
                      <!-- Handle the ui types display -->
                      <!-- Added this file to display the fields in Create Entity page based on ui types  -->
                      <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right><font color="red"></font> 添加备注 </td>
                        <td colspan=3 class="dvtCellInfo">
						
						 <textarea class="detailedViewTextBox" onFocus="this.className='detailedViewTextBoxOn'" id="forSaveComments" 
						 onBlur="this.className='detailedViewTextBox'"></textarea>
						 <div align="center">
                            <input title="保存 [Alt+S]" accessKey="S" class="crmButton small save" 
							onClick="saveComments('<%=ttroubletkt.getId() %>')" type="button" name="button" value=" 保存备注    " style="width:75px">
                          </div>
                          
                        </td>
                      </tr>
                      
                      <!-- Added to display the Product Details in Inventory-->
                      
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

 <!--
删除附件
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="deleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <br />
    <input type="hidden" id="delete_realname" name="delete_realname" value=""/>
	&nbsp; &nbsp; &nbsp;
	&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;附件名称：&nbsp; &nbsp; &nbsp;
	<input type="text" disabled="disabled" id="deletename" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;确认删除该附件吗？
	 <br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#deleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="deleteMenuSave" class="save" type="submit" value="删除" onclick="delUpload2($('#delete_realname').val())"/>
  </div> 
  
		<%--
网页body
--%>
		<jsp:include page="../page/down.jsp" flush="true"></jsp:include>
		


	</body>
	<script type="text/javascript">check_radio(<%=tfaq.getSharingLevel()%>)</script>
</html>
