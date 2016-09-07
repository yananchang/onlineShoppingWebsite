<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*,java.sql.*, java.util.*"%>

<% 
request.setCharacterEncoding("GB18030");
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductMgr.getInstance().loadById(id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<title>My JSP 'userdelete.jsp' starting page</title>
   

  </head>
  
  <body>
  	<center>产品展示</center>
	<IMG height=90 alt=<%=p.getName() %> src="images/hot_gO1.gif" width=90 border=0 >
	<br>
	<%=p.getName() %><br>
	<%=p.getDescr() %><br>
	<%=p.getDescr() %><br>
	<%=p.getNormalPrice() %><br>
	<%=p.getMemberPrice() %><br>
	<a href="buy.jsp?id=<%=id%>">buy it!</a>
	
  </body>
</html>














