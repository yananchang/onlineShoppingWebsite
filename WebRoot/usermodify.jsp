<%@ page language="java" import="java.util.*, com.bjsxt.shopping.*"  pageEncoding="GB18030"%>

<% 
User u = (User)session.getAttribute("user");
if(u == null){
	out.println("You have not logged in!");
	return;
}
%>

<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action != null && action.trim().equals("modify")){
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	u.setUsername(username);
	u.setPhone(phone);
	u.setAddr(addr);
	//u.save();
	u.update();
	%>
	<center>Register OK! Thank you!</center>
	<% 
	return;  //����, ҳ��Ͳ�������ʾ��
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>�û��޸�</title>
    <script language=JavaScript src="script/regcheckdata.js"></script>
  </head>
  
  <body>
    <form name="form" action="usermodify.jsp" method="post" >
			<input type="hidden" name="action" value="modify" />
			<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">�û��޸�</td>
				</tr>
				<tr>
					<td>�û�����</td>
					<td>
						<input type=text name="username" size="30" maxlength="10" value="<%=u.getUsername()%>">
					</td>
				</tr>
				<!--  
				<tr>
					<td>���룺</td>
					<td>
						<input type=password name="password" size="15" maxlength="12">
					</td>
				</tr>
				-->
				
				<tr>
					<td>�绰</td>
					<td>
						<input type=text name="phone" size="15" maxlength="12" value="<%=u.getPhone()%>">
					</td>
				</tr>
				<tr>
					<td>�ͻ���ַ</td>
					<td>
						<textarea rows="12" cols="80" name="addr"><%=u.getAddr()%></textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="submit" value="�ύ">
						<input type="reset" value="����">
					</td>
				</tr>
				
			</table>
		</form>
  </body>
</html>
