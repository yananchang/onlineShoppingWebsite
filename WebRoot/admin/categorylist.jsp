<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bjsxt.shopping.*, 
				java.util.*"%>
<%@ include file="_sessioncheck.jsp" %>

<% 
//get all the users
List<Category> categories = Category.getCategories();
//List<User> list = UserManager.getUsers();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<td>ID</td>
			<td>Pid</td>
			<td>Name</td>
			<td>descr</td>
			<td>isleaf</td>
			<td>grade</td>
			<td>New Subcategory</td>
		</tr>
		<% 
		for (Iterator<Category> it = categories.iterator(); it.hasNext();){
			Category c = it.next();
			String preStr = "";
			for(int i=1; i<c.getGrade(); i++){
				preStr += "----";
			}
		%>
			<tr>
				<td><%=c.getId() %></td>
				<td><%=c.getPid() %></td>
				<td><%=preStr + c.getName() %></td>
				<td><%=c.getDescr() %></td>
				<td><%=c.getGrade() %></td>
				<td>
					<a href="categoryadd.jsp?pid=<%=c.getId() %>">添加子类别</a>
				</td>
			</tr>
		<% 
		}
		%>
	</table>
</body>
</html>