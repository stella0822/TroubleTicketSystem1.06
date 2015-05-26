<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="tool.StringUntil"%>
<%@page import="tool.Constants"%>
<%@page import="tool.StringUntilDatabase"%>
<%@page import="user.database.TUser"%>
<%@taglib uri="/struts-tags" prefix="s"  %>
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
String jsTree_HTML=StringUntil.getParameter(request,"jsTree2","");    // 生成树的代码
String menu_Fid=StringUntil.getParameter(request,"menu_Fid",""); // 页面编号
String jsTreeType=StringUntil.getParameter(request,"groupType","");  // 树类型
String menuLeftID=StringUntil.getParameter(request,"menuLeftID","");  // 需要展开 和选中  的节点
String onclickUrl=StringUntil.getParameter(request,"onclickUrl",""); // 点击事件 地址
String checkbox=StringUntil.getParameter(request,"checkbox","");     //是否显示多选框
String icons=StringUntil.getParameter(request,"icons","true");     //是否显示图标
String contextmenu=StringUntil.getParameter(request,"contextmenu","contextmenu");     //是否显示右键
if(contextmenu.equals("false"))
{
    contextmenu="";	
}
 String fids =StringUntilDatabase.getFidBRole(menuLeftID);
 
%>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>jsTree v.1.0 - themes documentation</title>
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery.cookie.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery.hotkeys.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>jsTree/jquery.jstree.js"></script>
 
		<style >
ul li {
	font-size: 14px;
}
.menuHead {
	width: 95%;
	font-family: "黑体";
	padding-top: 10px;
	padding-left: 10px;
	font-size: 14
}

.mb {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: -4;
	background-color: #FFFFF5;
	background-attachment: fixed;
	opacity: 0.7; /*设置透明度*/
	-moz-opacity: 0.7; /* Firefox 透明度  有效*/
	filter: alpha(opacity =   70); /*ie透明度*/
}

.mb2 {
	position: absolute;
	left: 0px;
	top: 100px;
	width: 98%;
	z-index: 20;
	padding-bottom: 10px;
	padding-top: 10px;
	background-color: white;
	border: 2px solid #a5b5ee;
}
 
.save {
	background-color: green;
	color: #fff;
	font-weight: bold;
	background-image: url(images/buttongreen.png);
}
.searchUIBasic {
    background-image:url(<%=basePath%>themes/softed/images/layerPopupBg.gif);
     
}
 
</style>
	</head>
	<body style="margin: 0px;" class="searchUIBasic" >
 
			<div class="menuHead searchUIBasic">
			<%=StringUntilDatabase.getTextByid(jsTreeType) %>
			</div>
		<div id="demo1" class="demo" style="display: none;">
			<ul>
				<li id="node_" class='jstree-open'>
					<a href="#" ><%=StringUntilDatabase.getTextByid((new Integer(jsTreeType)+1) ) %></a>
					<%=jsTree_HTML%>
				</li>
			</ul>
		</div>
		<div id="mb" class="mb">
			<%--
 蒙版图层
 --%>
		</div>
		<div id="returnText" class="mb2" style="display: none;" align="center"   >
			<%-- 
                                 操作返回 结果显示
            --%>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
			<label id="returnText_state">${tuserGroup.url}</label> &nbsp;
			&nbsp; &nbsp;<br />
			<input class="save" type="button" value="关闭"
				onclick="$('#returnText,#mb').hide(200);" />
		</div>
		<script type="text/javascript" language="javascript"> 
/// 添加菜单源
 //var menu_html=window.parent.getDemoByid('menu_html');
 //$("#demo1").html(menu_html.html());
 /// 选中 指定 菜单
  
  
  function  showCecked()
 {
    var fids="<%=fids%>".split(",");
    
      for(var i=0;i<fids.length;i++)
      {
          if(fids[i]<0)
          {
               
              var a=fids[i].replace("-","");
              
              a-=10000;
              a+="";
              a=a.replace("-","");
              
             $("li[id='node_"+a+"']").addClass("jstree-undetermined");   
          }
          else
          {
        	  $("li[id='node_"+fids[i]+"']").addClass("jstree-checked"); 
           }
           
      }
    
 }
 
 
 
/// 添加 点击事件 
var a='${tuserGroup.url}';
  if(a!='')
  {
	  $('#mb').attr('style','z-index: 4;');
      $('#returnText').show();
      
  }

$(function () 
   {
	showCecked();
	 //$("li").addClass("jstree-checked"); 让 单选框选中
	 
	  $("#node_ li").each(function (index, domEle) { 
		  // domEle == this 
		  var id =$(domEle).find("a").eq(0);
		 
		    id.text(id.text()+"  "+$(domEle).attr("id").replace("node_",""));
		    
		/**  if ($(this).is("#stop")) { 
			  $("span").text("Stopped at div index #" + index); 
			  return false; 
		  } */
		});
	 
	 // 菜单处理
	$("#demo1").jstree({ 
		"themes" : {
			"theme" : "default",
			"icons" : <%=icons%> 
		},	
		"core" : { "initially_open" : [ "node_<%=menuLeftID%>" ] }, 
		"ui" : {
			"select_limit" : 2,
			"select_multiple_modifier" : "alt",
			"selected_parent_close" : "select_parent",
			"initially_select" : [ "node_<%=menuLeftID%>" ] 
		},
		"contextmenu":{
            "items":{
            // Some key
                "create" : {
                    // The item label
                    "label"             : "新增菜单"                                   
                },
                "rename" : {
                        // The item label
                        "label"             : "重命名",
                        // The function to execute upon a click
                        "action"            : function (obj) { this.rename(obj);  }                                 
                    },
                    "remove" : {
                        // The item label
                        "label"             : "删除"    
     
                    },
                    "ccp": null,
    				"move" : {
						"separator_before"	: false,
						"separator_after"	: false,
						"label"				: "移动",
						"action"			: function (obj) { this.cut(obj); }
					},
					"copy" :null,
					"paste" : {
						"separator_before"	: false,
						"icon"				: false,
						"separator_after"	: false,
						"label"				: "粘贴",
						"action"			: function (obj) { this.paste(obj); }
					}
           }
        },
		"plugins" : [ "themes", "html_data", "ui","themeroller","crrm", "<%=contextmenu%>" <%=checkbox%> ]
	}).bind("create.jstree", function (e, data) {                		        
		          $.post(  
		             "PurviewAction_addUserGroup.action",   
		              {   
		                   "tuserGroup.id" : data.rslt.parent.attr("id").replace("node_",""),   
		                 "tuserGroup.name" : data.rslt.name,  
		             "tuserGroup.groupType":<%=jsTreeType%>
		              },   
		             function (r) {  
		                 if(!isNaN(r)) ////如果是数字则  操作成功
			             {   
		                     $(data.rslt.obj).attr("id", "node_" + r);  // 把修改此节点id 
		                     $("#returnText_state").text('<%=Constants.StateOK%>');    
		                 }  
		                  else {  
		                    $.jstree.rollback(data.rlbk);              // 否则回滚操作
		                    $("#returnText_state").text(r);             
		                 }  
		                 $('#mb').attr('style','z-index: 4;');         
	                     $('#returnText').show();
		             }  

		          );  
		      }).bind("remove.jstree", function (e, data) {               // 删除菜单
		    	data.rslt.obj.each(function () {
					$.ajax({
						async : false,
						type: 'POST',
						url: "PurviewAction_delUserGroup.action",
						data : { 
						   "tuserGroup.id" : this.id.replace("node_",""),   
		             "tuserGroup.groupType":<%=jsTreeType%>	 
						}, 
						success : function (r) { 
							if(r!='<%=Constants.StateOK%>') {    // 如果操作成功 则删除 此节点
								 $.jstree.rollback(data.rlbk);  // 否则回滚操作             
			                 }  
							 $("#returnText_state").text(r); 
			                 $('#mb').attr('style','z-index: 4;');         
		                     $('#returnText').show();
						}
					});
				});
			})
			.bind("rename.jstree", function (e, data) {
				   var fid=  data.rslt.obj.parents();                          // 父元素 
				       fid=$(fid[1]).attr("id");
				$.post(
					"PurviewAction_updateUserGroup.action", 
					{ 
 						"tuserGroup.id" : data.rslt.obj.attr("id").replace("node_",""),   
		              "tuserGroup.name" : data.rslt.new_name, 
		              "tuserGroup.TUserGroup.id" :fid,  
		          "tuserGroup.groupType":<%=jsTreeType%>
					}, 
					function (r) {
						  if(!isNaN(r))                                      //如果是数字则  操作成功
				             {   
			                     $(data.rslt.obj).attr("id", "node_" + r);  // 把修改此节点id 
			                     $("#returnText_state").text('<%=Constants.StateOK%>');    
			                 }  
			                  else {  
			                    $.jstree.rollback(data.rlbk);              // 否则回滚操作
			                    $("#returnText_state").text(r);             
			                 }  
			                 $('#mb').attr('style','z-index: 4;');         
		                     $('#returnText').show(); 
					}
				);
			})
			.bind("move_node.jstree", function (e, data) {                                // 移动节点
				data.rslt.o.each(function (i) { 
				      var  name=$(this).find("a:eq(0)").html();                         // 获取 节点名称
				     　　 $("#mvoeMenuDiv").html(name);
				      name=$("#mvoeMenuDiv ins").remove();
				      name=$("#mvoeMenuDiv").text();
				    
					$.ajax({
						async : false,
						type: 'POST',
						url: "PurviewAction_moveUserGroup.action",
						data : { 
							"tuserGroup.id" : $(this).attr("id").replace("node_",""), // 被移动节点
						  "tuserGroup.name" : name, 
				 "tuserGroup.TUserGroup.id" : data.rslt.cr === -1 ? 1 : data.rslt.np.attr("id").replace("node_",""),// 目标节点id 		 
					 "tuserGroup.groupType" :<%=jsTreeType%>,
							"isCopy" : data.rslt.cy ? 1 : 0   
						},
						success : function (r) {
							if(!isNaN(r))                                              //如果是数字则  操作成功
				             {   
			                     $(data.rslt.obj).attr("id", "node_" + r);              // 把修改此节点id 
			                     $("#returnText_state").text('<%=Constants.StateOK%>');    
			                 }  
			                  else {  
			                    $.jstree.rollback(data.rlbk);                           // 否则回滚操作
			                    $("#returnText_state").text(r);             
			                 }  
			                 $('#mb').attr('style','z-index: 4;');         
		                     $('#returnText').show(); 					
						}
					});
				}
				)
			}
			) ;
<%--		  <%if(!onclickUrl.isEmpty()){--%>
<%--				 %>--%>
<%--				--%>
<%--			.delegate("a", "click", function (event, data) {                               // 节点的点击事件 --%>
<%--				 --%>
<%--				var target = event.target || event.srcElement;                                //IE和Chrome下是srcElement FF下是target --%>
<%--			     sid=$(target).parents("li").eq(0).attr("id");                               // 点击 当前节点的 id --%>
<%--			   --%>
<%--			  /*  if($("#"+sid).find("li").length!=0)                                        // 点击 当前节点是否有 子li 如果有说明 有子节点 否则没有--%>
<%--				    return;*/                                                                 --%>
<%--			     sid=sid.replace("node_","");                                                 //获取节点 数据库编号   --%>
<%--			      var url="<%=basePath+onclickUrl%>.action?menu_Fid=<%=menu_Fid%>&pageTime="+new Date().getTime()+"&menuLeftID="+sid;//  提交地址--%>
<%--				 top.location=url; --%>
<%--			     --%>
<%--					// 阻止 冒泡--%>
<%--				 if (window.event) --%>
<%--					 {  --%>
<%--					     event.cancelBubble = true;  --%>
<%--				     }else if (event){  --%>
<%--				    	 event.stopPropagation();  --%>
<%--				     }  --%>
<%--				 --%>
<%--				    event.preventDefault();--%>
<%--				 })--%>
<%--				 <%}%>*/ --%>

	
      var a=window.parent.getDemoByid('menu_id');
	 $("#demo1").height(a.height()-35).width(a.width()-17).css({"padding-left":"15px","background":"none","background-color":"inherit","background-image":"url(<%=basePath%>themes/softed/images/layerPopupBg.gif)"});  
	 $("#demo1").show(100);
	 //$("li a").append($(this).attr("id"));
	 
	

	   
});
 </script>
   <div id="mvoeMenuDiv" onkeydown="" style="display: none;">
   </div>
	</body>

</html>
<%
   request.removeAttribute("jsTree");
%>
