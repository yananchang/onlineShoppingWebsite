<%@ page language="java" import="java.util.*, com.bjsxt.shopping.*"  pageEncoding="GB18030"%>


<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action != null && action.trim().equals("register")){
	String username = request.getParameter("username");
	String password = request.getParameter("password"); //��̨����ҲӦ��������ļ��
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	User u = new User(username, password, phone, addr);
	/*
	User u = new User();
	u.setUsername(username);
	u.setPassword(password);
	u.setPhone(phone);
	u.setAddr(addr);
	u.setRdate(new java.util.Date(System.currentTimeMillis()));
	*/
	
	u.save();
	%>
	<center>Register OK! Thank you!</center>
	<% 
	return;  //����, ҳ��Ͳ�������ʾ��
}
%>
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>�û�ע��</title>
    <script language=JavaScript src="script/regcheckdata.js"></script>
  </head>
  
  <body>
    <form name="form" action="register.jsp" method="post" 
    	onSubmit="return checkdata()" target="detail">
			<input type="hidden" name="action" value="register" />
			<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">�û�ע��</td>
				</tr>
				<tr>
					<td>�û�����</td>
					<td>
						<input type=text name="username" size="30" maxlength="10">
					</td>
				</tr>
				<tr>
					<td>���룺</td>
					<td>
						<input type=password name="password" size="15" maxlength="12">
					</td>
				</tr>
				<tr>
					<td>����ȷ��</td>
					<td>
						<input type=password name="password2" size="15" maxlength="12">
					</td>
				</tr>
				<tr>
					<td>�绰</td>
					<td>
						<input type=text name="phone" size="15" maxlength="12">
					</td>
				</tr>
				<tr>
					<td>�ͻ���ַ</td>
					<td>
						<textarea rows="12" cols="80" name="addr"></textarea>
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
