<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="tool.Constants"%>
<%@page import="FAQ.dao.imp.TFaq"%>
<%@page import="FAQ.action.i.FAQActionI"%>
 
<%
String menu_Fid=StringUntil.getParameter(request,Constants.menu_Fid,"70");         // 主菜单编号
String page_menu_ID=StringUntil.getParameter(request,Constants.page_menu_ID,"80"); // 页面编号

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String page_MENU_ID=StringUntil.getPage_menu_ID();

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
FAQActionI sch=(FAQActionI)wac.getBean("FAQAction");
List list0=sch.FAQAction_getAll();
List list2=(List)StringUntil.getParameterToobject(request,"list2",null);
String retrnText=StringUntil.getParameter(request,"retrnText",null);

if(list2==null||list2.isEmpty()){
	if(retrnText==""){
		list0=sch.FAQAction_getAll();
	}
	else{
		list0.clear();
	}
}     
else{
	list0=list2;
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>FAQ常见问答</title>

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

body,html{ height:100%;}

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
	width:25%;
	z-index: 5;
	background-color:white;
    
}

.mb3 {
	position:absolute;
	left:500px;
	top:260px;
	width:20%;
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
        
        
        <link rel="stylesheet" href="js/jspPageing/pagination.css" type="text/css"></link>
        <script type="text/javascript" src="js/jspPageing/jquery.pagination.js"></script>
        
	<script src="js/chickFrom/vanadium.js"></script>
	<link rel="stylesheet" href="js/chickFrom/css/chickFrom.css" type="text/css"></link> 
        
        
        <script type="text/javascript">
               
            // When document has loaded, initialize pagination and form
            $(document).ready(function(){
               pagination('Searchresult', //需要分页的 table ID
                          'Pagination',    // 放分页操作条的 divID
			      {
					items_per_page:10,      // 没页显示 多少行
					num_display_entries:5,  // 显示多少个菜单
					current_page:0,          // 从第几页开始显示  页码从0开始
					num_edge_entries:3,      // 结尾显示多少个页码
					link_to:"#",
					prev_text:"上一页",          
					next_text:"下一页",
					ellipse_text:"...",
					prev_show_always:true,
					next_show_always:true,
					callback:pageselectCallback
					}); // 初始话 分页
                 
            });



            /*权限控制 */
         　　　$(function(){
         		   　　　 var fIds="<%=StringUntil.getMenuSid3(new Integer(StringUntil.isNullR0(page_MENU_ID)))%>";
                          
         			 	  fIds=fIds.split(",");
         			  for(var i=0;i<fIds.length;i++)
         			   {
         				 if(fIds[i]!='')
         				 {
         					 $("body [functionId='function_"+fIds[i]+"']").remove();  
         			     }
         			   }
         	   });
        </script>

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
		<table width=100% height=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="17%" valign=top>
					&nbsp;
				</td>
				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->
					<div id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px; ">
						<form action="<%=basePath %>FAQAction_getList.action?<%=StringUntil.menuUrl("") %>" method="post" >
						<table border=0 align=center cellpadding=0>
							<tr height="26px">
								<td>
									<div align="right">
										<strong>关键字：</strong>
									</div>
								</td>
								<td>
									<input type="text" style="display: block;" name="keyWord"
										id="hours" value="${keyWord }" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'">
								</td>
								<td class="small" align="right">
								<input id="downExcel"  name="downExcel" type="hidden" value="" >
							    <button name="submit" type="submit" 
										onclick="$('#downExcel').val('');"
										class="crmbutton small create" >查 找</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
								<button functionId="function_101" name="submit" type="submit" 
										onclick="$('#downExcel').val('1');"
										class="crmbutton small create" >导 出</button>
								</td>
							</tr>
						</table>
						</form>
						
						<!-- PUBLIC CONTENTS STARTS-->
						<div id="ListViewContents" class="small" style="width: 100%;">
							 
								<table border=0 cellspacing=0 cellpadding=0 width=100%
									class="lvtBg">
									<tr>
										<td>
										 

											<table border=0 cellspacing=0 cellpadding=2 width=100%
												class="small">
												<tr>
													<!-- Buttons -->

													<td style="padding-right: 20px; margin: 0px;" nowrap>

													<table width="90%" border="0">
														<tr>

															<td width="180px">
																<input functionId="function_207"  class="crmbutton small delete" type="button"
																	value="删除" onClick="massDelete('');" />

                                                             <script type="text/javascript">
																	  function massDelete(id)
																	  {
																	  var i=0;
                                                                      var namestr="";
                                                                      var num=$("input[name='selected_id'][checked='checked']");
                                                                      
                                                                      for(i=0;i<num.length;i++){
                                                                         namestr+=","+$(num[i]).val();
                                                                      }
                                                                      namestr+=","+id;
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#massdeleteGroup').show(100);
																	  $('#massdeletename').val(namestr);
																	  return false;
																	  }
															</script>
															</td>

														</tr>
													</table>
													<!-- List View's Buttons and Filters ends -->
													<div style="height: 400px">
														<table id="Searchresult" border=0 cellspacing=1 cellpadding=3 width=100%
															class="lvt small">
															<!-- Table Headers -->
															<thead>
															<tr>
																<td class="lvtCol">
																	<input type="checkbox" name="selectall"
																		id="selectCurrentPageRec"
																		onClick=toggleSelect_ListView(this.checked,"selected_id")>
																</td>
																<td class="lvtCol">
																	No
																</td>
																<td class="lvtCol">
																	标题
																	 
																</td>
																<td class="lvtCol">
																	关键字
																	 
																</td>

																<td class="lvtCol">
																	创建时间
																</td>
																<td class="lvtCol">
																	共享级别
																</td>
																<td class="lvtCol">
																	操作
																</td>
															</tr>
															</thead>
																
		 														<tbody>
															<!-- Table Contents -->
															<%
															 if(list0!=null&&list0.size()>0)
															 {
																 int i;
																 for(i=0;i<list0.size();i++)
																 {
																	 Object[] tfaq= (Object[])list0.get(i);
																	 if(StringUntilDatabase.ifFAQbyLevel((Integer)tfaq[0],(String)tfaq[5])){
																	 %>
																	 	
																	 <tr bgcolor=white
																onMouseOver="this.className='lvtColDataHover'"
																onMouseOut="this.className='lvtColData'" id="row_38">
																<td width="2%">
																	<input type="checkbox" NAME="selected_id" id="38"
																		value='<%=tfaq[1].toString() %>'>
																</td>
																<td>
																	<%=tfaq[1].toString() %>
																</td>
																<td>
																<a   href="FAQCheck_check.action?checkId=<%=tfaq[1] %>">
																	<%=StringUntil.isNull(tfaq[2]) %>
																</a>
																</td>
																<td>
																	<%=StringUntil.isNull(tfaq[3]) %>
																</td>
																<td>
																	<%=StringUntil.isNull(tfaq[4]) %> 
																</td>
																<td>
																<%=StringUntil.getFAQname(StringUntil.isNull(tfaq[5])) %> 
																</td>
																<td>
																	<a functionId="function_206" href="FAQUpdate_check.action?checkId=<%=tfaq[1] %>">编辑</a> |
																	<a functionId="function_207" href='#' onclick="massDelete('<%=tfaq[1] %>');return false;">刪除</a> |
																	 
															</tr>	
																 <% 	 
																 }
																
																}
															 }
															
															%>

															</tbody>
															

														 </table>
													</div>
													
												</td>
											</tr>
											 <tr>
													<td>
														<table width="100%">
															<tr>
															<td width="5%">
															 <!--<input functionId="function_113" class="crmbutton small delete" type="button"
																		value="删除" onClick="massDelete('');return false;" />
															
															--></td>
																<td>
													   <div id="Pagination" class="pagination">
										                   <!-- 放分页操作的 -->
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
						</div>
					</div>
				</td>
					<td width="17%" valign=top>
					&nbsp;
				</td>
			</tr>
		</table>
		<!--
编辑 FAQ
 -->
		<div id="mb" class="mb" style="display: none;">
			<%--
 蒙版图层
 --%>
		</div>
		<div id="editGroup" class="mb3"
			style="padding-top: 20px; padding-bottom: 20px; display: none;">
			<form id="editMenuSaveForm"
				action="<%=basePath %>BasicdataAction_editProduct.action?<%=StringUntil.menuUrl("206")%>"
				method="get">
				<br />
				<input type="hidden" id="updateid" name="product.id" value="" />
				&nbsp; &nbsp; &nbsp; 产品名称：&nbsp; &nbsp; &nbsp;
				<input type="text" id="updatename" name="product.name" value="" />
				<br />
				<br />
				&nbsp; &nbsp; &nbsp; 状态：&nbsp; &nbsp; &nbsp;
				<select id="state" name="product.state">
					<%=
	  StringUntil.getOptions(new String[]{"正常","废弃"},new String[]{"正常","废弃"},"正常")
	  %>
				</select>
				<br />
				<br />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input class="delete" type="button" value="关闭"
					onclick="$('#editGroup,#mb').hide(100);" />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input id="editMenuSave" class="save" type="submit" value="保存" />
			</form>
		</div>

		 
		<!--
    删除
 -->
 
		<div id="massdeleteGroup" class="mb3"
			style="padding-top: 20px; padding-bottom: 20px; display: none;">
			<form id="massdeleteMenuSaveForm"
				action="<%=basePath %>FAQAction_del.action?<%=StringUntil.menuUrl("207")%>"
				method="get">
				<br />
				<input type="hidden" id="massdeletename" name="faq.text"
					value="" />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 确定删除？
				<br />
				<br />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input class="delete" type="button" value="关闭"
					onclick="$('#massdeleteGroup,#mb').hide(100);" />
				&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input id="massdeleteMenuSave" class="save" type="submit" value="删除" />
			</form>
		</div>

		<%--
网页body
--%>
		${retrnText} 
	  <jsp:include page="../page/down.jsp" flush="true"></jsp:include>
	</body>
</html> 

 <script type="text/javascript">
/*权限控制 */
$(function(){
　 var fIds="<%=StringUntil.getMenuSid3(new Integer(page_menu_ID))%>";

           
			 if(fIds.indexOf('175')>-1)
			  {
				 $("div[id='a_function_175']").remove()
				 
			  }else
			  {
				  $("div[id='text_function_175']").remove()
			  }	
			    
	 	  fIds=fIds.split(",");
 
	  for(var i=0;i<fIds.length;i++)
	   {
		 if(fIds[i]!='')
		 {
			 $("body [functionId='function_"+fIds[i]+"']").remove();  
	     }
	   }
});
</script>
