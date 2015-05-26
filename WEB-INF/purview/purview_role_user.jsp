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
<%request.setCharacterEncoding("UTF-8");
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String page_menu_ID=StringUntil.getParameter(request,"page_menu_ID",""); // 二级 菜单编号
TUser tu=(TUser)session.getAttribute(Constants.LOGINUSER) ;
if(!StringUntil.chickLogin().equals(""))
{
  out.print(StringUntil.chickLogin());
  return; 
}
String groupType="12"; // 下拉树类型
String onclickUrl="RoleAction_getUser"; // 菜单跳转 地址
String menuLeftID=StringUntil.getParameter(request,"menuLeftID","");// 页面左边菜单编号 
String s=StringUntil.getParameter(request,"stateText",""); // 返回的错误 信息
List userList=(List)StringUntil.getParameterToobject(request,"userList",null);
if(userList==null)
{        /// 查询 此角色下的 所以用户
	 WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
     RoleAction roleAction= (RoleAction)wac.getBean("roleAction");
     userList= roleAction.RoleAction_getUser(null) ;
}
// 页面头部 菜单编号 
String   menuID="2";
// 功能编号
String  FunctionID="3";
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>权限管理——角色管理</title>
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
										src='PurviewAction_getListToMenu.action?menuLeftID=<%=menuLeftID%>
										                                        &groupType=<%=groupType%>
										                                        &menuID=<%=menuID%>
										                                        &FunctionID=<%=FunctionID%>
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
												<strong>当前位置：<%=StringUntilDatabase.getTreeNameByID(menuLeftID,groupType) %></strong>
											</td>
										</tr>
									</table>
									<!-- PUBLIC CONTENTS STARTS-->
									<div id="ListViewContents" class="small" style="width: 100%;">
										 
											<!-- List View Master Holder starts -->
											<table border=0 cellspacing=0 cellpadding=0 width=100%
												class="lvtBg">
												<tr>
													<td>
														<!-- List View's Buttons and Filters starts -->
														<table width="100%" class="layerPopupTransport">
															<tr>
																<td valign="middle">

																</td>
															</tr>
														</table>
														<table border=0 cellspacing=0 cellpadding=2 width=100%
															class="small">
															<tr>
																<!-- Buttons -->

																<td
																	style="padding-right: 20px; margin: 0px; height: 300px"
																	nowrap>

																	<table border="0" cellpadding="0" cellspacing="0">
																		<tr height="30px">

																			<td colspan="3">
																			<script type="text/javascript">
																			    function getUserBygroupID()
																			    {
																			 window.location =document.URL.split('?')[0]+'?menuLeftID=<%=menuLeftID%>&pageURLid='+new Date().getTime();  
																				 }
																			</script>
																				【 <a href="#" onclick="getUserBygroupID();return false;">包含用户</a>】
																				【 <a href="#">包含用户组</a>】 
																				【 <a href="purview_role_functon.action?menuLeftID=<%=menuLeftID%>">角色权限</a>】  
																			</td>
																		</tr>
																		<tr height="30px">
																			<td style="margin: 2px">
																				<input class="crmbutton small delete" type="button"
																					value="删除" onClick="delUser();" />
																				&nbsp;&nbsp;
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
                                                                                    window.location="NoChickUserAction_del.action?userID="+id;
																		       }
												                               </script>
																				     <a href="#" onclick="addUser();return false;"> <img
																						src="themes/softed/images/btnL3Add.gif"
																						alt="  添加用户..." width="22" height="20" border=0
																						align="middle" style="margin: 0px; padding: 0px" />
																					添加用户 </a>
																					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																				 
																					用户姓名：
																					<input type="text" id="select_readName" name="user.readName" value="${user.readName}" > &nbsp;&nbsp;
																					<button class="crmbutton small create" onclick="selectByReadName();"> 查 询</button>   
																				   <script type="text/javascript">
																				      function selectByReadName()
																				      {
																					      var readName=$("#select_readName").val();
																					       if(readName=="")
																					       {
																						       return false;
																						   }
                                                                                          window.location="<%=basePath%>NoChickUserAction_getList_Menu.action?menuLeftID=<%=menuLeftID%>&user.readName="+readName;
                                                                                                   
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
																				<td class="lvtCol"><%--
																					<input type="checkbox" name="selectall" 
																						id="selectCurrentPageRec"  
																						onClick="toggleSelect_ListView(this.checked,'selected_id');">
																				--%></td>
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
																			 <td width="2%"> 
																	         <input type="checkbox" NAME="selected_id" 
																	        id="selected_id" 
																	       value="<%=StringUntil.isNull(str[0])%>"　/>
																				 </td>
																				<%
																			 for(int i=0;i<str.length;i++)
																			  {
																				     if(i==3||i==6)
																				     {
																				     out.print("<td id='"+StringUntil.isNull(str[0])+"' val='"+StringUntil.isNull(str[i])+"' >"+StringUntilDatabase.getTextByid(str[i])+"</td>");
																				       }else
																				     {
																				     %>
																						<td id='<%=StringUntil.isNull(str[0])%>' val='<%=StringUntil.isNull(str[i])%>'><%=StringUntil.isNull(str[i]) %> </td>
																						<% 
																					 
																				     }
																			  }
																		%>
																				<td>
																				 
																					<a href='#' onclick="delUser('<%=StringUntil.isNull(str[0])%>');return false;">刪除</a>
																				</td>

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

													 
													</td>

												</tr>
											</table>
								 
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
			<form id="addUserForm" action="<%=basePath%>RoleAction_addUser.action" method="post">
				<br />
				 
				<table id="firste_validate" style="top: 0px;" width="100%"
					height="100%" border="0" cellpadding="3" cellspacing="3">
					<tr height="30px">
						<td align="left" colspan="2"
							style="font-size: 16px; font-family: '宋体'; font-weight: bold;">
							添加用户
						</td>
					</tr>
		 
					<tr height="30px">
						<td align="right" width="20%">
							部门：
						</td>
						<td>
							<select id="department" name="" >
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
							<select id="post" name=""  >
								<option value="">
									--请选择--
								</option>
								 <%=StringUntilDatabase.getDepartmenOption("1","") %>
							</select>
						</td>
					</tr>
					<tr height="30px">
						<td align="right">
							真实姓名：
						</td>
						<td>
						   <select id="userID" name="tuserRole.userId" class=":required">
								<option value="">
									--请选择--
								</option>
								 <%=StringUntilDatabase.getUserOption("","","") %>
							</select>	
						</td>
					</tr>
				</table>
				     <%--
                                                         组id
			         --%>
			     <input type="hidden" id="" name="tuserRole.roleId" value="<%=menuLeftID %>">
			        <%--
			               自动 给value 为 【关闭】 的按钮 添加 清除 验证样式 事件 
			       --%>
				<input class="delete" type="reset" value="关闭"
					onclick="$('#addUser').hide(200);$('#mb').hide();" />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input id="deleteMenuSave" class="save" type="submit" value="保存" />
			</form>
		</div>
		 
		<%--
		网页body
		--%>
		<jsp:include page="../page/down.jsp" flush="true"></jsp:include><%--
		返回错误信息
	     --%><div id="erroText_div" class="mb3" align="center"
			style="top: 40%; left: 40%;width: 200px;padding: 30px">
			<label id ="erroTextLable">
           <%=s%> </label> <br/><br/> 
           <script type="text/javascript">
              function errorCleas()
              {
            	  $('#erroText_div').hide();
            	  $('#mb').hide();
            	  window.location =document.URL.split('?')[0]+'?pageURLid='+new Date().getTime();  
              }
           </script>
			<input class="delete" type="button" value="关闭"
				   onclick="errorCleas();" />
		</div>
	</body>
</html>
<script type="text/javascript">
<!--
$(document).ready(function(){
         //打开 错误窗口
	 if("<%=s%>"!="")
	 {
		 $('#mb').attr('style','z-index: 4;');
         $("#erroText_div").show();
       
     }
});
//-->
</script>
