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

<% 
User u = (User)session.getAttribute("user");
if(u == null){
	out.println("您现在没有登录，如果您确认继续购买，按市场价，注册是免费的");
	//out.println("<a href=confirmUseNormal.jsp>继续</a><br>");
	out.println("<a href=login.jsp>登录</a>");
}
%>
<jsp:useBean id="cart" class="com.bjsxt.shopping.Cart" scope="session"></jsp:useBean>

<table border=1 align="center">
  <tr>
    <th>商品ID</th>
    <th>商品名称</th>
    <th>商品价格（<%=(u==null ? "市场价" : "会员价") %>）</th>
    <th>购买数量</th>
    <th></th>
  </tr>
  <% 
  List<CartItem> items = cart.getItems();
  for(int i=0; i<items.size(); i++){
  	CartItem ci = items.get(i);
  	Product p = ProductMgr.getInstance().loadById(ci.getProductId());
  %>
  <tr>
    <td><%=ci.getProductId() %></td>
    <td><%=p.getName() %></td>
    <td><%=(u == null) ? p.getNormalPrice() : p.getMemberPrice() %></td>
    <td>
		<%=ci.getCount() %>
    </td>
  </tr>
  <% 
  }
  %>
</table>
<center>
	共<%=Math.round(cart.getTotalPrice()*100) / 100.0 %>元<br>
	<% 
	if(u != null){
		%>
		欢迎您，<%=u.getUsername() %>请确认您的送货信息<br>
		<% 
	}
	%>
	
	<form action="order.jsp" method="post">
		送货信息：<br>
		<textarea name="addr" rows="" cols=""><%=(u==null? "" : u.getAddr()) %></textarea><br>
		<input type="submit" value="下单">
	</form>
</center>
















