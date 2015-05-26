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
<%
request.setCharacterEncoding("UTF-8");
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
//String menu_Fid=StringUntil.getParameter(request,"menu_Fid","");          // 一级菜单编号
//String page_menu_ID=StringUntil.getParameter(request,"page_menu_ID",""); // 二级 菜单编号

String groupType="12"; // 下拉树类型
String onclickUrl="purview_role_functon";                           // 菜单跳转 地址
String menuLeftID=StringUntil.getParameter(request,"menuLeftID","");// 页面左边菜单编号 
String s=StringUntil.getParameter(request,"stateText","");           // 返回的错误 信息
String menuID=StringUntil.getParameter(request,"page_menu_ID","");
List userList=(List)StringUntil.getParameterToobject(request,"userList",null);
if(userList==null)
{        /// 查询 此角色下的 所以用户
	 WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
     RoleAction roleAction= (RoleAction)wac.getBean("roleAction");
     userList= roleAction.RoleAction_getUser(null) ;
}

// 页面头部 菜单编号  menu_Fid=71&page_menu_ID=93
 
 
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
				<td width="22%" valign=top>
					&nbsp;
				</td>

				<td class="showPanelBg" valign="top" style="padding: 13px;" >
					<!-- SIMPLE SEARCH -->
					<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
						<tr>
							<td width="40%" class="searchUIBasic small">
								<%--　
					 　下拉菜单
					            --%>
								<div  id="menu_id" style="height: 100%" >
									<div id="menu_html" style="display: none;height: 100%">
									 
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
										src='PurviewAction_getListToMenu.action?<%=StringUntil.menuUrl("")%>&menuLeftID=<%=menuLeftID%>
										                                        &groupType=<%=groupType%>
										                                        &onclickUrl=<%=onclickUrl %>'
										frameborder='no' width=100% height=500px>
									</iframe>
								</div>
							</td>
							<td class="searchUIBasic small">
								<div id="searchAcc" style="height: 500px;">
									<table border=0 cellpadding=0>
										<tr height="26px">
											<td>
												<strong>当前位置：<%=StringUntilDatabase.getTreeNameByID(menuLeftID,groupType) %></strong>
											</td>
										</tr>
									</table>
									<!-- PUBLIC CONTENTS STARTS-->
									<div id="ListViewContents" class="small" style="width: 100%;height:92%;">
										 
											<!-- List View Master Holder starts -->
											<table border=0 cellspacing=0 cellpadding=0 width=100% height="100%" class="lvtBg"  >
												<tr>
													<td  valign="top">
														<!-- List View's Buttons and Filters starts -->
									             
														<table border=0 cellspacing=0 cellpadding=2 width=100% height="100%"
															class="small">
															<tr>
					                                        <td style="padding-right: 20px; margin: 0px; height: 300px"  valign="top"  nowrap>
																				<script type="text/javascript">
																			    function getUserBygroupID()
																			    {
																			 window.location =document.URL.split('?')[0]+'?menuLeftID=<%=menuLeftID%>&pageURLid='+new Date().getTime();  
																				 }
																			</script>
																	<table border="0" cellpadding="0" cellspacing="0" width="100%">
																		<%--<tr height="30px">

																			<td colspan="3">
																		
																				【 <a href="#" onclick="getUserBygroupID();return false;">包含用户</a>】
																				【 <a href="#">包含用户组</a>】 
																				【 <a href="purview_role_functon.action?<%=StringUntil.menuUrl("")%>&menuLeftID=<%=menuLeftID%>">角色权限</a>】    
																			</td>
																		</tr>--%>
																		<TR>
																		<td>
																		<div functionId="function_163" style="display: inline;" ><input id="deleteMenuSave" class="save" type="button" value="保存" onclick="role_Function();" /></div>
																		<script type="text/javascript">
																		// 获取Iframe 中的对象
																		 function getIframeBid(id)
																		 {
																			return document.getElementById('ifRameFunction').contentWindow.document.getElementById(id);   
																		  }
                                                                          //角色 功能 绑定
                                                                           function role_Function()
                                                                          {
                                                                             // 获取 选中的 节点
                                                                               var functions=$(getIframeBid("demo1")); 
                                                                               
                                                                                var Fid=functions.find("li[class*='jstree-checked']"); // 获取 选中的 功能节点
                                                                               
                                                                                 
                                                                                 var Fids="";
                                                                                 Fid.each(function(i){
                                                                                   Fids+=$(this).attr("id").replace("node_",",");
                                                                                    });
                                                                                 Fids=Fids.replace(",","")+",";  // 保存子菜单
                                     
                                                                                 Fid=functions.find("li[class*='jstree-undetermined']"); // 保存父菜单
                                                                                 Fid.each(function(i){
                                                                                     var a=$(this).attr("id").replace("node_","");
                                                                                      a-=10000;
                                                                                     Fids+=a+",";
                                                                                      }); 
                                                                                
                                                                                 
                                                                              // 通过ajax 保存 角色 功能对应关系
                                                                               
                                                                               if("<%=menuLeftID%>"=="")
                                                                               {
                                                                                  return false;
                                                                              }
                                                                               
                                                                               $.get("PurviewAction_saveRoleFunctions.action?<%=StringUntil.menuUrl("163")%>&pageId="+new Date().getTime(), {  
                                                                                        "roelF.roleId":"<%=menuLeftID%>",    /// 角色id
                                                                            	   "roelF.functionIds":Fids               // 功能id 集合
         
										                                                    },function(date){    // 保存 角色 功能
                                                                                               alert(date);      
											                                                  } ); 
                                                                              
                                                                          }
																		  
																		</script>
																		 
																		</td>
																		</TR>
																	</table>
																	<div style="width: 100%;height: 100%;">
																 <%--
											                      menuLeftID   需要展开 菜单的  id
											                       groupType   左边菜单类型     用户组 ‘角色组 
											                          menuID   头部菜单编号 用于权限控制和操作日志 
											                      FunctionID   功能编号           用于权限控制和操作日志
											                      onclickUrl   点击节点 跳转的 url
																   --%>
																<iframe id="ifRameFunction"
																	src="PurviewAction_getListToMenu2.action?<%=StringUntil.menuUrl("")%>&pageId=<%=new Date().getTime() %>
																	                                        &menuLeftID=<%=menuLeftID%>
																	                                        &groupType=26
																	                                        &checkbox=,'checkbox'
																	                                        &icons=false"
																	frameborder='no' width=100% height=500px>
																</iframe>
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
				<td width="22%">
				</td>
			</tr>
		</table>

 
		<div id="mb" class="mb" style="display: none;">
			<%--
			 蒙版图层
			 --%>  
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
           $("body [functionId*=function_]").hide();
           
           var fIds="<%=tu.getFuncitonS()%>";
         
           fIds=fIds.split(",");
            for(var i=0;i<fIds.length;i++)
             {
                   $("body [functionId='function_"+fIds[i]+"']").show();
            }
 
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
