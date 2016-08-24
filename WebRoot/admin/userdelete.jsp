<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*"%>

<%@ include file="_sessioncheck.jsp" %>


<% 
//TODO you should validate the id
int id = Integer.parseInt(request.getParameter("id"));n m
UserManager.deleteUser(id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'userdelete.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    É¾³ý³É¹¦. <br>
    <script type="text/javascript">
    	<!--
    		window.parent.main.document.location.reload();
    	-->
    </script>
  </body>
</html>
