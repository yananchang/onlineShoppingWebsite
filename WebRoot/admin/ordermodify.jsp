<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bjsxt.shopping.*, 
				java.util.*"%>
<%@ include file="_sessioncheck.jsp" %>


<% 
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id);

String action = request.getParameter("action");
if(action != null && action.equals("modify")){
	int status = Integer.parseInt(request.getParameter("status"));
	so.setStatus(status);
	so.updateStatus();
}

%>




<center>
	�µ��ˣ� <%=so.getUser().getUsername() %>
	<form name="form" action="ordermodify.jsp" method="post">
	<input type="hidden" name="id" value="<%=id%>">
	<input type="hidden" name="action" value="modify">
		<select name="status">
			<option value="0">δ����</option>
			<option value="1">�Ѵ���</option>
			<option value="2">�ϵ�</option>
		</select>
		<br>
		<input type="submit" value="�ύ">
	</form>
</center>

<script type="text/javascript">
<!--
	for(var option in document.forms("form").status.options){
		if(option.value == <%=so.getStatus()%>){
			document.forms("form").status.selectedIndex = option.index;
		}
	
	}
//-->
</script>













