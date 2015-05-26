<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="log.TLog"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.Constants"%>
<%@page import="Statements.action.imp.StatementsBean"%>
<%
request.setCharacterEncoding("UTF-8");
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
 
TUser tu=(TUser)session.getAttribute(Constants.LOGINUSER) ;
if(tu==null)
{
  out.print(StringUntil.chickLogin());
  return; 
}String page_MENU_ID=StringUntil.getPage_menu_ID();
   // 查询  
   
   StatementsBean bean=(StatementsBean)StringUntil.getParameterToobject(request,"bean",""); 
 if(bean==null)
 {
	  bean=new StatementsBean();
 }
      String f=StringUntil.getMenuSid(new Integer(page_MENU_ID));
    String ff="";
    for(String t:f.split(","))
    {
    	if(tu.getFuncitonS().indexOf((t+","))>-1||tu.getFuncitonS().indexOf((","+t))>-1)
    	{
    		ff+=","+t;
    	}
    }

List list=(List)StringUntil.getParameterToobject(request,"list",null);
String strListId=StringUntilDatabase.getListIdStr(list);

 String reText2=StringUntil.getParameter(request,"reText2","");
if(!reText2.equals("")){
	list.clear();
}
   
   
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>系统日志</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
		<script language="JavaScript" type="text/javascript"
			src="<%=basePath%>include/js/general.js?v=5.4.0"></script>
		<!-- vtlib customization: Javascript hook -->
		<script language="JavaScript" type="text/javascript"
			src="<%=basePath%>include/js/vtlib.js?v=5.4.0"></script>
		<link rel="stylesheet" href="<%=basePath%>themes/softed/style.css"
			type="text/css"></link>
		<link rel="stylesheet"
			href="<%=basePath%>js/chickFrom/css/chickFrom.css" type="text/css"></link>
		<script language="JavaScript" type="text/javascript"
			src="<%=basePath%>js/chickFrom/vanadium.js"></script>
			
					 
		 <script type="text/javascript" src="include/js/checkDate2.js"></script>
		<script type="text/javascript" src="include/js/showdate.js"></script>
			
		<%--
		      分页
		 --%>
		<link rel="stylesheet"
			href="<%=basePath%>js/jspPageing/pagination.css" type="text/css"></link>
		<script type="text/javascript"
			src="<%=basePath%>js/jspPageing/jquery.pagination.js"></script>
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
	filter: alpha(opacity =           50); /*ie透明度*/
}

.mb3 {
	position: absolute;
	z-index: 5;
	padding-bottom: 20px;
	display: none;
	background-color: white;
	border: 2px solid #a5b5ee;
}
</style>
 

	</head>
	<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small>
		<%--
		  头部菜单
		--%>
		<jsp:include page="../page/menu.jsp" flush="true">
			<jsp:param value="<%=page_MENU_ID %>" name="page_MENU_ID" />
		</jsp:include>
		<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="17%" valign=top>
					&nbsp;
				</td>
				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->

					<div functionId="function_177" id="searchAcc"
						class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px;">
						<form action="LogAction_select.action?<%=StringUntil.menuUrl("176") %>">
						  <input id="downExcel"  name="downExcel" type="hidden" value="" >
							<table border=0 align=center cellpadding=0>
								<tr height="26px">
									<td>
										<div align="right">
											<strong>操作用户名称</strong>
										</div>
									</td>
									<td>
										<input type="text" style="display: block;" name="UserName" 
											id="hours" value="${UserName}" size="20" class=detailedViewTextBox
											onFocus="this.className='detailedViewTextBoxOn'"
											onBlur="this.className='detailedViewTextBox'">
									</td>
									  <td>
									<div align="right">
										<strong>创建时间</strong>
									</div>
								</td>
								<td width="150px">
									<input type="text" style="display: block;" name="bean.createDateBegin"
										id="date1" value="<%=bean.getCreateDateBegin() %>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'"
										onclick="setday(this);" readonly="readonly">
								</td>
								<td>
									<div align="right">
										<strong><<>>&nbsp;</strong>
									</div>
								</td>
								<td width="150px">
									<input type="text" style="display: block;" name="bean.createDateEnd"
										id="" value="<%=bean.getCreateDateEnd() %>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'"
										onclick="setday(this);" readonly="readonly">
								</td>
								</tr>
								<tr>
									<td class="small" colspan="8" align="right">
									<button name="submit" type="submit" 
										onclick="$('#downExcel').val('');"
										class="crmbutton small create" >查 找</button>
										
										 &nbsp;&nbsp;&nbsp;&nbsp;
											 <button functionId="function_178" name="submit" type="submit" 
											 onclick="$('#downExcel').val('1');"
											   class="crmbutton small create" >导 出</button>
										
										&nbsp;&nbsp;&nbsp;&nbsp;	   
								 		<button name="submit" type="submit" 
										onclick="return delAll('<%=strListId %>');"
										class="crmbutton small create" >清空</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<!-- PUBLIC CONTENTS STARTS-->

					<!-- List View Master Holder starts -->
					<table border=0 cellspacing=0 cellpadding=0 width=100%
						class="lvtBg">
						<tr>
							<td>
								<!-- List View's Buttons and Filters starts -->

								<table border=0 cellspacing=0 cellpadding=2 width=100%
									class="small">
									<tr>
										<!-- Buttons -->

										<td style="margin: 0px;">

											<table width="100%" height="100%" border="0">
												<tr>

													<td>

														 
														<input functionId="function_176"
															class="crmbutton small delete" type="button" value="删除"
															onClick="return delUser();" />

																<script type="text/javascript">
														     function delUser(id)
													           {   
                                                                  if(id==undefined)
                                                                  {
                                                                         var ids="";
                                                                         $("input[name='selected_id'][checked=checked]").each(function(){
                                                                                ids+=","+$(this).val();
                                                                            });
                                                                         id=ids.replace(",","");    
                                                                    }
                                                                 
                                                                  window.location="LogAction_del.action?<%=StringUntil.menuUrl("176")%>&logIds="+id;
														       }
														     
														     function delAll(idList)
														     {
														     	window.location="LogAction_del.action?<%=StringUntil.menuUrl("179")%>&logIds="+idList;
															}
															</script>
													</td>
												</tr>
											</table>
											<!-- List View's Buttons and Filters ends -->
											<div style="height: 450px">
												<table id="Searchresult" border=0 cellspacing=1
													cellpadding=3 width=100% class="lvt small">
													<!-- Table Headers -->
													<thead>
														<tr>
															<td class="lvtCol">
																<%--<input type="checkbox" name="selectall"
																	id="selectCurrentPageRec"
																	onClick="toggleSelect_ListView(this.checked,'selected_id')">
															--%></td>
															<td class="lvtCol">
																No
															</td>
															<td class="lvtCol">
																操作人
															</td>
															<td class="lvtCol">
																操作内容
															</td>
															<td class="lvtCol">
																ip
															</td>
															<td class="lvtCol">
																操作时间
															</td>

														</tr>
													</thead>
													<tbody>
														<!-- Table Contents -->
														<%
												  
												    if(list!=null)
												    {
												    	for(Object obj:list)
												    	{
												         TLog log=(TLog)obj;
												         
												    	%>

														<tr bgcolor=white
															onMouseOver="this.className='lvtColDataHover'"
															onMouseOut="this.className='lvtColData'" id="row_38">
															<td width="2%">
																<input type="checkbox" NAME="selected_id" id="38"
																	value='<%=log.getId()%>'  >
															</td>
															<td><%=log.getId() %></td>
															<td>
																<%=StringUntil.isNull(StringUntilDatabase.getUserRnameByID(log.getUserId())) %>
															</td>
															<td>
																<%=log.getText() %>
															</td>
															<td>
																<%=log.getIp() %>
															</td>

															<td>
																<%=log.getDate() %>
															</td>


														</tr>
														<%
												        }
												    }
												%>

													</tbody>
												</table>
											</div>
											<table border="0" width="100%">
												<tr>
													<td functionId="function_176" width="5%">
														<input class="crmbutton small delete" type="button"
															value="删除"  onClick="return delUser();" style="display: inline;" />
													</td>
													<td>

														<script type="text/javascript">
	$(document).ready(function() {

		pagination('Searchresult', //需要分页的 table ID
				'Pagination', // 放分页操作条的 divID
				{
					items_per_page : 15, // 没页显示 多少行
					num_display_entries : 5, // 显示多少个菜单
					current_page : 0, // 从第几页开始显示  页码从0开始
					num_edge_entries : 3, // 结尾显示多少个页码
					link_to : "#",
					prev_text : "上一页",
					next_text : "下一页",
					ellipse_text : "...",
					prev_show_always : true,
					next_show_always : true,
					callback : pageselectCallback
				}); // 初始话 分页  
		});
</script>
														<div id="Pagination" class="pagination"
															style="display: inline;" align="left">

														</div>
													</td>
												</tr>
											</table>

										</td>
									</tr>

								</table>


							</td>

						</tr>
					</table>
					<br>

					<!--end body panes-->
				</td>
				<td width="17%" valign=top>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"></td>
			</tr>
		</table>
	</body>
</html>


		<script type="text/javascript">
 
var test = function ()
  { 
	  
	  
	  var fIds="<%=ff%>";
	  fIds=fIds.split(",");
	  for(var i=0;i<fIds.length;i++)
	   {
	      $("body [functionId='function_"+fIds[i]+"']").show();  
	   }
	  
 }
   $(function(){
	   $("body [functionId*=function_]").hide();
	   setTimeout(test,10); 
	   });
	 
 
 
 </script>