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
	下单人： <%=so.getUser().getUsername() %>
	<form name="form" action="ordermodify.jsp" method="post">
	<input type="hidden" name="id" value="<%=id%>">
	<input type="hidden" name="action" value="modify">
		<select name="status">
			<option value="0">未处理</option>
			<option value="1">已处理</option>
			<option value="2">废单</option>
		</select>
		<br>
		<input type="submit" value="提交">
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













