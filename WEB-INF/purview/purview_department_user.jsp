<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="purview.action.I.PurviewActionI"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="tool.Constants"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.StringUntil"%>
<%@page import="user.action.updateUser.I.UserAction"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="user.action.role.Imp.RoleAction"%>
<%@page import="user.database.role.Imp.RoleDAO"%>
<%@page import="bsh.StringUtil"%>
<%
request.setCharacterEncoding("UTF-8");
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
TUser tu=(TUser)session.getAttribute(Constants.LOGINUSER) ;
if(!StringUntil.chickLogin().equals(""))
{
  out.print(StringUntil.chickLogin());
  return; 
}
String groupType="14";                       // 下拉树类型
String onclickUrl="purview_department_user"; // 菜单跳转 地址
String menuLeftID=StringUntil.getParameter(request,"menuLeftID","");// 页面左边菜单编号 
String readName=StringUntil.getParameter(request,"readName","");
  
// 返回的错误 信息
List userList=null;
         /// 查询 此角色下的 所以用户
WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
  RoleDAO roleDao=RoleDAO.getFromApplicationContext(wac);
userList=  roleDao.getUserBybm(new TUser(new Integer( StringUntil.isNullR0(menuLeftID)),readName));
 
// 页面头部 菜单编号 
String   menuID="2";
// 功能编号
String  FunctionID="3";
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>权限管理——部门管理</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- ActivityReminder customization for callback -->
		<style type="text/css">
div.fixedLay1 {
	position: fixed;
}
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

#addUserForm td input,#addUserForm td select {
	width: 52%;
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
	filter: alpha(opacity =   50); /*ie透明度*/
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
		<!--[if lte IE 6]>
	<style type="text/css">div.drop_mnu_user { position:absolute; }</style>
	<![endif]-->
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>

		<script language="JavaScript" type="text/javascript"
			src="<%=basePath%>include/js/general.js?v=5.4.0"></script>
		<!-- vtlib customization: Javascript hook -->
		<script language="JavaScript" type="text/javascript"
			src="<%=basePath%>include/js/vtlib.js?v=5.4.0"></script>
		<!-- END -->
		<link rel="stylesheet" href="<%=basePath%>themes/softed/style.css" type="text/css"></link>
		 <link rel="stylesheet" href="<%=basePath%>js/chickFrom/css/chickFrom.css" type="text/css"></link>
		 <script language="JavaScript" type="text/javascript" src="<%=basePath%>js/chickFrom/vanadium.js"></script><%--
		      分页
		 --%>
		  <link rel="stylesheet" href="<%=basePath%>js/jspPageing/pagination.css" type="text/css"></link>
		 <script type="text/javascript" src="<%=basePath%>js/jspPageing/jquery.pagination.js"></script>
	</head>
	<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small>
		<!-- header - master tabs -->
		<%--
		  头部菜单
		--%>
		<jsp:include page="../page/menu.jsp" flush="true">
			<jsp:param value="<%=groupType %>" name="page_MENU_ID" />
		</jsp:include><%--
		网页body
		--%>

		<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="10%" valign=top>
					&nbsp;
				</td>

				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->
					<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
						<tr>
							<td width="25%">
								<%--　
					 　下拉菜单
					  --%>
								<div class="searchUIBasic small" id="menu_id">
									<div id="menu_html" style="display: none;">
									 
										<%--
					      放菜单html代码
					   --%>
									</div>
									<script type="text/javascript">
									 //通过id得到 jquery对象
				              function getDemoByid(id)
				             {
		                         return $("#"+id);
					          }
                     </script>
									<%--
                      menuLeftID   需要展开 菜单的  id
                       groupType   左边菜单类型     用户组 ‘角色组 
                          menuID   头部菜单编号 用于权限控制和操作日志 
                      FunctionID   功能编号           用于权限控制和操作日志
                      onclickUrl   点击节点 跳转的 url
					   --%>
									<iframe
										src='PurviewAction_getListToMenu.action?<%=StringUntil.menuUrl("161")%>&menuLeftID=<%=menuLeftID%>
										                                        &groupType=<%=groupType%>
										                                        &onclickUrl=<%=onclickUrl %>'
										frameborder='no' width=100% height=500px>
									</iframe>
								</div>
							</td>
							<td class="searchUIBasic small">
								<div id="searchAcc" style="height: 500px">
									<table border=0 cellpadding=0>
										<tr height="26px">
											<td>
												<strong>当前位置：<% String groupName= StringUntilDatabase.getTreeNameByID(menuLeftID,groupType);
												                 out.print(groupName);
												 %></strong>
											</td>
										</tr>
									</table>
									<!-- PUBLIC CONTENTS STARTS-->
									<div id="ListViewContents" class="small" style="width: 100%;">
										<form name="massdelete" method="POST" id="massdelete"
											onSubmit="VtigerJS_DialogBox.block();">
											<!-- List View Master Holder starts -->
											<table border=0 cellspacing=0 cellpadding=0 width=100%
												class="lvtBg">
												<tr>
													<td>
													 
														<table border=0 cellspacing=0 cellpadding=2 width=100%
															class="small">
															<tr>
																<!-- Buttons -->

																<td
																	style="padding-right: 20px; margin: 0px; height: 300px"
																	nowrap>

																	<table border="0" cellpadding="0" cellspacing="0">
																		<tr  >

																			<td colspan="3">
																			<script type="text/javascript">
																			    function getUserBygroupID()
																			    {
																			 window.location =document.URL.split('?')[0]+'?menuLeftID=<%=menuLeftID%>&pageURLid='+new Date().getTime();  
																				 }
																			</script>
																				<div functionId="function_164" style="display: inline;" >【 <a href="#" onclick="getUserBygroupID();return false;">包含用户</a>】</div>
																				 
																			<div functionId="function_162" style="display: inline;" > 【 <a href="#" onclick="addGroupRole('<%=menuLeftID%>');return false" >组权限</a>】</div>  
																				
																				 
																				<script type="text/javascript">
																		         function  addGroupRole(id)
																		         {
																			         if(id=='')
																			         {
																				          alert("不能为此组添加角色！！");
																				         return false;
																				     }
																		        	 var tdVal=$("td[id='"+id+"']");
	                                                                                 var url="purview_role_functonToUserGroup.action?<%=StringUntil.menuUrl("162")%>&menuLeftID=<%=menuLeftID%>"+
	      										                                             "&groupType=<%=groupType%>"+
	  										                                                 "&GroupId="+id+"&GroupName=<%=groupName%>";
	  										                                               url=encodeURI(url);
	  																				  window.open(url,"test","width=500,height=560,resizable=0,scrollbars=0,top=150,left=250");
  
																			     }
																				</script>
																			</td>
																		</tr>
																		<tr  >
																			<td style="margin: 2px">
																				 
																				<script type="text/javascript">
																				/// 打开添加用户 窗口
																	         function  addUser()
																	         {
																	        	 $('#mb').attr('style','z-index: 4;');
																	        	 $('#addUser').show(200);
																	        	 
																		     }
																			   function  updateUser(id)
																		         {
																		        	var tdVal= $("td[id='"+id+"']");
																		        	 $("#updateUser #userid").val(id);
																		        	 $("#updateUser #userName").val(tdVal.eq(1).attr("val"));
																		        	 $("#updateUser #readName").val(tdVal.eq(2).attr("val"));
																		        	 $("#updateUser #department option[value='"+tdVal.eq(4).attr("val")+"']").attr("selected",true);
																		        	 $("#updateUser #post option[value='"+tdVal.eq(3).attr("val")+"']").attr("selected",true);
																		        	 $("#updateUser #state option[value='"+tdVal.eq(6).attr("val")+"']").attr("selected",true);
																		        	 $("#updateUser #tel").val(tdVal.eq(5).attr("val"));
																		        	 $('#mb').attr('style','z-index: 4;');
																		        	 $('#updateUser').show(200);
																			     }
																	           function delUser(id)
																	           {   
                                                                                    if(id==undefined)
                                                                                    {
                                                                                           var ids="";
                                                                                           $("input[id='selected_id'][checked=checked]").each(function(){
                                                                                                  ids+=","+$(this).val();
                                                                                              });
                                                                                           id=ids.replace(",","");    
                                                                                      }
                                                                                    window.location="NoChickUserAction_del.action?<%=StringUntil.menuUrl("166")%>&isbm=true&userID="+id;
																		       }
												                               </script>
																				 
																					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																				 
																				<div functionId="function_164" style="display: inline;" >	用户姓名：
																					<input type="text" id="select_readName" name="readName" value="<%=readName %>" > &nbsp;&nbsp;
																					<button class="crmbutton small create" onclick="selectByReadName();"> 查 询</button>  
																					</div> 
																				   <script type="text/javascript">
																				      function selectByReadName()
																				      {
																					      var readName=$("#select_readName").val();
																					       if(readName=="")
																					       {
																						       return false;
																						   }
                                                                                      window.location="<%=basePath%>purview_department_user.action?<%=StringUntil.menuUrl("164")%>&menuLeftID=<%=menuLeftID%>&readName="+readName;         
																					  }
																				   </script>
																			</td>
																		</tr>
																	</table>
																	<!-- List View's Buttons and Filters ends -->
																	<div style="height: 352px;">
																		<table id="Searchresult"   border=0 cellspacing=1 cellpadding=3 width=100%
																			class="lvt small rssTable" style="overflow: hidden;" >
																			<!-- Table Headers -->
																			<thead>
																			<tr style="font-weight: bold;font-size:16px">
																				 
																				<td class="lvtCol"  >
																					 No 
																				</td>
																				<td class="lvtCol">
																					用户名

																				</td>
																				<td class="lvtCol">
																					真实姓名
																				</td>
																				<td class="lvtCol">
																					职位

																				</td>
																				<td class="lvtCol">
																					部门

																				</td>

																				<td class="lvtCol">
																					联系方式

																				</td>
																				<td class="lvtCol">
																					状态

																				</td>
																				<td class="lvtCol">
																					最后登陆时间

																				</td>
																				<td class="lvtCol">
																					登陆次数
																				</td>
																				<td class="lvtCol">
																					操作
																				</td>
																			</tr>
																			</thead>
																			<tbody>
																			<!-- Table Contents -->
																			<%
															    if( userList!=null&&userList.size()>0 )	
															    {
																  for(Object o :userList)
																  {
																	 %>
																	 <tr bgcolor="white" onMouseOver="this.className='lvtColDataHover'" 
																	  onMouseOut="this.className='lvtColData'" id="row_38" style="display: none;">
                                                                     <%  
																	  Object[] str=(Object[])o;
																	 %>
																			 
																				<%
																			 for(int i=0;i<str.length;i++)
																			  {
																				 if(i==3||i==6)
																			     {
																			     out.print("<td id='"+StringUntil.isNull(str[0])+"' val='"+StringUntil.isNull(str[i])+"' >"+StringUntilDatabase.getTextByid(str[i])+"</td>");
																			       }else if(i==4){   
																			    	   out.print("<td id='"+StringUntil.isNull(str[0])+"' val='"+StringUntil.isNull(str[i])+"' >"+StringUntilDatabase.getGroupNameByID(StringUntil.isNull(str[i]),groupType)+"</td>");
																					      
																			       }else {
																			     %>
																					<td id='<%=StringUntil.isNull(str[0])%>' val='<%=StringUntil.isNull(str[i])%>'><%=StringUntil.isNull(str[i]) %> </td>
																					<% 
																				 
																			      }
																			    }
								
																		%>
																				<td>
																					<div functionId="function_165" style="display: inline;" ><a href="#" onclick="updateUser('<%=StringUntil.isNull(str[0])%>');return false;">编辑</a></div>
																					<%--<a href='#' onclick="delUser('<%=StringUntil.isNull(str[0])%>');return false;">刪除</a>
																				--%></td>

																				<%    
																		  }
															    }
																		%>

																			</tr>
                                                                  </tbody>
																		</table>
																 
																	</div> 
											                       
														 
															 	 <script type="text/javascript">
															 	$(document).ready(function(){
																 	
														               pagination('Searchresult',     //需要分页的 table ID
														                          'Pagination',       // 放分页操作条的 divID
																	      {
																			items_per_page:15,         // 没页显示 多少行
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
															 	<div id="Pagination" class="pagination">
															 	
															 	</div>	 
																</td>
															</tr>
														</table>

														<div id="basicsearchcolumns" style="display: none;">
															<select name="search_field" id="bas_searchfield"
																class="txtBox" style="width: 150px">
																<option value="ticket_no">
																	故障单编号
																</option>
																<option value="ticket_title">
																	标题
																</option>
																<option value="parent_id">
																	相关对象
																</option>
																<option value="ticketstatus">
																	状态
																</option>
																<option value="ticketpriorities">
																	优先级
																</option>
																<option value="assigned_user_id">
																	负责人
																</option>
															</select>
														</div>
													</td>

												</tr>
											</table>
										 
										</form>
									</div>
								</div>
							</td>

						</tr>
					</table>
				</td>
				<td width="10%">
				</td>
			</tr>
		</table>

	<!--
添加产品
 -->
		<div id="mb" class="mb" style="display: none;">
			<%--
			 蒙版图层
			 --%>  
		</div>
	
		<div id="addUser" class="mb3" align="center"
			style="top: 20%; left: 40%; width: 400px;">
			<form id="addUserForm" action="<%=basePath%>NoChickUserAction_addUser.action" method="post">
				<br />
				<input type="hidden" id="userid" name="user.id" value="">
				<table id="firste_validate" style="top: 0px;" width="100%"
					height="100%" border="0" cellpadding="3" cellspacing="3">
					<tr height="30px">
						<td align="left" colspan="2"
							style="font-size: 16px; font-family: '宋体'; font-weight: bold;">
							添加用户
						</td>
					</tr>
					<tr height="30px">
						<td width="20%" align="right">
							用户名：
						</td>
						<td>
							<input type="text" id="userName" name="user.loginName" value=""
								class=":required :ajax;NoChickUserAction_chickUserName.action" />
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							密码：
						</td>
						<td>
							<input id="password" type="password" name="user.loginPossword"
								   class=":required" value="" />
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							重复密码：
						</td>
						<td>
							<input id="password2" type="password" name="username2"
								class=":same_as;password" value="" />
						</td>

					</tr>
					<tr height="30px">
						<td align="right">
							真实姓名：
						</td>
						<td>
							<input id="readName" type="text" name="user.readName" value=""
								class=":required" />
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							部门：
						</td>
						<td>
							<select id="department" name="user.departmentId" >
								<option value="" >
									--请选择--
								</option>
								<%=StringUntilDatabase.getBmOption("") %>
							</select>
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							职位：
						</td>
						<td>
							<select id="post" name="user.postId" class=":required">
								<option value="">
									--请选择--
								</option>
								 <%=StringUntilDatabase.getDepartmenOption("1","") %>
							</select>
						</td>
					</tr>
						<tr height="30px">
						<td align="right">
							状态：
						</td>
						<td>
						   <select id="state" name="user.state" >
								 <%=StringUntilDatabase.getDepartmenOption("2","8") %>
							   </select> 
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							联系方式：
						</td>
						<td>
							<input id="tel" type="text" name="user.tel" value="" />
						</td>
					</tr>
				</table>
				     <%--
                                                         组id
			         --%>
			     <input type="hidden" id="" name="user.groupId" value="<%=menuLeftID %>">
			        <%--
			               自动 给value 为 【关闭】 的按钮 添加 清除 验证样式 事件 
			       --%>
				<input class="delete" type="reset" value="关闭"
					onclick="$('#addUser').hide(200);$('#mb').hide();" />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input id="deleteMenuSave" class="save" type="submit" value="保存" />
			</form>
		</div>
		<div id="updateUser" class="mb3" align="center"
			style="top: 20%; left: 40%; width: 400px;">
			<form id="updateUserForm" action="<%=basePath%>NoChickUserAction_updateUser.action?<%=StringUntil.menuUrl("165")%>" method="post">
				<br />
				<input type="hidden" id="userid" name="user.id" value="">
				<input type="hidden" id="bm" name="isbm" value="true">
				<table id="firste_validate" style="top: 0px;" width="100%"
					height="100%" border="0" cellpadding="3" cellspacing="3">
					<tr height="30px">
						<td align="left" colspan="2"
							style="font-size: 16px; font-family: '宋体'; font-weight: bold;">
							编辑用户
						</td>
					</tr>
					<tr height="30px">
						<td width="20%" align="right">
							用户名：
						</td>
						<td>
							<input type="text" disabled="disabled" id="userName" name="loginName" value=""
								class=":required :ajax;NoChickUserAction_chickUserName.action" />
						</td>
					</tr>
				 
					<tr height="30px">
						<td align="right">
							真实姓名：
						</td>
						<td>
							<input id="readName" type="text" name="readName" value=""
								class=":required" />
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							部门：
						</td>
						<td>
							<select id="department" name="departmentId" >
								<option value="" >
									--请选择--
								</option>
								<%=StringUntilDatabase.getBmOption("") %>
							</select>
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							职位：
						</td>
						<td>
							<select id="post" name="postId" class=":required">
								<option value="">
									--请选择--
								</option>
								 <%=StringUntilDatabase.getDepartmenOption("1","") %>
							</select>
						</td>
					</tr>
						<tr height="30px">
						<td align="right">
							状态：
						</td>
						<td>
						   <select id="state" name="state" >
								  <%=StringUntilDatabase.getDepartmenOption("2","8") %>
							   </select> 
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							联系方式：
						</td>
						<td>
							<input id="tel" type="text" name="tel" value="" />
						</td>
					</tr>
				</table>
				  <%--
                                                         组id
			     --%><input type="hidden" id="" name="groupId" value="<%=menuLeftID %>">
			        <%--
			               自动 给value 为 【关闭】 的按钮 添加 清除 验证样式 事件 
			      --%>
				<input class="delete" type="button" value="关闭"
					onclick="$('#updateUser').hide(200);$('#mb').hide();" />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input id="deleteMenuSave" class="save" type="submit" value="保存" />
			</form>
		</div>
		<%--
		网页body
		--%>
		<jsp:include page="../page/down.jsp" flush="true"></jsp:include> 
		 <script type="text/javascript">
		  $("body [functionId*=function_]").hide();
          
          var fIds="<%=tu.getFuncitonS()%>";
        
          fIds=fIds.split(",");
           for(var i=0;i<fIds.length;i++)
            {
                  $("body [functionId='function_"+fIds[i]+"']").show();
           }
		 
		 </script>
	</body>
</html>
 
