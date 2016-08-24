<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*"%>

<%@ include file="_sessioncheck.jsp" %>

<% 
request.setCharacterEncoding("GB18030");

String strPid = request.getParameter("pid");
int pid = 0;
if(strPid != null){
	pid = Integer.parseInt(strPid);
}

String action = request.getParameter("action");
if(action != null && action.trim().equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr"); 
	if(pid == 0){
		Category.addTopCategory(name, descr);
	}else {
		//Category.addChildCategory(pid, name, descr);
		Category parent = Category.loadById(pid);
		Category child = new Category();
		child.setId(-1);
		child.setName(name);
		child.setDescr(descr);
		parent.addChild(child);
	}
	out.println("<h1>category added!<h1>");
}
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
  	<center>��Ӹ����</center>
	<form action="categoryadd.jsp" method="post">
		<input type="hidden" name="action" value="add">
		<input type="hidden" name="pid" value="<%=pid %>">
		<table>
			<tr>
				<td>������ƣ�</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>���������</td>
				<td><textarea name="descr" rows="8" cols="40"></textarea></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="�ύ"></td>
			</tr>
		</table>
	</form>
  </body>
</html>














