<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*,java.sql.*, java.util.*"%>


<%--
//check sesssion to see if there is a cart in it
Cart cart = (Cart)session.getAttribute("cart");
if(cart == null){
	cart = new Cart();
	session.setAttribute("cart", cart);
}
--%>

<jsp:useBean id="cart" class="com.bjsxt.shopping.Cart" scope="session"></jsp:useBean>


<% 
if(cart == null){
	out.println("û���κι�����");
	return;
}
%>
<center>��һ����������ô�����Ʒ��</center>
<form action="cartupdate.jsp" method="post">
<table border=1 align="center">
  <tr>
    <th>��ƷID</th>
    <th>��Ʒ����</th>
    <th>��Ʒ�۸�</th>
    <th>��������</th>
    <th></th>
  </tr>
  <% 
  List<CartItem> items = cart.getItems();
  for(int i=0; i<items.size(); i++){
  	CartItem ci = items.get(i);
  %>
  <tr>
    <td><%=ci.getProductId() %></td>
    <td><%=ProductMgr.getInstance().loadById(ci.getProductId()).getName() %></td>
    <td><%=ci.getPrice() %></td>
    <td>
    	<input type=text size=4 name="<%="p" + ci.getProductId() %>"  value="<%=ci.getCount() %>">
    </td>
  </tr>
  <% 
  }
  %>
</table>
<center>
	��<%=Math.round(cart.getTotalPrice()*100) / 100.0 %>Ԫ<br>
	<input type="submit" value="�޸�����">
	<input type="button" value="ȷ�϶���" onclick="document.location.href='confirm.jsp'">
</center>
</form>

















