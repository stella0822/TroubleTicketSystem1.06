<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="log.TLog"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.Constants"%>
<%@page import="Statements.action.imp.StatementsBean"%>
<%@page import="ttmanage.database.TTroubleticket"%>
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
}
 String page_MENU_ID=StringUntil.getPage_menu_ID();
 
    
  StatementsBean bean=(StatementsBean)StringUntil.getParameterToobject(request,"bean",null); 
   List list=(List)StringUntil.getParameterToobject(request,"list",null);
   if(bean==null)
   {
	   bean=new StatementsBean();
   }
   
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>详细信息</title>
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
	filter: alpha(opacity =     50); /*ie透明度*/
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

					<div functionId="function_85" id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px;">
						 
						<form action="StatementsAction_getListByUser.action?<%=StringUntil.menuUrl("85") %>"  method="post">
						 <input id="downExcel"  name="downExcel" type="hidden" value="" >
							<table border=0 align=center cellpadding=0>
							<tr height="26px">
								 
								<td>
									<div align="right">
										<strong>状态</strong>
									</div>
								</td>
								<td width="150px">
							<select name="bean.state" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>请选择</option>
                        	<%=StringUntilDatabase.getDepartmenOption("4",bean.getState() ) %>
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>优先级</strong>
									</div>
								</td>
								<td width="150px">
							<select name="bean.priority" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>请选择</option>
                        	<%=StringUntilDatabase.getDepartmenOption("5",bean.getPriority()) %>
                        	</select>
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
								<td>
									<div align="right">
										<strong>创建部门</strong>
									</div>
								</td>
								<td width="150px">
								
							<script type="text/javascript">
								 function getUser(id,type,userId)
								 {
									 if(userId==undefined)
									 {
									 id=$(id).val();
									 }
									 if(id==0)
									 {
										   if(type==1)
                                           {
                                         	  $("#userCreateId").html("");
												$("#userCreateId").append("<option selected value='0'>全部</option>");
                                          }else
                                          {
                                         	 $("#userChargeId").html("");
                                         	 $("#userChargeId").append("<option selected value='0'>全部</option>") ; 
                                           }
										 $("#userCreateId").append("<option selected value='0'>全部</option>");
										 $("#userChargeId").append("<option selected value='0'>全部</option>");
										 return false;
								     }
									   
									   $.get("NoChickUserAction_getUserByBm.action?pageId="+new Date().getTime(),{"bmId":id,"selectUserId":userId},function(date){
                                              if(type==1)
                                              {
                                            	  $("#userCreateId").html("");
 												$("#userCreateId").append("<option selected value='0'>全部</option>"+date);

                                             }else
                                             {
                                            	 $("#userChargeId").html("");
                                            	 $("#userChargeId").append("<option selected value='0'>全部</option>"+date) ; 
                                              }
                                           
										   });
 
                                       
							     }
							   
                                 $(function(){
                                	  getUser(<%=bean.getCreateBm()%>,1,<%=bean.getCreateUser()%>);
                                	  getUser(<%=bean.getChargeBm()%>,2,<%=bean.getChargeUser()%>);
                                 
                                     });
							     
								</script>	
								
							<select name="bean.createBm" tabindex="" class="small" style="display:block; width:90%" onchange="getUser(this,1);">
							<option selected value='0'>请选择</option>
                        	<%=StringUntilDatabase.getBmOption(bean.getCreateBm()) %>
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>创建人</strong>
									</div>
								</td>
								<td width="150px">
							<select id="userCreateId" name="bean.createUser" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>请选择</option>
                        	<%=StringUntilDatabase.getUserOption(bean.getCreateUser(),"","") %>
                        	</select>
								</td>
									<td>
									<div align="right">
										<strong>负责部门</strong>
									</div>
								</td>
								<td width="150px">
							<select name="bean.chargeBm" tabindex="" class="small" style="display:block; width:90%" onchange="getUser(this,2);">
							<option selected value='0'>请选择</option>
                        	<%=StringUntilDatabase.getBmOption(bean.getChargeBm()) %>
                        	</select>
								</td>
								<td>
									<div align="right">
										<strong>负责人</strong>
									</div>
								</td>
								<td width="150px">
								 
							<select id="userChargeId" name="bean.chargeUser" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>请选择</option>
                        	<%=StringUntilDatabase.getUserOption(bean.getChargeUser(),"","") %>
                        	</select>
								</td>
							</tr>
							<tr  >
							 
								 
								<td class="small" align="center" colspan="8"  >
											<button name="submit" type="submit" 
										onclick="$('#downExcel').val('');"
										class="crmbutton small create" >查 找</button>
										
										 &nbsp;&nbsp;&nbsp;&nbsp;
											 <button functionId="function_203" name="submit" type="submit" 
											 onclick="$('#downExcel').val('1');"
											   class="crmbutton small create" >导 出</button>
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
 
											<!-- List View's Buttons and Filters ends -->
											<div style="height: 450px">
												<table id="Searchresult" border=0 cellspacing=1 cellpadding=3 width=100%
													class="lvt small">
													<!-- Table Headers -->
													<thead>
													<tr>
													 
														<td class="lvtCol">
															TTNo
														</td>
														<td class="lvtCol">
															标题
														</td>
														<td class="lvtCol">产品名称</td>
														<td class="lvtCol">
														        优先级
														</td>
														<td class="lvtCol">
															状态
														</td>
														<td class="lvtCol">
															创建人
														</td>
														<td class="lvtCol">
															创建部门
														</td>
														<td class="lvtCol">
															负责人
														</td>
														<td class="lvtCol">
															负责部门
														</td>
														<td class="lvtCol">
															创建时间
														</td>
														<td class="lvtCol">
															完成时间
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
												         TTroubleticket tt=(TTroubleticket)obj;
												    	%>
												    	
												    	<tr bgcolor=white
														onMouseOver="this.className='lvtColDataHover'"
														onMouseOut="this.className='lvtColData'" id="row_38">
													 
														 <td><%=tt.getTtNo() %></td>
														 <td>
															<%=StringUntil.isNull(tt.getTitle() )%>
														 </td>
														 
														 <td>
														 <%=StringUntilDatabase.getProNameByid (tt.getProId()) %>
														 </td>													 
														 <td>
															<%=StringUntilDatabase.getTextByid(tt.getPriority())%>
														 </td>
														<td>
															<%=StringUntilDatabase.getTextByid(tt.getStatus())%>
														</td>
														 
														<td>
															<%=StringUntilDatabase.getUserRnameByID(tt.getCreateId()) %>
														</td>
														<td>
														   <%=StringUntilDatabase.getbmByuseriD(tt.getCreateId()) %>
														</td>
														<td>
															<%=StringUntilDatabase.getUserRnameByID(tt.getChargeId()) %>
														</td>
<td>
														   <%=StringUntilDatabase.getbmByuseriD(tt.getChargeId()) %>
														</td>
														<td>
															<%=tt.getCreateTime() %>
														</td>
													   <td>
													    <%
													       if(tt.getStatus()==20)
													       {
													    	   out.print(tt.getModifyTime());
													    	   
													       }
													    
													    %>
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
											 
											  <td>
											  
											 	 <script type="text/javascript">
															 	$(document).ready(function(){
																 	
														               pagination('Searchresult',     //需要分页的 table ID
														                          'Pagination',       // 放分页操作条的 divID
																	      {
																			items_per_page:20,         // 没页显示 多少行
																			num_display_entries:5,    // 显示多少个菜单
																			current_page:0,           // 从第几页开始显示  页码从0开始
																			num_edge_entries:3,        // 结尾显示多少个页码
																			link_to:"#",
																			prev_text:"上一页",          
																			next_text:"下一页",
																			ellipse_text:"...",
																			prev_show_always:true,
																			next_show_always:true,
																			callback:pageselectCallback
																			}); // 初始话 分页  
														            });
															 	</script> 
															 	<div id="Pagination" class="pagination" style="display:inline; " align="left">
															 	
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
					<table border=0 cellspacing=0 cellpadding=5 width=100%
						class=settingsSelectedUI>
						<tr>
							<td class=small align=left>
								<span style='color: rgb(153, 153, 153);'>Powered by
									vtiger CRM <span id='_vtiger_product_version_'>5.4.0</span>
								</span>
							</td>
							<td class=small align=right>
								<span>&copy; 2004-2012 <a href='http://www.vtiger.com'
									target='_blank'>
							</td>
						</tr>
					</table>

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
<!--
 
　 /*权限控制 */
$(function(){
　　　 var fIds="<%=StringUntil.getMenuSid3(new Integer(page_MENU_ID))%>";
      
	 	  fIds=fIds.split(",");
	  for(var i=0;i<fIds.length;i++)
	   {
		 if(fIds[i]!='')
		 {
			 $("body [functionId='function_"+fIds[i]+"']").remove();  
	     }
	   }
});
//-->
</script>
