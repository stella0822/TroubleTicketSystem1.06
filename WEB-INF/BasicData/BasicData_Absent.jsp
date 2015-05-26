<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="basicdata.action.I.BasicdataAbsentActionI"%>
<%@page import="basicdata.database.TBasicdataAbsent"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.DateTimeUtil" %>
<%@page import="tool.Constants"%>
 
<%
String menu_Fid=StringUntil.getParameter(request,Constants.menu_Fid,"69");         // 主菜单编号
String page_menu_ID=StringUntil.getParameter(request,Constants.page_menu_ID,"78"); // 页面编号

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String page_MENU_ID=StringUntil.getPage_menu_ID();;
 


WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
BasicdataAbsentActionI sch=(BasicdataAbsentActionI)wac.getBean("BasicdataAbsentActionImp");
List list0=sch.BasicdataAbsentAction_getAll();
List userlist2=(List)request.getAttribute("userlist2");
String ifalert2=StringUntil.getParameter(request,"ifalert2","");
String username=StringUntil.getParameter(request,"username","");
if(userlist2==null||userlist2.isEmpty()){
	if(ifalert2==""){
		list0=sch.BasicdataAbsentAction_getAll();
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
		<title>基础数据维护--排班时间</title>
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
		<script type="text/javascript" src="include/js/checkDate2.js"></script>
		<script type="text/javascript" src="include/js/showdate.js"></script>
		<link rel="stylesheet" href="themes/softed/style.css" type="text/css"></link>
		
		<link rel="stylesheet" href="<%=basePath %>js/autopoint/autopoint.css" type="text/css"></link>
        <script src="<%=basePath %>js/autopoint/autopoint.js"></script>
        
        
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

		<table width=100% border=0 align=center cellpadding=0 cellspacing=0>
			<tr>
				<td width="17%" valign=top>
					&nbsp;
				</td>
				<td class="showPanelBg" valign="top" style="padding: 13px;">
					<!-- SIMPLE SEARCH -->

					<div  id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px;">
						<form action="<%=basePath %>BasicdataAbsentAction_get.action?<%=StringUntil.menuUrl("") %>" method="post" >
						<table border=0 align=center cellpadding=0>
							<tr height="26px">
								<td>
									<div align="right">
										<strong>用户姓名</strong>
									</div>
								</td>
								<td>
									<input type="text" style="display: block;" name="username"
										id="hours" value="<%=username%>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'">
								</td>
								<td class="small" align="right">
								<input id="downExcel"  name="downExcel" type="hidden" value="" >
							    <button name="submit" type="submit" 
										onclick="$('#downExcel').val('');"
										class="crmbutton small create" >查 找</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
								<button functionId="function_110" name="submit" type="submit" 
										onclick="$('#downExcel').val('1');"
										class="crmbutton small create" >导 出</button>
								</td>
							</tr>
						</table>
						</form>
						
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

													<td style="padding-right: 20px; margin: 0px; height: 300px"
														nowrap>
 															 <script type="text/javascript">
																	  function massDelete()
																	  {
																	  var i=0;
                                                                      var namestr="";
                                                                      var num=$("input[name='selected_id'][checked=true]");
                                                                      for(i=0;i<num.length;i++){
                                                                         namestr+=$(num[i]).val()+",";
                                                                      }
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#massdeleteGroup').show(100);
																	  $('#massdeletename').val(namestr);
																	  return false;
																	  }
																</script>
														<table functionId="function_108"  border="0" cellpadding="0" cellspacing="0">
															<tr>

																<td width="22px">
																	  <img
																			src="themes/softed/images/btnL3Add.gif"
																			alt="创建..." width="22" height="20" border=0
																			style="margin: 0px;" 
																            onclick=" $('#mb').attr('style','z-index: 4;');$('#addGroup').show(100);return false"
																			/>
																</td>
																<td width="30px">
													               <a href="#"  onclick=" $('#mb').attr('style','z-index: 4;');$('#addGroup').show(100);return false" > 
													                              创建 </a>
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
																		编号

																	</td>
																	<td class="lvtCol">
																		用户名称
																	<%
																	Date date=new Date();
																	 %>
																	</td>
																	<td class="lvtCol" id="td_date_0">
																		<%=DateTimeUtil.date2Str(date)%><br>&nbsp&nbsp&nbsp<%=DateTimeUtil.dateTime4Str(date) %>
																		
																	</td>
																	<td class="lvtCol" id="td_date_1">
																		<%=DateTimeUtil.date2Str2(date,1)%><br>&nbsp&nbsp&nbsp<%=DateTimeUtil.dateTime4Str2(date,1) %>
																		
																	</td>
																	<td class="lvtCol" id="td_date_2">
																		<%=DateTimeUtil.date2Str2(date,2)%><br>&nbsp&nbsp&nbsp<%=DateTimeUtil.dateTime4Str2(date,2) %>
																		
																	</td>
																	<td class="lvtCol" id="td_date_3">
																		<%=DateTimeUtil.date2Str2(date,3)%><br>&nbsp&nbsp&nbsp<%=DateTimeUtil.dateTime4Str2(date,3) %>
																		
																	</td>
																	<td class="lvtCol" id="td_date_4">
																		<%=DateTimeUtil.date2Str2(date,4)%><br>&nbsp&nbsp&nbsp<%=DateTimeUtil.dateTime4Str2(date,4) %>
																		
																	</td>
																	<td class="lvtCol" id="td_date_5">
																		<%=DateTimeUtil.date2Str2(date,5)%><br>&nbsp&nbsp&nbsp<%=DateTimeUtil.dateTime4Str2(date,5) %>
																		
																	</td>
																	<td class="lvtCol" id="td_date_6">
																		<%=DateTimeUtil.date2Str2(date,6)%><br>&nbsp&nbsp&nbsp<%=DateTimeUtil.dateTime4Str2(date,6) %>
																		
																	</td>
		 														</tr>
		 														</thead>
		 														<tbody>
		 													
<script type="text/javascript">
String.prototype.trim = function () {//解决ie不支持trim
return this .replace(/^\s\s*/, '' ).replace(/\s\s*$/, '' );
}

function checkClick(a,id,readname,step)
{
    var check=$(a).attr("checked");
    var date=$("#td_date_"+step).html().split("<")[0];
    date=date.trim();

    if(check=="checked"){
		//delete in absent table
		$(a).attr("checked",false);
		$('#editidbox').val(id);
		$('#editbox').val(readname).attr("readonly","readonly");
		$('#editdatebox').attr("onclick","");
		$('#editdatebox').val(date);
		$('#mb').attr('style','z-index: 4;');
		$('#editGroup').show(100);
	}
	else{
		//add in absent table
		$(a).attr("checked","checked");
		$('#idbox').val(id);
		$('#addbox').val(readname).attr("readonly","readonly");
		$('#datebox').val(date).attr("onclick","");
		$('#mb').attr('style','z-index: 4;');
		$('#addGroup').show(100);
	} 
}
</script>
<%
int i;
for(i=0;i<list0.size();i++){
    TUser userall= (TUser)list0.get(i);
%>
																<!-- Table Contents -->
																<tr bgcolor=white
																	onMouseOver="this.className='lvtColDataHover'"
																	onMouseOut="this.className='lvtColData'" id="row_38">
<td id="td_id_<%=userall.getId().toString()%>" ><%=userall.getId().toString()%></td> 
<td id="td_name_<%=userall.getId().toString()%>" ><%=userall.getReadName().toString()%></td> 

<td<%=sch.BasicdataAbsentAction_judge(userall.getId().toString(),DateTimeUtil.date2Str(date)) %>
 value=''   onClick="checkClick(this,'<%=userall.getId().toString()%>','<%=userall.getReadName().toString()%>','0');"></td> 
<td<%=sch.BasicdataAbsentAction_judge(userall.getId().toString(),DateTimeUtil.date2Str2(date,1)) %>
 value=''   onClick="checkClick(this,'<%=userall.getId().toString()%>','<%=userall.getReadName().toString()%>','1');"></td> 
<td<%=sch.BasicdataAbsentAction_judge(userall.getId().toString(),DateTimeUtil.date2Str2(date,2)) %>
 value=''   onClick="checkClick(this,'<%=userall.getId().toString()%>','<%=userall.getReadName().toString()%>','2');"></td> 
<td<%=sch.BasicdataAbsentAction_judge(userall.getId().toString(),DateTimeUtil.date2Str2(date,3)) %>
 value=''   onClick="checkClick(this,'<%=userall.getId().toString()%>','<%=userall.getReadName().toString()%>','3');"></td> 
<td<%=sch.BasicdataAbsentAction_judge(userall.getId().toString(),DateTimeUtil.date2Str2(date,4)) %>
 value=''   onClick="checkClick(this,'<%=userall.getId().toString()%>','<%=userall.getReadName().toString()%>','4');"></td> 
<td<%=sch.BasicdataAbsentAction_judge(userall.getId().toString(),DateTimeUtil.date2Str2(date,5)) %>
 value=''   onClick="checkClick(this,'<%=userall.getId().toString()%>','<%=userall.getReadName().toString()%>','5');"></td> 
<td<%=sch.BasicdataAbsentAction_judge(userall.getId().toString(),DateTimeUtil.date2Str2(date,6)) %>
 value=''   onClick="checkClick(this,'<%=userall.getId().toString()%>','<%=userall.getReadName().toString()%>','6');"></td>
																	
																</tr>
<%}%>
															</tbody>
															</table>
														</div>
														<table border=0 cellspacing=0 cellpadding=2 width=100%>
															<tr>
																<td style="padding-right: 20px" nowrap>

																</td>
																<td align="right" width=40%></td>
															</tr>
														</table>




													</td>
												</tr>
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
							 
						 
						</div>
					</div>
				</td>
				<td width="17%">
				</td>
			</tr>
		</table>
		
		
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
 -->
 <div functionId="function_108">
 <div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="addGroup" class="mb2" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="addMenuSaveForm" action="<%=basePath %>BasicdataAbsentAction_add.action?<%=StringUntil.menuUrl("108")%>" method="post" >
    <br />
	&nbsp; &nbsp; &nbsp;
	用户姓名：&nbsp; &nbsp; &nbsp;
	<input type="text" id="addbox" view="idbox" name="word" value="" class=":required :ajax;BasicdataMatrixAction_get2.action"/><br /><br />
	<input type="hidden" id="idbox" name="absent.TUser.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	缺席时间：&nbsp; &nbsp; &nbsp;
	 <input type="text" id="datebox" name="absent.absentTime" onclick="setday(this);" readonly="readonly" value="" class=":required"/><br /><br />
	 &nbsp; &nbsp; &nbsp;
	备注： &nbsp; &nbsp; &nbsp;
	<textarea rows="5" cols="20" id="remarkbox" name="absent.remarks" value=""></textarea><br /><br />
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#addGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="addMenuSave" class="save" type="submit" value="保存"/>
  </form>
  </div>
  </div>
  <%-- 
 删除缺席时间
   --%>
   <div functionId="function_109">
  
    <div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
    </div> 
   <div id="editGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="editMenuSaveForm" action="<%=basePath %>BasicdataAbsentAction_delete.action?<%=StringUntil.menuUrl("109")%>" method="post" >
    <br />
	&nbsp; &nbsp; &nbsp;
	用户姓名：&nbsp; &nbsp; &nbsp;
	<input type="text" id="editbox" view="idbox" name="word" value=""/><br /><br />
	<input type="hidden" id="editidbox" name="absent.TUser.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	缺席时间：&nbsp; &nbsp; &nbsp;
	 <input type="text" id="editdatebox" name="absent.absentTime" onclick="setday(this);" readonly="readonly" value=""/><br /><br />

	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#editGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="editMenuSave" class="save" type="submit" value="删除"/>
  </form>
  </div> 
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
