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
	out.println("没有任何购物项");
	return;
}
%>
<center>您一共购买了这么多的商品：</center>
<form action="cartupdate.jsp" method="post">
<table border=1 align="center">
  <tr>
    <th>商品ID</th>
    <th>商品名称</th>
    <th>商品价格</th>
    <th>购买数量</th>
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
	共<%=Math.round(cart.getTotalPrice()*100) / 100.0 %>元<br>
	<input type="submit" value="修改数量">
	<input type="button" value="确认订单" onclick="document.location.href='confirm.jsp'">
</center>
</form>

















