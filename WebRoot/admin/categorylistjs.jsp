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
<script language="javascript" src="script/TV20.js"></script>
<title>Insert title here</title>
<script language="javascript" src="script/TV20.js"></script>
<script type="text/javascript">
	function t(key, parentkey){
		document.forms["form"].pid.value = key;
	}
	
	function modify(key, parentkey){
		window.parent.frames["detail"].location.href="categorymodify.jsp?id=" + key;
	}
</script>

</head>
<body>


<table align="center" border=1>
	<tr><td id="show"></td></tr>
	<tr><td>
	<form name="form" action="categoryadd.jsp" method="post">
		<input type="hidden" name="action" value="add">
		<input type="text" name="pid" value="" readonly><br>
		<input type="text" name="name">
		<br>
		<input type="text" name="descr">
		<br>
		<input type="submit" value="提交">
	</form>
	</td></tr>
</table>

	<script language="javascript">
	<!--
		addNode(-1,0,"所有类别","images/top.gif");
		
		<%
		for(Iterator<Category> it = categories.iterator();it.hasNext();){
			Category c = it.next();
		%>
			addNode(<%=c.getPid() %>, <%=c.getId() %>, "<%=c.getName() %>", "images/top.gif");
		<%
		}
		%>
		showTV();
		addListener("click", "t");
		addListener("dblclick", "modify");
	-->
	</script>	
</body>
</html>