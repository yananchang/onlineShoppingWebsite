<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bjsxt.shopping.*, 
				java.util.*"%>
<%@ include file="_sessioncheck.jsp" %>


<% 
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id);
%>

<<script type="text/javascript">
<!--
	function showProductInfo(descr){
		document.getElementById("productInfo").innerHTML="<font size=3 color=red>" + descr + "</font>";
	}
//-->
</script>

<center>
	�µ��ˣ� <%=so.getUser().getUsername() %>
	��ϸ�� <br>
	
	<table border=1 align="center">
	  <tr>
	    <th>��Ʒ����</th>
	    <th>��Ʒ�۸�</th>
	    <th>��������</th>
	    <th></th>
	  </tr>
	  <% 
	  List<SalesItem> items = so.getItems();
	  for(int i=0; i<items.size(); i++){
	  	SalesItem si = items.get(i);
	  %>
	  <tr>
	    <td onmouseover="showProductInfo('<%=si.getProduct().getDescr()%>')"><%=si.getProduct().getName() %></td>
	    <td><%=si.getUnitPrice() %></td>
	    <td><%=si.getCount() %></td>
	    <td></td>
	  </tr>
	  <% 
	  }
	  %>
	</table>

	<div style="border:5px double  purple;width:400;" id="productInfo">
		&nbsp;
	</div>

</center>