<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>上传页面</title>
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

		<script type="text/javascript" src="js/ajaxfileupload.js"></script>
		<script type="text/javascript">
// 上传文件
	function ajaxFileUpload()
	{  
	 
	if ($("#file").val()!="") {// 判断 文件是否 选择 如果选择 则执行 文件上传 否则不执行
    var m="";
<%--		$("#loading")--%>
<%--		.ajaxStart(function(){--%>
<%--			$(this).show();//开始上传文件时显示一个图片--%>
<%--		}) .ajaxStop(function(){--%>
<%--			$(this).hide();--%>
<%--			if ( m.lastIndexOf(".")!=-1  ) {  /// 上传成功--%>
<%--			  //$("#form1").submit();--%>
<%--				$("#f1").text("上传的新文件:"+m); // 显示错误信息 --%>
<%--				 var href= $("#downA").attr("href");--%>
<%--				 --%>
<%--				 var fileNames=m.split(",");--%>
<%--				 $("#downA").attr("href",href+fileNames[1]);--%>
<%--				  $("#f1").after("<a href='download.action?fileName="+fileNames[1]+"' >"+fileNames[0]+"</a>"); --%>
<%--			}else--%>
<%--			{--%>
<%--			  $("#f1").text(m); // 显示错误信息--%>
<%--		     }--%>
			 
<%--		}); //文件上传完成将图片隐藏起来--%>
		$("#loading").show();
          $.ajaxFileUpload
		  (
			{
				url:'upload.action',//用于文件上传的服务器端请求地址
				secureuri:false,//一般设置为false
				fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
				dataType: 'json',//返回值类型 一般设置为json
				success: function (data, status)  //服务器成功响应处理函数
				{
					 //alert(data.message+"      +++");//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
				     m=data.message;

				     
				         $("#loading").hide();
				         if ( m.lastIndexOf(".")!=-1  ) {  /// 上传成功
						  
							 $("#f1").text("上传的新文件:"+m); // 显示错误信息 
							  var href= $("#downA").attr("href");
							 var fileNames=m.split(",");
							 $("#downA").attr("href",href+fileNames[1]);
							  $("#f1").after("<br/><a href='download.action?fileName="+fileNames[1]+"' >"+fileNames[0]+"</a><br/>"); 
						}else
						{
						  $("#f1").text(m); // 显示错误信息
					    }

                          
						if(typeof(data.error) != 'undefined')
					    {
						if(data.error != '')
						{
							alert(data.error);
						}else
						{
							alert(data.message);
						}
					}
					
				},
				error: function (data, status, e)//服务器响应失败处理函数
				{
					
					alert(e);
				}
			}
			)
	}else
		{
			 //$("#form1").submit();

	    }
		 
		return false;

	}
   
   </script>
	</head>

	<body>
		<h2>
			欢迎你,${sessionScope.user.uname}
		</h2>
		<s:form action="upload.action" method="POST" enctype="multipart/form-data" theme="simple">
    	文件标题：<input name="title" type="text" />
			<p />
				请选择要上传的文件：
				<s:file id="file" name="file"  ></s:file>
				 
			<img src="img/loading.gif" id="loading" style="display: none;">
			<label id="f1"></label>
			</p>
			
		  
			<input value="上传文件" type="submit" />
			<input value="ajxa上传文件" type="button" onclick="ajaxFileUpload();" />
		</s:form>
		 
		
		<s:debug></s:debug>
	</body>

</html>
