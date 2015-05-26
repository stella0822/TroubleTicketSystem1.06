<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>基础配置_产品数据</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
	<link rel="stylesheet" type="text/css" href="styles.css">
 
 
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
strong,table{
   font-size: 12px;
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
<script language="JavaScript" type="text/javascript" src="include/js/vtlib.js?v=5.4.0"></script>
<!-- END -->
<script type="text/javascript" src="include/jquery/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="include/jquery/jquery-1.4.js"></script>
<script type="text/javascript" src="include/js/checkDate2.js"></script>
<script type="text/javascript" src="include/js/showdate.js"></script>
  <link rel="stylesheet" href="themes/softed/style.css" type="text/css"></link>
 
  </head>
  <body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small> 
    <!-- header - master tabs -->
  <%--
 菜单
--%>
  <jsp:include page="../page/menu.jsp" flush="true"></jsp:include><%--
网页body
--%>
<table width=100% border=0 align=center cellpadding=0 cellspacing=0 >
  <tr>
    <td width="17%" valign=top>&nbsp;</td>
    <td class="showPanelBg" valign="top" style="padding:13px;"><!-- SIMPLE SEARCH -->
    
      <div id="searchAcc" class="searchUIBasic small" style="display: block;position:relative;margin:10px;">
      <table   width=100% border=0 align=center cellpadding=0 cellspacing=2 >
        <tr height="26px">
          <td><div align="right"><strong>标题</strong></div></td>
          <td>
		  <input type="text"   name="hours" id ="hours" value="" size="20"
			 class=detailedViewTextBox onFocus="this.className='detailedViewTextBoxOn'" onBlur="this.className='detailedViewTextBox'">          </td>
          <td  ><div align="right"><strong>状态</strong> </div></td>
          <td   align=left  >
		     <select name="ticketstatus"      >
              <option value="Transmitted and Recognised" > 未分配 </option>
              <option value="Undistributed" > 已分配未确定</option>
			   <option value="Transmitted but Unrecognised" > 转发中 </option>
              <option value="Distributed but Unrecognised" >处理中 </option>
              <option value="Completed Ticket" > 等待客户响应</option>
              <option value="Distributed and Recognised" > 处理完成 </option>
              <option value="Transmitted but Unrecognised" > 超时 </option>
            </select>          </td>
		  <td  ><div align="right"><strong>优先级</strong> </div></td>
          <td   align=left  >
		         <select name="ticketseverities"    >
                     <option value="Minor" >低 </option>
					 <option value="Minor" >普通</option>
                     <option value="Major" >紧急 </option>
                 </select>
	     </td>
		  <td><div align="right"><strong>联系人</strong></div></td>
          <td>
		  <input type="text"    name="hours" id ="hours" value="" size="20"
			 class=detailedViewTextBox onFocus="this.className='detailedViewTextBoxOn'" onBlur="this.className='detailedViewTextBox'">          </td>
		  </tr>
		  <tr>
		  <td  ><div align="right"><strong>创建部门</strong> </div></td>
          <td   align=left  >
		      <select name="ticketseverities"    >
                            <option value="Minor" > 部门1 </option>
                            <option value="Major" > 部门2 </option>
                            <option value="Feature" > 部门3 </option>            
             </select>          </td>
		    <td  ><div align="right"><strong>创建人</strong> </div></td>
          <td  align=left  >
		      <input type="text"   name="hours" id ="hours" value="" size="20"
			 class=detailedViewTextBox onFocus="this.className='detailedViewTextBoxOn'" onBlur="this.className='detailedViewTextBox'">          </td>
		     <td  ><div align="right"><strong>创建时间</strong> </div></td>
          <td  align=left  >
		      
			     <input id="state_date" name="state_date" 
				 onclick="setday(this);" 
				 class=detailedViewTextBox onFocus="this.className='detailedViewTextBoxOn'" 
				 onBlur="this.className='detailedViewTextBox'" readonly="readonly" value="" />          </td>
		     <td><div align="center"> <<>> </div></td>
          <td  align=left>
		      <input type="text"    name="hours" id ="hours" value="" size="20"
			  onclick="setday(this);"
			 class=detailedViewTextBox onFocus="this.className='detailedViewTextBoxOn'" onBlur="this.className='detailedViewTextBox'">    
			       </td>
			      </tr>
        <tr>
		 <td  ><div align="right"><strong>处理部门</strong> </div></td>
          <td   align=left  >
		      <select name="ticketseverities" >
                            <option value="Minor" > 部门1 </option>
                            <option value="Major" > 部门2 </option>
                            <option value="Feature" > 部门3 </option>            
             </select>          </td>
		    <td  ><div align="right"><strong>处理人</strong> </div></td>
          <td  align=left  ><input type="text"    name="hours2" id ="hours2" value="" size="20"
			 class=detailedViewTextBox onFocus="this.className='detailedViewTextBoxOn'" onBlur="this.className='detailedViewTextBox'"></td>
          <td class="small" colspan="4"   align="right">
		  <input name="submit" type="button" class="crmbutton small create" onClick="callSearch('Basic');" value=" 立即查找 ">
            &nbsp; </td>
        </tr>
      </table>
      </div>
      <!-- PUBLIC CONTENTS STARTS-->
      <div id="ListViewContents" class="small" style="width:100%;">
        <form name="massdelete" method="POST" id="massdelete" onSubmit="VtigerJS_DialogBox.block();">
          <!-- List View Master Holder starts -->
          <table border=0 cellspacing=0 cellpadding=0 width=100% class="lvtBg">
            <tr>
              <td><!-- List View's Buttons and Filters starts -->
                <table width="100%" class="layerPopupTransport">
                  <tr>
                    <td valign="middle">
					<a href="#"  >
					<img src="themes/softed/images/btnL3Add.gif" alt="创建 故障单..." width="22" height="20" border=0 style="margin-bottom:-4px;" />
					 创建</a> 
                    
				<!--	<a href="#">
					<img src="themes/softed/images/tbarImport.gif" alt="*导入 故障单" style="margin-bottom:-4px;"  width="22" height="20" border="0"/>导入</a>-->
					
					 <a href="#" onClick="return selectedRecords('HelpDesk','Support')">
					  <img src="themes/softed/images/tbarExport.gif"  width="22" height="20" alt="*导出 故障单" style="margin-bottom:-4px;"    border="0"/>导出结果</a>  
					 </td>
                  </tr>
                </table>
                <table border=0 cellspacing=0 cellpadding=2 width=100% class="small" height="30px">
                  <tr>
                    <!-- Buttons -->
					
                    <td style="padding-right:20px;margin:0px;" nowrap  > 
				
					<table width="100%" height="100%" border="0">
					<tr>
					
					<td width="100px">
					<input class="crmbutton small delete" type="button" value="删除" onClick="return massDelete('HelpDesk')"/>
                      
					</td>
						<style>
					.tdDOWN {
							border-bottom-width: thick;
							border-bottom-style: double;
							border-bottom-color: #578fc8;
							}
					</style>
					<td  class="tdDOWN" width="30px"
					  onMouseOver="this.className='detailedViewTextBoxOn'"  
					  onMouseOut="this.className='tdDOWN'">
					  <div align="center">全部</div></td>
					<td   onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '"> 
					  <div align="center">本人待处理的故障单</div></td>
					<td   onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
						 <div align="center">追踪本人创建的故障单</div></td>
					<td  onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
						 <div align="center">部门人员待处理的故障单</div></td>
				    <td   onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '"> 
						 <div align="center">追踪部门人员创建的故障单</div></td>
					</tr>
					</table>
                      
					  
                    </td>
                  </tr>
                </table>
                <!-- List View's Buttons and Filters ends -->
                <div style="height:500px">
                  <table border=0 cellspacing=1 cellpadding=3 width=100%    class="lvt small">
                    <!-- Table Headers -->
                    <tr>
                      <td class="lvtCol"><input type="checkbox"  name="selectall" id="selectCurrentPageRec" 
				onClick=toggleSelect_ListView(this.checked,"selected_id")></td>
                      <td class="lvtCol">故障单编号</a></td>
                      <td class="lvtCol">标题</a></td>
                      <td class="lvtCol">创建人</td>
                      <td class="lvtCol">创建部门</a></td>
                      <td class="lvtCol">负责部门</a></td>
                      <td class="lvtCol">负责人</a></td>
                      <td class="lvtCol">优先级</td>
					  <td class="lvtCol">状态</td>
					  <td class="lvtCol">操作</td>
                    </tr>
                    <!-- Table Contents -->
                    <tr bgcolor=white onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData'" id="row_38">
                      <td width="2%"><input type="checkbox" NAME="selected_id" id="38" value= '38' onClick="check_object(this)"></td>
                      <td>TT9  </td>
                      <td >  test2  </td>
                      <td >--  </td>
                      <td >   </td>
                      <td >   </td>
                      <td>    </td>
					  <td> 低</td>
					  <td>新建未分配</td>
                      <td  >
					  <a href="#">编辑</a> | 
					  <a href='#'>刪除</a> | <a href='#'>系统分配</a> | <a href='#'>接收</a>
					  <img src='themes/softed/images/important1.gif' border=0></td>
                    </tr>
					  <tr class="lvtColData" onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData'" id="row_38">
                      <td width="2%"><input type="checkbox" NAME="selected_id" id="38" value= '38' onClick="check_object(this)"></td>
                      <td>TT9  </td>
                      <td >  test2  </td>
                      <td >--  </td>
                      <td >   </td>
                      <td >   </td>
                      <td>    </td>
					   <td>紧急（未确认）</td>
					    <td>  已分配 </td>
                      <td  >
					   <a href="#">编辑</a> | <a href="#">接收</a> | 
					  <a href='#'>不接收</a> | 
					  <img src='themes/softed/images/important1.gif' border=0></td>
                    </tr>
                        <tr class="lvtColData2" onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData2'" id="row_38">
                      <td width="2%">
					  <input type="checkbox" NAME="selected_id" id="38" value= '38' onClick="check_object(this)"></td>
                      <td>TT9  </td>
                      <td >  test2  </td>
                      <td >--  </td>
                      <td >   </td>
                      <td >   </td>
                      <td>    </td>
					   <td>紧急（已确认）</td>
					    <td>  已分配 </td>
                      <td  >
					   <a href="#">编辑</a> | <a href="#">接收</a> | 
					  <a href='#'>不接收</a> |  
					  <img src='themes/softed/images/important1.gif' border=0></td>
                    </tr>
					 <tr class="lvtColData" onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData'" id="row_38">
                      <td width="2%"><input type="checkbox" NAME="selected_id" id="38" value= '38' onClick="check_object(this)"></td>
                      <td>TT9  </td>
                      <td >  test2  </td>
                      <td >--  </td>
                      <td >   </td>
                      <td >   </td>
                      <td>    </td>
					   <td>普通</td>
					    <td>  已分配 </td>
                      <td  >
					   <a href="#">编辑</a> | <a href="#">接收</a> | 
					  <a href='#'>不接收</a> | 
					  <img src='themes/softed/images/important1.gif' border=0></td>
                    </tr>
                  </table>
                </div>
                <table border=0 cellspacing=0 cellpadding=2 width=100%>
                  <tr>
                    <td style="padding-right:20px" nowrap><input class="crmbutton small delete" type="button" value="删除" 
					onClick="return massDelete('HelpDesk')"/>
                       
                    </td>
                    <td align="right" width=40%></td>
                  </tr>
                </table></td>
            </tr>
            <tr>
              <td><table width="100%">
                  <tr>
                    <td class="small" nowrap align="left"> 显示 条记录 1 - 5 of 5 </td>
                    <td nowrap width="50%" align="right"><table border=0 cellspacing=0 cellpadding=0 class="small">
                        <tr>
                          <td align="right" style="padding: 5px;"><img src="themes/softed/images/start_disabled.gif" border="0" align="absmiddle">&nbsp;<img src="themes/softed/images/previous_disabled.gif" border="0" align="absmiddle">&nbsp;
                            <input class='small' name='pagenum' type='text' value='1'
		style='width: 3em;margin-right: 0.7em;' onChange="getListViewEntries_js('HelpDesk','parenttab=Support&start='+this.value+'');"
		onkeypress="return VT_disableFormSubmit(event);">
          <span name='HelpDesk_listViewCountContainerName' class='small' style='white-space: nowrap;'>of 1</span>
							<img src="themes/softed/images/next_disabled.gif" border="0" align="absmiddle">&nbsp;
							<img src="themes/softed/images/end_disabled.gif" border="0" align="absmiddle">&nbsp;</td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
            </tr>
          </table>
        </form>
        <div id="basicsearchcolumns" style="display:none;">
          <select name="search_field" id="bas_searchfield" class="txtBox" style="width:150px">
            <option   value="ticket_no">故障单编号</option>
            <option  value="ticket_title">标题</option>
            <option   value="parent_id">相关对象</option>
            <option   value="ticketstatus">状态</option>
            <option   value="ticketpriorities">优先级</option>
            <option   value="assigned_user_id">负责人</option>
          </select>
        </div>
      </div></td>
    <td width="17%" valign=top>&nbsp;</td>
  </tr>
</table>
 
 
<div id="massedit" class="layerPopup" style="display:none;width:80%;">
  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="layerHeadingULine">
    <tr>
      <td class="layerPopupHeading" align="left" width="60%">批量修改 - 记录字段</td>
      <td>&nbsp;</td>
      <td align="right" width="40%"><img onClick="fninvsh('massedit');"  alt="关闭" style="cursor:pointer;" 
	  src="themes/softed/images/close.gif" align="absmiddle" border="0"></td>
    </tr>
  </table>
   
</div>

<%--
网页body
--%>



<jsp:include page="../page/down.jsp" flush="true"></jsp:include>
 
  </body>
</html>
