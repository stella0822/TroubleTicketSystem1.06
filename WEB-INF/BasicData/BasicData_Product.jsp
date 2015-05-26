<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="basicdata.action.I.BasicdataActionI"%>
<%@page import="basicdata.database.TBasicdataProduct"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="tool.Constants"%>
 
<%
String menu_Fid=StringUntil.getParameter(request,Constants.menu_Fid,"69");         // 主菜单编号
String page_menu_ID=StringUntil.getParameter(request,Constants.page_menu_ID,"76"); // 页面编号

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String page_MENU_ID=StringUntil.getPage_menu_ID();

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
BasicdataActionI sch=(BasicdataActionI)wac.getBean("BasicdataAction");
List list0=sch.BasicdataAction_getListToMenuFist();
List pro=(List)request.getAttribute("pro");
String ifalert2=StringUntil.getParameter(request,"ifalert2",null);
String proName=StringUntil.getParameter(request,"proname","");
if(pro==null||pro.isEmpty()){
	if(ifalert2==""){
		list0=sch.BasicdataAction_getListToMenuFist();
	}
	else{
		list0.clear();
	}
}     
else{
	list0=pro;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>基础数据维护--产品数据</title>

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
						<form action="<%=basePath %>BasicdataAction_getList.action?<%=StringUntil.menuUrl("") %>" method="post" >
						<table border=0 align=center cellpadding=0>
							<tr height="26px">
								<td>
									<div align="right">
										<strong>产品名称</strong>
									</div>
								</td>
								<td>
									<input type="text" style="display: block;" name="proname"
										id="hours" value="<%=proName%>" size="20" class=detailedViewTextBox
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

													<td style="padding-right: 20px; margin: 0px; height: 300px"
														nowrap>

														<table border="0" cellpadding="0" cellspacing="0">
															<tr>

																<td functionId="function_100" width="22px">
																	  <img
																			src="themes/softed/images/btnL3Add.gif"
																			alt="创建 产品信息..." width="22" height="20" border=0
																			style="margin: 0px;" 
																            onclick=" $('#mb').attr('style','z-index: 4;');$('#addGroup').show(100);return false"
																			/>
																</td>
																<td  functionId="function_100" width="30px">
													 <a href="#"
													 onclick=" $('#mb').attr('style','z-index: 4;');$('#addGroup').show(100);return false" > 
													 创建 </a>
																</td>
																 
																<td  functionId="function_131">
																

                                                                <script type="text/javascript">
																	  function massDelete()
																	  {
																	  var i=0;
                                                                      var namestr="";
                                                                      var num=$("input[name='selected_id'][checked='checked']");
                                                                      for(i=0;i<num.length;i++){
                                                                         namestr+=$(num[i]).val()+",";
                                                                      }
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#massdeleteGroup').show(100);
																	  $('#massdeletename').val(namestr);
																	  return false;
																	  }
																</script>
																	<!--	<a href="#">
					<img src="themes/softed/images/tbarImport.gif" alt="*导入 故障单" style="margin-bottom:-4px;"  width="22" height="20" border="0"/>导入</a>-->
																	<input class="crmbutton small delete" type="button"
																		value="删除" onClick="massDelete();return false;"  functionId="function_102"/>
																</td>
															</tr>
														</table>
														<!-- List View's Buttons and Filters ends -->
														<div style="height: 300px">
															<table border=0 cellspacing=1 cellpadding=3 width=100%
																class="lvt small" id="Searchresult">
																<!-- Table Headers -->
																<thead>
																<tr>
																	<td class="lvtCol">
																		<input type="checkbox" name="selectall"
																			id="selectCurrentPageRec"
																			onClick="toggleSelect_ListView(this.checked,'selected_id');">
																	</td>
																	<td class="lvtCol">
																		产品编号

																	</td>
																	<td class="lvtCol">
																		产品名称

																	</td>
																	<td class="lvtCol">
																		状态
																	</td>
																	<td class="lvtCol">
																		创建人

																	</td>
																	<td class="lvtCol">
																		修改时间

																	</td>
																	<td class="lvtCol">
																		操作

																	</td>
																</tr>
																</thead>
																
		 														<tbody>
<%
int i;
for(i=0;i<list0.size();i++){
    Object[] product= (Object[])list0.get(i);

%>
																<!-- Table Contents -->
																<tr bgcolor=white
																	onMouseOver="this.className='lvtColDataHover'"
																	onMouseOut="this.className='lvtColData'" id="row_38">
																	<td width="2%">
																		<input type="checkbox" NAME="selected_id" id="38"
																			value='<%=product[0].toString() %>' >
																	</td>
<td id="td_id_<%=product[0].toString() %>" ><%=product[0].toString() %></td>
<td id="td_name_<%=product[0].toString() %>" ><%=product[1].toString() %></td> 
<td id="td_state_<%=product[0].toString() %>" ><%=product[2].toString() %></td>
<td><%=StringUntilDatabase.getUserRnameByID(product[3]) %></td>  
<td><%=StringUntil.isNull(product[4])%></td>   
                                                               
																	<td>
																	<script type="text/javascript">
																	  function update(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#editGroup').show(100);
																	  
																	 // alert($('#td_name_'+id).text()); 
																	  $('#updatename').val($('#td_name_'+id).text());
																	  $('#updateid').val($('#td_id_'+id).text());
																	  var state=$('#td_state_'+id).text();
																	  $("option[value='"+state+"']").attr("selected",true);
																	  $('#updatename').attr("readonly","readonly");
																	  }
																	  function deletepro(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#deleteGroup').show(100);
																	  
																	 // alert($('#td_name_'+id).text()); 
																	  $('#deletename').val($('#td_name_'+id).text());
																	  $('#deleteid').val($('#td_id_'+id).text());
																	  var state=$('#td_state_'+id).text();
																	  $("option[value='"+state+"']").attr("selected",true);
																	  }
																	</script>
																	
																	 	<a functionId="function_103" href="#" onclick="update('<%=product[0].toString() %>');return false">
																		编辑</a> |
																		 
																		<a functionId="function_102" href='#' onclick="deletepro('<%=product[0].toString() %>');return false">
																		刪除</a>
																</tr>
<%}%>
															
															</tbody>
															</table>
														</div>
														<table border=0 cellspacing=0 cellpadding=2 width=100%>
															<tr>
																<td style="padding-right: 20px" nowrap>
																	<input class="crmbutton small delete" type="button"
																		value="删除" onClick="massDelete();return false;"  functionId="function_102"/>

																</td>
																<td align="right" width=40%></td>
															</tr>
														</table>




													</td>
												</tr>
												<tr>
													<td>
														<table width="100%">
															<tr>
																
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
				<td width="17%">
				</td>
			</tr>
		</table><!--

添加 产品数据
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="addGroup" class="mb2" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="addMenuSaveForm2" action="<%=basePath %>BasicdataAction_addProduct.action?<%=StringUntil.menuUrl("100")%>" method="get" >
    <br />
	&nbsp; &nbsp; &nbsp;
	产品名称：&nbsp; &nbsp; &nbsp;
	<input type="text" id="name" name="product.name" value="" class=":required :ajax;BasicdataAction_getpro.action"/>	<br /><br />
	&nbsp; &nbsp; &nbsp;
	状态：&nbsp; &nbsp; &nbsp;
	 <select name="product.state">
	 <%=
	  StringUntil.getOptions(new String[]{"正常","废弃"},new String[]{"正常","废弃"},"正常")
	  %>
	  </select>
	 <br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#addGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="addMenuSave" class="save" type="submit" value="保存"/>
  </form>
  </div> 

<!--
修改 产品数据
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="editGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="editMenuSaveForm" action="<%=basePath %>BasicdataAction_editProduct.action?<%=StringUntil.menuUrl("103")%>" method="get" >
    <br />
    <input type="hidden" id="updateid" name="product.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	产品名称：&nbsp; &nbsp; &nbsp;
	<input type="text" id="updatename" name="product.name" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;
	状态：&nbsp; &nbsp; &nbsp;
	 <select id="state" name="product.state">
	 <%=
	  StringUntil.getOptions(new String[]{"正常","废弃"},new String[]{"正常","废弃"},"正常")
	  %>
	  </select>
	 <br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#editGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="editMenuSave" class="save" type="submit" value="保存"/>
  </form>
  </div> 
 
 <!--
删除产品
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="deleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="deleteMenuSaveForm" action="<%=basePath %>BasicdataAction_deleteProduct.action?<%=StringUntil.menuUrl("102")%>" method="get" >
    <br />
    <input type="hidden" id="deleteid" name="product.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	产品名称：&nbsp; &nbsp; &nbsp;
	<input type="text" disabled="disabled" id="deletename" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;
	状态：&nbsp; &nbsp; &nbsp;
	 <select id="state" disabled="disabled">
	 <%=
	  StringUntil.getOptions(new String[]{"正常","废弃"},new String[]{"正常","废弃"},"正常")
	  %>
	  </select>
	 <br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#deleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="deleteMenuSave" class="save" type="submit" value="删除"/>
  </form>
  </div> 
  
  <!--
批量删除产品
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="massdeleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="massdeleteMenuSaveForm" action="<%=basePath %>BasicdataAction_deleteAllProduct.action?<%=StringUntil.menuUrl("131")%>" method="get" >
    <br />
    <input type="hidden" id="massdeletename" name="product.name" value=""/>
  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
    确定批量删除这些产品吗？
	 <br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#massdeleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="massdeleteMenuSave" class="save" type="submit" value="删除"/>
  </form>
  </div>  
 ${ifalert}
 ${ifalert2}

		<%--
网页body
--%>
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
