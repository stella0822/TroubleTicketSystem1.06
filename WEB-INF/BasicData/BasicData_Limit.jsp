<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="basicdata.action.I.BasicdataLimitActionI"%>
<%@page import="basicdata.database.TBasicdataLimit"%>
<%@page import="tool.Constants"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.Constants"%>
 
<%
String menu_Fid=StringUntil.getParameter(request,Constants.menu_Fid,"69");         // 主菜单编号
String page_menu_ID=StringUntil.getParameter(request,Constants.page_menu_ID,"79"); // 页面编号

request.setCharacterEncoding("UTF-8");
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
String page_MENU_ID=StringUntil.getPage_menu_ID();

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
//BasicdataActionI sch=(BasicdataActionI)wac.getBean("BasicdataAction");
BasicdataLimitActionI sch=(BasicdataLimitActionI)wac.getBean("BasicdataLimitActionImp");
List list0=sch.BasicdataLimitAction_getAll();
List userlist2=(List)request.getAttribute("userlist2");
String ifalert2=StringUntil.getParameter(request,"ifalert2","");
String username2=StringUntil.getParameter(request,"username2","");
if(userlist2==null||userlist2.isEmpty()){
	if(ifalert2==""){
		list0=sch.BasicdataLimitAction_getAll();
	}
	else{
		list0.clear();
	}
}     
else{
	list0=userlist2;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>基础数据维护--故障单处理上限</title>

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
        
        
       <%--
		      分页
		 --%>
		  <link rel="stylesheet" href="<%=basePath%>js/jspPageing/pagination.css" type="text/css"></link>
		 <script type="text/javascript" src="<%=basePath%>js/jspPageing/jquery.pagination.js"></script>
        
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


            var fIds="";
            /*权限控制 */
         　　        　$(function(){
         		   　　fIds="<%=StringUntil.getMenuSid3(new Integer(StringUntil.isNullR0(page_MENU_ID)))%>";
                          
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

		<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="17%" valign=top>
					&nbsp;
				</td>
				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->

					<div id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px;">
						<form action="<%=basePath %>BasicdataLimitAction_get.action?<%=StringUntil.menuUrl("") %>" method="post" >
						<table border=0 align=center cellpadding=0>
							<tr height="26px">
								<td>
									<div align="right">
										<strong>用户姓名</strong>
									</div>
								</td>
								<td>
									<input type="text" style="display: block;" name="username2"
										id="hours" value="<%=username2%>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'">
								</td>
								<td class="small" align="right">
										<input id="downExcel"  name="downExcel" type="hidden" value="" >
								  
							    <button name="submit" type="submit" 
										onclick="$('#downExcel').val('');"
										class="crmbutton small create" >查 找</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
								<button functionId="function_134" name="submit" type="submit" 
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

																<td functionId="function_133" width="22px">
																	  <img
																			src="themes/softed/images/btnL3Add.gif"
																			alt="创建..." width="22" height="20" border=0
																			style="margin: 0px;" 
																           onclick=" $('#mb').attr('style','z-index: 4;');$('#addGroup').show(100);return false"
																			/>
																</td>
																<td functionId="function_133" width="30px">
															 <a href="#"
															 onclick=" $('#mb').attr('style','z-index: 4;');$('#addGroup').show(100);return false" > 
															 创建 </a>
																</td>
															 
															 
																<td functionId="function_113">
																

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
																		value="删除" onClick="massDelete();return false;"functionId="function_113"/>
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
																		编号

																	</td>
																	<td class="lvtCol">
																		用户名称

																	</td>
																	<td class="lvtCol">
																		处理上限/天
																	</td>
																	<td class="lvtCol">
																		已处理量

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
    TBasicdataLimit limit= (TBasicdataLimit)list0.get(i);
%>
																<!-- Table Contents -->
																<tr bgcolor=white
																	onMouseOver="this.className='lvtColDataHover'"
																	onMouseOut="this.className='lvtColData'" id="row_38">
																	<td width="2%">
																		<input type="checkbox" NAME="selected_id" id="38"
																			value='<%=limit.getLimitid().toString()%>'   >
																	</td>
<td id="td_id_<%=limit.getLimitid().toString()%>" ><%=limit.getLimitid().toString()%></td>
<td id="td_name_<%=limit.getLimitid().toString()%>" ><%=limit.getTUser().getReadName().toString() %></td> 
<td id="td_limitnum_<%=limit.getLimitid().toString()%>" ><%=limit.getLimitnum().toString() %></td>
<td><%=StringUntil.isNull(limit.getTtnum()) %></td>  
<td><%=StringUntil.isNull(limit.getUpdateDate()) %></td>   
                                                               
																	<td>
																	<script type="text/javascript">
																	  function update(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#editGroup').show(100);
																	  
																	  //alert($('#td_name_'+id).text()); 
																	  //alert($('#td_id_'+id).text());
																	  //alert($('#td_limitnum_'+id).text());
																	  $('#updatename').val($('#td_name_'+id).text());
																	  $('#updateid').val($('#td_id_'+id).text());
																	  $('#updatenum').val($('#td_limitnum_'+id).text());
																	  }
																	  function deletepro(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#deleteGroup').show(100);
																	  
																	  //alert($('#td_name_'+id).text()); 
																	  //alert($('#td_id_'+id).text());
																	  //alert($('#td_limitnum_'+id).text());
																	  $('#deletename').val($('#td_name_'+id).text());
																	  $('#deleteid').val($('#td_id_'+id).text());
																	  $('#deletenum').val($('#td_limitnum_'+id).text());
																	  }
																	</script>
																	
																		<a functionId="function_112"  href="#" onclick="update('<%=limit.getLimitid().toString()%>');return false">
																		编辑|</a> 
																		<a functionId="function_113" href='#' onclick="deletepro('<%=limit.getLimitid().toString()%>');return false">
																		刪除</a>
																</tr>
<%}%>
															
		 													</tbody>
															</table>
														</div>
													 
 
													</td>
												</tr>
												<tr>
													<td>
														<table width="100%">
															<tr>
															<td>
															 <input class="crmbutton small delete" type="button"
																		value="删除" onClick="massDelete();return false;" functionId="function_113"/>
															
															</td>
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

											 
										</td>
					            <td width="17%">
									</td>
									</tr>
								</table>
								<!-- MassEdit Feature -->
								 
							 
			 
		
<script type="text/javascript">
		$(function(){ 
           $("#addbox").click(function (e){
	        	   $("#addbox").autopoint( {
	   				url : 'BasicdataLimitAction_alluser.action',
	   				submit : [ "addbox", "" ]
	   			  });
            });
		});
</script>
<!--

添加
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="addGroup" class="mb2" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="addMenuSaveForm" action="<%=basePath %>BasicdataLimitAction_add.action?<%=StringUntil.menuUrl("133")%>" method="post" >
    <br />
	&nbsp; &nbsp; &nbsp;
	用户姓名：&nbsp; &nbsp; &nbsp;
	<input type="text" id="addbox" view="idbox" name="word" value="" class=":required :ajax;BasicdataMatrixAction_post2.action"/><br /><br />
	<input type="hidden" id="idbox" name="limit.TUser.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	处理上限：&nbsp; &nbsp; &nbsp;
	 <input type="text" name="limit.limitnum" value="" class=":required"/><br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#addGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="addMenuSave" class="save" type="submit" value="保存"/>
  </form>
  </div> 

<!--
修改
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="editGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="editMenuSaveForm" action="<%=basePath %>BasicdataLimitAction_edit.action?<%=StringUntil.menuUrl("112")%>" method="post" >
    <br />
    <input type="hidden" id="updateid" name="limit.limitid" value=""/>
    &nbsp; &nbsp; &nbsp;
	用户姓名：&nbsp; &nbsp; &nbsp;
	<input type="text" disabled="disabled" id="updatename" name="username2" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;
	处理上限：&nbsp; &nbsp; &nbsp;
	<input type="text" id="updatenum" name="limit.limitnum" value="" class=":required"/><br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#editGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="editMenuSave" class="save" type="submit" value="保存"/>
  </form>
  </div> 
 
 <!--
删除
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="deleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="deleteMenuSaveForm" action="<%=basePath %>BasicdataLimitAction_delete.action?<%=StringUntil.menuUrl("113")%>" method="post" >
    <br />
    <input type="hidden" id="deleteid" name="limit.limitid" value=""/>
    &nbsp; &nbsp; &nbsp;
	用户姓名：&nbsp; &nbsp; &nbsp;
	<input type="text" disabled="disabled" id="deletename" name="username2" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;
	处理上限：&nbsp; &nbsp; &nbsp;
	 <input type="text" disabled="disabled" id="deletenum" name="limit.limitnum" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#deleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="deleteMenuSave" class="save" type="submit" value="删除"/>
  </form>
  </div><!-- 
  
  
批量删除
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="massdeleteGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="massdeleteMenuSaveForm" action="<%=basePath %>BasicdataLimitAction_deleteAll.action?<%=StringUntil.menuUrl("113")%>" method="post" >
    <br />
    <input type="hidden" id="massdeletename" name="limit.TUser.readName" value=""/>
  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
    确定批量删除这些内容吗？
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

