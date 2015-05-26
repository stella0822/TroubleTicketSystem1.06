<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<script src="js/jquery-1.8.3.js"></script>
	<script src="js/chickFrom/vanadium.js"></script>
	<link rel="stylesheet" href="js/chickFrom/css/chickFrom.css" type="text/css"></link> 
	<head>
	 
	<script>
</script>
	</head>
	<body>
	 

			<div id="demo">
				<form id="iform" name="iform" method="post" action="#">
					<table>
						<tr>
							<td>
								<label for="checkempty">
									请输入Mr.Think(区分大小写):
								</label>
								</td>
								<td align="left">
									<input id="checkempty" class=":equal;Mr.Think" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkempty">
									请输入Mr.Think(不区分大小写):
								</label>
								</td>
								<td align="left">
									<input id="checkempty" class=":equal_ignore_case;Mr.Think" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkempty">
									输入不能为空:
								</label>
								</td>
								<td>
									<input id="checkempty" class=":required" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkinteger">
									输入整数(含负):
								</label>
								</td>
								<td>
									<input id="checkinteger" class=":integer" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checknum">
									输入数字:
								</label>
								</td>
								<td>
									<input id="checknum" class=":number" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkfloat">
									输入非负整数值:
								</label>
								</td>
								<td>
									<input id="checkfloat" class=":digits :required" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkletter">
									输入字母:
								</label>
								</td>
								<td>
									<input id="checkletter" class=":alpha" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkletterasc">
									请在ASC编码下输入字母:
								</label>
								</td>
								<td>
									<input id="checkletterasc" class=":asciialpha" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkletternum">
									请输入英文字母或正数:
								</label>
								</td>
								<td>
									<input id="checkletternum" class=":alphanum" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkmail">
									请输入邮箱:
								</label>
								</td>
								<td>
									<input id="checkmail" class=":email :required" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkurl">
									请输入网址:
								</label>
								</td>
								<td>
									<input id="checkurl" class=":url" />
								</td>
						</tr>
						 
						<tr>
							<td>
								<label for="checkdate">
									请输入日期:
								</label>
								</td>
								<td>
									<input id="checkdate" class=":date_au" />
								</td>
						</tr>
						 
						<tr>
							<td>
								<label for="checklength">
									请输入4个字符:
								</label>
								</td>
								<td>
									<input id="checklength" class=":length;4" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkminlength">
									最少输入4个字符:
								</label>
								</td>
								<td>
									<input id="checkminlength" class=":min_length;4 :required" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkmaxlength">
									最多输入4个字符:
								</label>
								</td>
								<td>
									<input id="checkmaxlength" class=":max_length;4" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkmaxmin">
									最多输入4到8个字符:
								</label>
								</td>
								<td>
									<input id="checkmaxmin" class=":min_length;4 :max_length;8" />
								</td>
						</tr>
						<tr>
							<th>
								<label for="checkpsw">
									请输入密码:
								</label>
							</th>
							<td>
								<input id="checkpsw" class=":required" type="password" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="checkpswrepeat">
									请再次输入密码:
								</label>
							</th>
							<td>
								<input id="checkpswrepeat" class=":same_as;checkpsw"
									type="password" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="checkvalue">
									正则匹配:
								</label>
								</td>
								<td>
									<input id="checkvalue" class=":format;/^(Mr.Think)+$/i" />
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkpass">
									账号验证:
								</label>
								</td>
								<td>
									<input id="checkpass" class=":ajax;http://127.0.0.1:8888/js/chickFrom/1.jsp" />
									<em>此项须连接服务器测试才有效</em>
								</td>
						</tr>
						<tr>
							<td>
								<label for="checkaccept">
									必须接受:
								</label>
								</td>
								<td>
									<input type="checkbox" id="checkaccept" class=":accept" />
								</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="submit" value="提交表单"
									style="width: 80px; padding: 0.2em; height: 30px;" />
							</td>
						</tr>
					</table>

				</form>
			</div>
</html>