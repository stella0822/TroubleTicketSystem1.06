<%



String inputCode = request.getParameter("code");
String code = (String)session.getAttribute("rand");

code=code.toLowerCase();

out.print(inputCode+" "+code);
if ( inputCode.equals(code) ){
%>
check SUCCESS!!!!!
<%}else{%>
wrong code!!!!!!!
<%}%>