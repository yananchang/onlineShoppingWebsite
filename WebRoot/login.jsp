<%@ page pageEncoding="GB18030"%>
<%@ page import="java.sql.*,com.bjsxt.shopping.*"%>

<%
request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
if (action != null && action.trim().equals("login")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User u = null;
	try{
		u = User.validate(username, password);
	}catch(UserNotFoundException e){
		out.println("User not found!");
		return;
	}catch(PasswordNotCorrectException e){
		out.println("Password not correct!");
		return;
	}
	
	session.setAttribute("user", u);
	response.sendRedirect("selfservice.jsp");
}
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>管理员登录</title>

	</head>
	<body>

		<form action="login.jsp" method="post">
			<input type="hidden" name="action" value="login"/>
			<table width="750" align="center" border="3">
				<tr>
					<td colspan="2" align="center">用户登陆</td>
				</tr>
			
				<tr>
					<td>用户名：</td>
					<td>
						<input type="text" name="username" />
					</td>
				</tr>
				
				<tr>
				
					<td>密码：</td>
					<td>
						<input type="password" name="password" />
					</td>
				</tr>
				
				<tr>
					<td>
					<input type="submit" value="login" />
					</td>
				</tr>
			</table>
		</form>


	</body>
</html>
