<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
 
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="ttmanage.action.I.TTManageSearchActionI"%>
<%@page import="ttmanage.database.TTroubleticket"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String page_MENU_ID="1";

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
TTManageSearchActionI sch=(TTManageSearchActionI)wac.getBean("TTManageSearchActionImp");
List list0=sch.TTManageSearchAction_getAll();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>故障单管理--新建故障单</title>

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
	left:500px;
	top:260px;
	width:25%;
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
						<form action="<%=basePath %>TTManageAdd_Add.action?<%=StringUntil.menuUrl("185")%>" method="get" >
						
						
						
						<table border=0 cellspacing=0 cellpadding=0 width=95% align=center>
    <tr>
      <td><table border=0 cellspacing=0 cellpadding=3 width=100% class="small">
          <tr>
            <td class="dvtTabCache" style="width:10px" nowrap>&nbsp;</td>
            <td class="dvtSelectedCell" align=center nowrap> 故障单 信息</td>
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
							type="submit" name="button" value="  保存  " style="width:70px" >
                            <input title="取消 [Alt+X]" accessKey="X" class="crmbutton small cancel" 
                            onClick="deletefiles(); window.location='TTManage_Search.action?menu_Fid=68&page_menu_ID=75'" type="button" name="button" value="取消  " style="width:70px">
                          </div></td>
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
					 
						 自动生成编号 
                        </td>
                         
                      </tr>
					          <tr style="height:25px">
                     
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>标题 </td>
                        <td align=left colspan="3" class="dvtCellInfo"><input type="text" tabindex="" name="tt.title"   
						id ="ticket_no" style="display:block; width:87%"
						value=""   onFocus="this.className='detailedViewTextBoxOn'" 
						onBlur="this.className='detailedViewTextBox'" class=":required">
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right>  状态 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<select disabled="disabled" tabindex="" class="small" style="display:block; width:90%">
                        	<%=StringUntilDatabase.getDepartmenOption("4","16") %>
                        	</select>
                        </td>

                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> 优先级 </td>
                        <td width="30%" align=left class="dvtCellInfo">
							<select name="tt.priority" tabindex="" class="small" style="display:block; width:90%">
                        	<%=StringUntilDatabase.getDepartmenOption("5","23") %>
                        	</select>
                        </td>

                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>产品名称 </td>
                        <td width="30%" align=left class="dvtCellInfo">
                        
				<input name="tt.proId" id="product_id" type="hidden" value="">
				<input name="product_name" id="product_name" readonly="readonly" type="text" value="" class=":required">&nbsp;
				<img tabindex="" src="themes/softed/images/select.gif" alt="Select" title="Select" LANGUAGE=javascript onclick='return window.open("TTManage_Create_addpro.action","test","width=640,height=640,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
				<input type="image" src="themes/softed/images/clear_field.gif" alt="Clear" title="Clear" LANGUAGE=javascript onClick="this.form.product_id.value=''; this.form.product_name.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			
                        </td>
                        <td width=20% class="dvtCellLabel" align=right>分配给 </td>
                        <td width=30% align=left class="dvtCellInfo">
                        
				<input name="tt.chargeId" id="user_id" type="hidden" value="">
				<input name="user_name" id="user_name" readonly="readonly" type="text" value="">&nbsp;
				<img tabindex="" src="themes/softed/images/select.gif" alt="Select" title="Select" LANGUAGE=javascript onclick='return window.open("TTManage_Create_adduser.action","test","width=640,height=640,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
				<input type="image" src="themes/softed/images/clear_field.gif" alt="Clear" title="Clear" LANGUAGE=javascript onClick="this.form.user_id.value=''; this.form.user_name.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			
                        </td>
                      </tr>
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font> 联系人 </td>
                        <td width="30%" align=left class="dvtCellInfo">
						<input type="text" style="display:block; width:87%"  name="tt.contactName" id ="hours" value="" size="20"
						 onFocus="this.className='detailedViewTextBoxOn'"
						 onBlur="this.className='detailedViewTextBox'" class=":required">
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right><font color="red">*</font>联系方式 </td>
                        <td width="30%" align=left class="dvtCellInfo"><input type="text"   name="tt.contactPhonenum" id ="hours" value="" style="display:block; width:87%"
						  onFocus="this.className='detailedViewTextBoxOn'"
						 onBlur="this.className='detailedViewTextBox'" class=":required">
                        </td>
                      </tr>
                      
                      <tr style="height:25px">
                        <td width="20%" class="dvtCellLabel" align=right> 公司名称 </td>
                        <td width="30%" align=left class="dvtCellInfo">
                        
				<input name="tt.corpId" id="corp_id" type="hidden" value="">
				<input name="corp_name" id="corp_name" readonly="readonly" type="text" value="">&nbsp;
				<img tabindex="" src="themes/softed/images/select.gif" alt="Select" title="Select" LANGUAGE=javascript onclick='return window.open("TTManage_Create_addcorp.action","test","width=640,height=640,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
				<input type="image" src="themes/softed/images/clear_field.gif" alt="Clear" title="Clear" LANGUAGE=javascript onClick="this.form.corp_id.value=''; this.form.corp_name.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			
                        </td>
                        <td width="20%" class="dvtCellLabel" align=right> 创建人 </td>
                        <td width="30%" align=left class="dvtCellInfo"><label>自动生成</label>
                        </td>
                      </tr>
                      <tr style="height:25px">  
                        <td width="20%" class="dvtCellLabel" align=right><font color="red"></font> 创建时间 </td>
                        <td width="30%" align=left class="dvtCellInfo"><label>自动生成</label>
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
						<textarea  tabindex="" 
						onFocus="this.className='detailedViewTextBoxOn'" name="tt.description"  onBlur="this.className='detailedViewTextBox'" 
						cols="90" rows="8" class=":required"></textarea>
                        </td>
                      </tr>
					  <!--附件-->
<script type="text/javascript"> 
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
	
 </script>				  
					   <tr>
                        <td colspan=4 class="detailedViewHeader"><b>附件</b> </td>
                      </tr>
                       <tr style="height:25px">
										<td width=20% class="dvtCellLabel" align=right >
										<font color="red"></font>附件列表 </td>
										<td colspan=3 valign="top" class="dvtCellInfo" >
&nbsp;						
<ul id="selectable">
</ul><%--
修改后名称
--%><input type="hidden" id="fileNamelist" value="" name="doc.newName"><%--
真实名称
--%><input type="hidden" id="fileNamelist2" value="" name="doc.oldName">

					</td>
                   </tr>
               <tr style="height:25px">
                        <!-- In Add Comment are we should not display anything -->
                        <td width=20% class="dvtCellLabel" align=right><font color="red"></font>附件 </td>
                        <td colspan=3 class="dvtCellInfo">
                         <s:file id="file" name="file"  ></s:file> 
                         <input name="" type="button" value="上传" style="height: 18.5px" onclick="ajaxFileUpload();"> 
                         <img src="img/loading.gif" id="loading" style="display: none;">
						 <label id="f1"></label>
                        </td>
                      </tr>
                      
                      
					     <tr>
                        <td  colspan=4 style="padding:5px"><div align="center">
                            <input title="保存 [Alt+S]" accessKey="S" class="crmbutton small save" type="submit"
							 name="button" value="  保存  " style="width:70px" >
                            <input title="取消 [Alt+X]" accessKey="X" class="crmbutton small cancel" onClick="deletefiles(); window.location='TTManage_Search.action?menu_Fid=68&page_menu_ID=75'" type="button" 
							name="button" value="  取消  " style="width:70px">
							
                          </div></td>
                      </tr>
                      <!-- This is added to display the existing comments -->
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
