<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
 
<%@page import="basicdata.database.TBasicdataProduct"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="basicdata.action.I.BasicdataMatrixActionI"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="tool.Constants"%>
 
<%
String menu_Fid=StringUntil.getParameter(request,Constants.menu_Fid,"69");         // 主菜单编号
String page_menu_ID=StringUntil.getParameter(request,Constants.page_menu_ID,"77"); // 页面编号

request.setCharacterEncoding("UTF-8");
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String page_MENU_ID=StringUntil.getPage_menu_ID();

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
BasicdataMatrixActionI sch=(BasicdataMatrixActionI)wac.getBean("BasicdataMatrixActionImp");
List list0=sch.BasicdataMatrixAction_getAll();
List prolist2=(List)request.getAttribute("prolist2");
String ifalert2=StringUntil.getParameter(request,"ifalert2","");
String proName=StringUntil.getParameter(request,"proname","");
Object type1=StringUntil.getParameterToobject(request,"type1","0");

if(prolist2==null||prolist2.isEmpty()){
	if(ifalert2==""){
		list0=sch.BasicdataMatrixAction_getAll();
	}
	else{
		list0.clear();
	}
}     
else{
	list0=prolist2;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

        <base href="<%=basePath%>">
		<title>基础数据维护--能力矩阵</title>

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
	width:20%;
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
					items_per_page:13,      // 没页显示 多少行
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
						<form action="<%=basePath %>BasicdataMatrixAction_get.action?<%=StringUntil.menuUrl("69") %>" method="post" >
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
									
									<input id="type1"  name="type1" type="hidden" value="<%=StringUntil.isNullR0(type1) %>" >
							    <button name="submit" type="submit" 
										onclick="$('#downExcel').val('');"
										class="crmbutton small create" >查 找</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
								<button functionId="function_106" name="submit" type="submit" 
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
								 

											<table border=0 cellspacing=0 cellpadding=2 width=100%
												class="small">
												<tr>
													<!-- Buttons -->

													<td style="padding-right: 20px; margin: 0px; height: 300px"
														nowrap>

														<table border="0" cellpadding="0" cellspacing="0">
															<tr>
															 
																 
																<td>
																 

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
																	  
																	  function showUpdateDele(a)
																	  {
																		   var divHtml="<div id='update"+$(a).attr('id')+"' style='display:none'>";
                                                                               fIds+="";
                                                                             /// alert(fIds);
																		     if(fIds.indexOf(",104")==-1&&fIds.indexOf("104,")==-1)
	                                                                            {
	                                                                            	divHtml+="<button onclick=\"deletepro('"+$(a).attr('id')+"')\">删除</button> "; 
	                                                                            }
	                                                                            if(fIds.indexOf(",105")==-1&&fIds.indexOf("105,")==-1)
	                                                                            {
	                                                                            	divHtml+="<button onclick=\"updatepro('"+$(a).attr('id')+"')\">修改</button>";
	                                                                            }
																		   
                                                                            divHtml+="</div>";
																		     
																	  //	$(a).append("<div id='update"+$(a).attr('id')+"' style='display:none'><button onclick=\"updatepro('"+$(a).attr('id')+"')\">修改</button><button onclick=\"deletepro('"+$(a).attr('id')+"')\">删除</button> </div>");
																	  
																	  $(a).append(divHtml);
																	  	//alert($(a).html());
																	  	//return false;
																	  }
																	  function hideUpdateDele(a)
																	  {
																	  $("update"+$(a).attr('id')).empty;
																	  $("update"+$(a).attr('id')).remove(); 
																	  }
																	  
																</script>
															 
																</td>
																<td width="22px">
																	  
																</td>
																<td width="22px">
																	  
																</td>
																
					<td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
				    <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=10&menu_Fid=69&page_menu_ID=77&FunctionID=209">全部</a></div></td>
					<td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '"> 
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=1&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第一执行人</a></div></td>
					<td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=2&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第二执行人</a></div></td>
					<td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=3&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第三执行人</a></div></td>
					  <td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=4&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第四执行人</a></div></td>
					  </tr><tr>
					  											<td width="22px">
																	  
																</td>
																<td width="22px">
																	  
																</td>
																<td width="22px">
																  
																</td>
					  <td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=5&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第五执行人</a></div></td>
					  <td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=6&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第六执行人</a></div></td>
					  <td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=7&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第七执行人</a></div></td>
					  <td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '">
					  <div align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=8&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有第八执行人</a></div></td>
				    <td width="150px" onMouseOver="this.className='detailedViewTextBoxOn'"  
					     onMouseOut="this.className=' '"> 
					  <div  align="center"><a href="BasicdataMatrixAction_getAll2.action?type1=9&menu_Fid=69&page_menu_ID=77&FunctionID=209">没有执行人</a></div></td>
						 
															</tr>
														</table>
														<!-- List View's Buttons and Filters ends -->
														<div style="height: 300px">
															<table border=0 cellspacing=1 cellpadding=3 width=100%
																class="lvt small" id="Searchresult">
																<!-- Table Headers -->
																<thead>
																<tr>
																	<td class="lvtCol" width="60">
																		产品编号

																	</td>
																	<td class="lvtCol">
																		产品名称

																	</td>
																	<td class="lvtCol">
																		第一执行人
																	</td>
																	<td class="lvtCol">
																		第二执行人

																	</td>
																	<td class="lvtCol">
																		第三执行人

																	</td>
																	<td class="lvtCol">
																		第四执行人
																		
																	</td>
																	<td class="lvtCol">
																		第五执行人

																	</td>
																	<td class="lvtCol">
																		第六执行人

																	</td>
																	<td class="lvtCol">
																		第七执行人

																	</td>
																	<td class="lvtCol">
																		第八执行人

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
<td id="td_id_<%=product[0].toString() %>" ><%=product[0].toString() %></td>
<td id="td_name_<%=product[0].toString() %>" ><%=product[1].toString() %></td> 
<td id="_1_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_1_<%=product[0].toString() %>').show();" onMouseout="$('#update_1_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[2]) %>
	</td>
<td id="_2_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_2_<%=product[0].toString() %>').show();" onMouseout="$('#update_2_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[3]) %>
	</td>  
<td id="_3_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_3_<%=product[0].toString() %>').show();" onMouseout="$('#update_3_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[4]) %>
	</td>   
<td id="_4_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_4_<%=product[0].toString() %>').show();" onMouseout="$('#update_4_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[5]) %>
	</td>
<td id="_5_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_5_<%=product[0].toString() %>').show();" onMouseout="$('#update_5_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[6]) %>
	</td>  
<td id="_6_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_6_<%=product[0].toString() %>').show();" onMouseout="$('#update_6_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[7]) %>
	</td>  
<td id="_7_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_7_<%=product[0].toString() %>').show();" onMouseout="$('#update_7_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[8]) %>
	</td>
<td id="_8_<%=product[0].toString() %>" onMouseOver="showUpdateDele(this);$('#update_8_<%=product[0].toString() %>').show();" onMouseout="$('#update_8_<%=product[0].toString() %>').hide();hideUpdateDele(this);"  >
	<%=StringUntilDatabase.getUserRnameByID(product[9]) %>
	</td>   
                                                               
																	<script type="text/javascript">
																	  function updatepro(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#editGroup').show(100);
																	  
																	  var tdId=new Array();
																	  tdId=id.split("_");
																	  var exeId=tdId[1];
																	  var proId=tdId[2];	
																	  
																	  var strname;	
																	  var strname2;
																	  
																	  $('#updatename').val($('#td_name_'+proId).text());
																	  $('#updateid').val($('#td_id_'+proId).text());
																		  switch(exeId){
																		  	case "1":
																		  		$('#updatelabel').text('第一');
																		  		strname=(($('#_1_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe1');
																		  		break;
																		  	case "2":
																		  		$('#updatelabel').text('第二');
																		  		strname=(($('#_2_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe2');
																		  		break;
																		  	case "3":
																		  		$('#updatelabel').text('第三');
																		  		strname=(($('#_3_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe3');
																		  		break;
																		  	case "4":
																		  		$('#updatelabel').text('第四');
																		  		strname=(($('#_4_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe4');
																		  		break;
																		  	case "5":
																		  		$('#updatelabel').text('第五');
																		  		strname=(($('#_5_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe5');
																		  		break;
																		  	case "6":
																		  		$('#updatelabel').text('第六');
																		  		strname=(($('#_6_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe6');
																		  		break;
																		  	case "7":
																		  		$('#updatelabel').text('第七');
																		  		strname=(($('#_7_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe7');
																		  		break;
																		  	case "8":
																		  		$('#updatelabel').text('第八');
																		  		strname=(($('#_8_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#updateexe1').val(strname);
																		  		$('#updateexe1id').attr('name','product.exe8');
																		  		break;
																		  }
																	  $('#updatename').attr("readonly","readonly");
																	  }
																	  function deletepro(id)
																	  {
																	  $('#mb').attr('style','z-index: 4;');
																	  $('#deleteGroup').show(100);
																	  
																	  var tdId=new Array();
																	  tdId=id.split("_");
																	  var exeId=tdId[1];
																	  var proId=tdId[2];	
																	  
																	  var strname;	
																	  
																	  $('#deletename').val($('#td_name_'+proId).text());
																	  $('#deleteid').val($('#td_id_'+proId).text());
																		  switch(exeId){
																		  	case "1":
																		  		$('#updatelabel').text('第一');
																		  		strname=(($('#_1_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe1').val(strname);
																		  		$('#deleteexe2').val("");
																		  		$('#deleteexe3').val("");
																		  		$('#deleteexe4').val("");
																		  		$('#deleteexe5').val("");
																		  		$('#deleteexe6').val("");
																		  		$('#deleteexe7').val("");
																		  		$('#deleteexe8').val("");
																		  		$('#deleteexe1').show();
																		  		$('#deleteexe2').hide();
																		  		$('#deleteexe3').hide();
																		  		$('#deleteexe4').hide();
																		  		$('#deleteexe5').hide();
																		  		$('#deleteexe6').hide();
																		  		$('#deleteexe7').hide();
																		  		$('#deleteexe8').hide();
																		  		$('#deleteexe1').attr("readonly","readonly");
																		  		$('#deleteexe1id').attr("value","0");
																		  		break;
																		  	case "2":
																		  		$('#deletelabel').text('第二');
																		  		strname=(($('#_2_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe2').val(strname);
																		  		$('#deleteexe1').val("");
																		  		$('#deleteexe3').val("");
																		  		$('#deleteexe4').val("");
																		  		$('#deleteexe5').val("");
																		  		$('#deleteexe6').val("");
																		  		$('#deleteexe7').val("");
																		  		$('#deleteexe8').val("");
																		  		$('#deleteexe2').show();
																		  		$('#deleteexe1').hide();
																		  		$('#deleteexe3').hide();
																		  		$('#deleteexe4').hide();
																		  		$('#deleteexe5').hide();
																		  		$('#deleteexe6').hide();
																		  		$('#deleteexe7').hide();
																		  		$('#deleteexe8').hide();
																		  		$('#deleteexe2').attr("readonly","readonly");
																		  		$('#deleteexe2id').attr("value","0");
																		  		break;
																		  	case "3":
																		  		$('#deletelabel').text('第三');
																		  		strname=(($('#_3_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe3').val(strname);
																		  		$('#deleteexe1').val("");
																		  		$('#deleteexe2').val("");
																		  		$('#deleteexe4').val("");
																		  		$('#deleteexe5').val("");
																		  		$('#deleteexe6').val("");
																		  		$('#deleteexe7').val("");
																		  		$('#deleteexe8').val("");
																		  		$('#deleteexe3').show();
																		  		$('#deleteexe1').hide();
																		  		$('#deleteexe2').hide();
																		  		$('#deleteexe4').hide();
																		  		$('#deleteexe5').hide();
																		  		$('#deleteexe6').hide();
																		  		$('#deleteexe7').hide();
																		  		$('#deleteexe8').hide();
																		  		$('#deleteexe3').attr("readonly","readonly");
																		  		$('#deleteexe3id').attr("value","0");
																		  		break;
																		  	case "4":
																		  		$('#deletelabel').text('第四');
																		  		strname=(($('#_4_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe4').val(strname);
																		  		$('#deleteexe1').val("");
																		  		$('#deleteexe2').val("");
																		  		$('#deleteexe3').val("");
																		  		$('#deleteexe5').val("");
																		  		$('#deleteexe6').val("");
																		  		$('#deleteexe7').val("");
																		  		$('#deleteexe8').val("");
																		  		$('#deleteexe4').show();
																		  		$('#deleteexe1').hide();
																		  		$('#deleteexe2').hide();
																		  		$('#deleteexe3').hide();
																		  		$('#deleteexe5').hide();
																		  		$('#deleteexe6').hide();
																		  		$('#deleteexe7').hide();
																		  		$('#deleteexe8').hide();
																		  		$('#deleteexe4').attr("readonly","readonly");
																		  		$('#deleteexe4id').attr("value","0");
																		  		break;
																		  	case "5":
																		  		$('#deletelabel').text('第五');
																		  		strname=(($('#_5_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe5').val(strname);
																		  		$('#deleteexe1').val("");
																		  		$('#deleteexe2').val("");
																		  		$('#deleteexe4').val("");
																		  		$('#deleteexe3').val("");
																		  		$('#deleteexe6').val("");
																		  		$('#deleteexe7').val("");
																		  		$('#deleteexe8').val("");
																		  		$('#deleteexe5').show();
																		  		$('#deleteexe1').hide();
																		  		$('#deleteexe2').hide();
																		  		$('#deleteexe4').hide();
																		  		$('#deleteexe3').hide();
																		  		$('#deleteexe6').hide();
																		  		$('#deleteexe7').hide();
																		  		$('#deleteexe8').hide();
																		  		$('#deleteexe5').attr("readonly","readonly");
																		  		$('#deleteexe5id').attr("value","0");
																		  		break;
																		  	case "6":
																		  		$('#deletelabel').text('第六');
																		  		strname=(($('#_6_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe6').val(strname);
																		  		$('#deleteexe1').val("");
																		  		$('#deleteexe2').val("");
																		  		$('#deleteexe4').val("");
																		  		$('#deleteexe5').val("");
																		  		$('#deleteexe3').val("");
																		  		$('#deleteexe7').val("");
																		  		$('#deleteexe8').val("");
																		  		$('#deleteexe6').show();
																		  		$('#deleteexe1').hide();
																		  		$('#deleteexe2').hide();
																		  		$('#deleteexe4').hide();
																		  		$('#deleteexe5').hide();
																		  		$('#deleteexe3').hide();
																		  		$('#deleteexe7').hide();
																		  		$('#deleteexe8').hide();
																		  		$('#deleteexe6').attr("readonly","readonly");
																		  		$('#deleteexe6id').attr("value","0");
																		  		break;
																		  	case "7":
																		  		$('#deletelabel').text('第七');
																		  		strname=(($('#_7_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe7').val(strname);
																		  		$('#deleteexe1').val("");
																		  		$('#deleteexe2').val("");
																		  		$('#deleteexe4').val("");
																		  		$('#deleteexe5').val("");
																		  		$('#deleteexe6').val("");
																		  		$('#deleteexe3').val("");
																		  		$('#deleteexe8').val("");
																		  		$('#deleteexe7').show();
																		  		$('#deleteexe1').hide();
																		  		$('#deleteexe2').hide();
																		  		$('#deleteexe4').hide();
																		  		$('#deleteexe5').hide();
																		  		$('#deleteexe6').hide();
																		  		$('#deleteexe3').hide();
																		  		$('#deleteexe8').hide();
																		  		$('#deleteexe7').attr("readonly","readonly");
																		  		$('#deleteexe7id').attr("value","0");
																		  		break;
																		  	case "8":
																		  		$('#deletelabel').text('第八');
																		  		strname=(($('#_8_'+proId).text()).split(" "))[0];
																		  		strname2=strname.split("修改");
																		  		if(strname2[1]=="删除"){
																		  			strname="";
																		  		}
																		  		$('#deleteexe8').val(strname);
																		  		$('#deleteexe1').val("");
																		  		$('#deleteexe2').val("");
																		  		$('#deleteexe4').val("");
																		  		$('#deleteexe5').val("");
																		  		$('#deleteexe6').val("");
																		  		$('#deleteexe7').val("");
																		  		$('#deleteexe3').val("");
																		  		$('#deleteexe8').show();
																		  		$('#deleteexe1').hide();
																		  		$('#deleteexe2').hide();
																		  		$('#deleteexe4').hide();
																		  		$('#deleteexe5').hide();
																		  		$('#deleteexe6').hide();
																		  		$('#deleteexe7').hide();
																		  		$('#deleteexe3').hide();
																		  		$('#deleteexe8').attr("readonly","readonly");
																		  		$('#deleteexe8id').attr("value","0");
																		  		break;
																		  }
																	  $('#deletename').attr("readonly","readonly");
																	  }
																	</script>
																	
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
								<!-- MassEdit Feature -->
						 
						 
						</div>
					</div>
				</td>
				<td width="17%">
				</td>
			</tr>
		</table>

<script type="text/javascript">
		$(function(){ 
           $("#updateexe1").click(function (e){
	        	   $("#updateexe1").autopoint( {
	   				url : 'BasicdataLimitAction_alluser.action',
	   				submit : [ "updateexe1", "" ]
	   			  });
            });
		});
</script>

<!--
修改
 --><div id="mb"  class="mb" style="display: none;"><%--
 蒙版图层
 --%>
 </div> 
   <div id="editGroup" class="mb3" style="padding-top: 20px;padding-bottom: 20px;display: none;">  
   <form id="editMenuSaveForm" action="<%=basePath %>BasicdataMatrixAction_edit.action?<%=StringUntil.menuUrl("104")%>" method="get" >
    <br />
    <input type="hidden" id="updateid" name="product.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	产品名称：&nbsp; &nbsp; &nbsp;
	<input type="text" id="updatename" name="product.name" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;
	<label id="updatelabel"></label>执行人：
	<input id="updateexe1" view="updateexe1id" value="" class=":required :ajax;BasicdataMatrixAction_get2.action"/>
	<input type="hidden" id="updateexe1id"/>
	<br /><br />
	
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
   <form id="deleteMenuSaveForm" action="<%=basePath %>BasicdataMatrixAction_edit.action?<%=StringUntil.menuUrl("105")%>" method="get" >
    <br />
    <input type="hidden" id="deleteid" name="product.id" value=""/>
	&nbsp; &nbsp; &nbsp;
	产品名称：&nbsp; &nbsp; &nbsp;
	<input type="text" id="deletename" name="product.name" value=""/><br /><br />
	&nbsp; &nbsp; &nbsp;
	<label id="deletelabel"></label>执行人：
	<input id="deleteexe1" view="updateexe1id" value=""/>
	<input id="deleteexe2" view="updateexe2id" value=""/>
	<input id="deleteexe3" view="updateexe3id" value=""/>
	<input id="deleteexe4" view="updateexe4id" value=""/>
	<input id="deleteexe5" view="updateexe5id" value=""/>
	<input id="deleteexe6" view="updateexe6id" value=""/>
	<input id="deleteexe7" view="updateexe7id" value=""/>
	<input id="deleteexe8" view="updateexe8id" value=""/>
	<input type="hidden" id="deleteexe1id" name="product.exe1" value=""/>
	<input type="hidden" id="deleteexe2id" name="product.exe2" value=""/>
	<input type="hidden" id="deleteexe3id" name="product.exe3" value=""/>
	<input type="hidden" id="deleteexe4id" name="product.exe4" value=""/>
	<input type="hidden" id="deleteexe5id" name="product.exe5" value=""/>
	<input type="hidden" id="deleteexe6id" name="product.exe6" value=""/>
	<input type="hidden" id="deleteexe7id" name="product.exe7" value=""/>
	<input type="hidden" id="deleteexe8id" name="product.exe8" value=""/>
	<br /><br />
	
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  
	<input class="delete" type="button" value="关闭" onclick="$('#deleteGroup,#mb').hide(100);"/>
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
	<input id="editMenuSave" class="save" type="submit" value="删除"/>
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

