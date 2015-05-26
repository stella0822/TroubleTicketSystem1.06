<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="log.TLog"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="user.database.TUser"%>
<%@page import="tool.Constants"%>
<%@page import="Statements.action.imp.StatementsBean"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="Statements.action.I.StatementsActionI"%>
<%@page import="Statements.dao.Statements"%>
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

WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
StatementsActionI sch=(StatementsActionI)wac.getBean("StatementsAction");
List list1=null;
String searchProName=StringUntil.getParameter(request,"proName","");
String searchDate1=StringUntil.getParameter(request,"date1","");
String searchDate2=StringUntil.getParameter(request,"date2","");

String ifalert=StringUntil.getParameter(request,"ifalert",null);
	if(ifalert!=""){
		list1=(List)request.getAttribute("list0");
	}
	else{
		list1=sch.StatementsAction_getNumAll();
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>总量统计</title>
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
			src="<%=basePath%>js/jspPageing/jquery.pagination.js"></script><!--
			
			表格排序
			--><!--<script type="text/javascript" src="js/tableSort.js"></script>			
		--><script type="text/javascript" src="js/CJL.0.1.min.js"></script>
		<script type="text/javascript">
var TableOrder = function(table, options) {
	this._checked = [];//存放checkbox和radio集合
	
	var tBody = $$(table).tBodies[0];
	this._tBody = tBody;//tbody对象
	this._rows = $$A.map(tBody.rows, function(o){ return o; });//行集合
	
	this._setOptions(options);
}
TableOrder.prototype = {
  _repair: $$B.ie6 || $$B.ie7,//在ie6/7才需要修复bug
  //设置默认属性
  _setOptions: function(options) {
    this.options = {//默认值
		index:		0,//td索引
		property:	"innerHTML",//获取数据的属性 
		type:		"string",//比较的数据类型
		desc:		true,//是否按降序
		compare:	null,//自定义排序函数
		value:		null,//自定义取值函数
		repair:		this._repair,//是否解决checkbox和radio状态恢复bug
		onBegin:	function(){},//排序前执行
		onEnd:		function(){}//排序后执行
    };
    $$.extend(this.options, options || {});
  },
  //排序并显示
  sort: function() {
	//没有排序对象返回
	if(!arguments.length){ return false };
	var orders = Array.prototype.slice.call(arguments);
	//执行附加函数
	orders[0].onBegin();
	//排序
	this._rows.sort($$F.bind( this._compare, this, orders, 0 ));
	//获取集合
	var repair = this._repair && $$A.some(orders, function(o){ return o.repair; });
	repair && this._getChecked();
	//显示表格
	var frag = document.createDocumentFragment();
	$$A.forEach(this._rows, function(o){ frag.appendChild(o); });
	this._tBody.appendChild(frag);
	//恢复状态
	repair && this._setChecked();
	//执行附加函数
	orders[0].onEnd();
  },
  //比较函数
  _compare: function(orders, i, tr1, tr2) {
	var od = orders[i], value1 = this._value(od, tr1), value2 = this._value(od, tr2)
		,result = od.compare ? od.compare(value1, value2) ://使用自定义排序函数
			typeof value2 == "string" ? value1.localeCompare(value2) : (value1 - value2);
	//如果result是0(值相同)同时有下一个排序对象的话继续比较否则根据desc修正结果并返回
	return !result && od[++i] ? this._compare(orders, i, tr1, tr2) : (od.desc ? -1 : 1) * result;
  },
  //获取比较值
  _value: function(order, tr) {
	var td = tr.cells[order.index], att = order.property
		,data = order.value ? order.value(td) ://使用自定义取值函数
			att in td ? td[att] : td.getAttribute(att);
	//数据转换
	switch (order.type.toLowerCase()) {
		case "int":
			return parseInt(data, 10) || 0;
		case "float":
			return parseFloat(data, 10) || 0;
		case "date":
			return Date.parse(data) || 0;
		case "bool":
			return data === true || String(data).toLowerCase() == "true" ? 1 : 0;
		case "string":
		default:
			return data.toString() || "";
	}
  },
  //创建并返回一个排序对象
  creat: function(options) {
	return $$.extend($$.extend({}, this.options), options || {});
  },
  //获取要修正的checkbox和radio集合
  _getChecked: function() {
	this._checked = $$A.filter(this._tBody.getElementsByTagName("input"), function(o){
		return (($$B.ie6 && o.type == "checkbox") || o.type == "radio") &&
			o.checked != o.defaultChecked;
	});
  },
  //设置checkbox和radio集合的checked
  _setChecked: function() {
	$$A.forEach(this._checked, function(o){ o.checked = !o.defaultChecked; });
  }
}
</script>


		
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

					<div functionId="function_86" id="searchAcc" class="searchUIBasic small"
						style="display: block; position: relative; margin: 10px;">
						<form action="StatementsAction_getNumByTerm.action?<%=StringUntil.menuUrl("86") %>"  method="post">
							  <input id="downExcel"  name="downExcel" type="hidden" value="" >
							<table border=0 align=center cellpadding=0>
							<tr height="26px">
								 
								 <td>
									<div align="right">
										<strong>产品</strong>
									</div>
								</td>
								<td width="150px">
							<select name="proName" tabindex="" class="small" style="display:block; width:90%">
							<option selected value='0'>请选择</option>
                        	<%=StringUntilDatabase.getProOption(new Integer( StringUntil.isNullR0(searchProName)) ) %>
                        	</select>
								</td>
								 <td>
									<div align="right">
										<strong>创建时间</strong>
									</div>
								</td>
								<td width="150px">
									<input type="text" style="display: block;" name="date1"
										id="date1" value="<%=searchDate1 %>" size="20" class=detailedViewTextBox
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
									<input type="text" style="display: block;" name="date2"
										id="" value="<%=searchDate2 %>" size="20" class=detailedViewTextBox
										onFocus="this.className='detailedViewTextBoxOn'"
										onBlur="this.className='detailedViewTextBox'"
										onclick="setday(this);" readonly="readonly">
								</td>
							</tr>
							<tr  >
							 
								 
								<td class="small" align="center" colspan="8"  >
											<button name="submit" type="submit" 
										onclick="$('#downExcel').val('');"
										class="crmbutton small create" >查 找</button>
										
										 &nbsp;&nbsp;&nbsp;&nbsp;
											 <button functionId="function_202" name="submit" type="submit" 
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
													  <td class="lvtCol" title="排序"><span id="idNum" style="color: #0000FF"><u>用户编号</u></span></td>
													  <td class="lvtCol" title="排序"><span id="idName" style="color: #0000FF"><u>用户名称</u></span></td>
														<td class="lvtCol" title="排序">
															<span id="idProcess" style="color: #0000FF"><u>正在处理</u></span>
														</td>
														<td class="lvtCol" title="排序">
															<span id="idRespond" style="color: #0000FF"><u>处理完成等待客户响应</u></span>
														</td>
														<td class="lvtCol" title="排序">
															<span id="idSuccess" style="color: #0000FF"><u>处理成功</u></span>
														</td>
														<td class="lvtCol" title="排序">
															<span id="idNotRecieve" style="color: #0000FF"><u>不接收</u></span>
														</td>
														<td class="lvtCol" title="排序">
															<span id="idForword" style="color: #0000FF"><u>转发</u></span>
														</td>
														<td class="lvtCol" title="排序">
															<span id="idNotProcess" style="color: #0000FF"><u>无法处理</u></span>
														</td>
													</tr>
													</thead>
													<tbody>
													<!-- Table Contents -->
												<%
												   
												    if(list1!=null)
												    {
												    	for(Object obj:list1)
												    	{
												         Statements sta=(Statements)obj;
												    	%>
												    	
												    	<tr bgcolor=white
														onMouseOver="this.className='lvtColDataHover'"
														onMouseOut="this.className='lvtColData'" id="row_38">
													    <td><%=sta.getUserId() %></td>
													    <td><%=sta.getUserName() %></td>
														<td><%=sta.getIdProcess() %></td>
														<td>
															<%=sta.getIdRespond() %>
														</td>
														 
															<td>
															<%=sta.getIdSuccess() %>
														</td>
														<td>
															<%=sta.getIdNotRecieve() %>
														</td>
														 
														<td>
															<%=sta.getIdForword() %>
														</td>
														<td>
														    <%=sta.getIdNotProcess() %>
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
<!--排序-->
<script type="text/javascript">
var to = new TableOrder("Searchresult"), odID = to.creat({ type: "int", desc: false }), arrOrder = [];

function ClearCss(){ $$A.forEach(arrOrder, function(o){ o.className = ""; }); }

$$A.forEach([
	["idNum", { type: "int" }],
	["idName", { index: 1, type: "string" }],
	["idProcess", { index: 2, type: "int"}],
	["idRespond", { index: 3, type: "int" }],
	["idSuccess", { index: 4, type: "int" }],
	["idNotRecieve", { index: 5, type: "int" }],
	["idForword", { index: 6, type: "int" }],
	["idNotProcess", { index: 7, type: "int" }]
														
], function (arr){
	var o = $$(arr[0]), order = to.creat(arr[1]);
	order.onBegin = function(){ ClearCss(); odID.desc = this.desc; }
	order.onEnd = function(){
		o.className = this.desc ? "desc" : "asc";//设置样式
		this.desc = !this.desc;//取反排序
	}
	o.onclick = function(){ to.sort(order, odID); }
	arrOrder.push(o);//记录排序项目（这里主要用来设置样式）
});

$$("idNum").onclick();




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
