<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import = "com.bjsxt.shopping.*" %> 
<%@ page import = "java.sql.*" %> 


<% 
User u = (User)session.getAttribute("user");
if(u == null){
	out.println("You havenot logged in!");
	return;
}
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<a href="usermodify.jsp">修改个人信息</a>
</body>
</html>