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
request.setCharacterEncoding("GB18030");
int id = Integer.parseInt(request.getParameter("id"));
CartItem ci = new CartItem();
Product p = ProductMgr.getInstance().loadById(id);
ci.setProductId(id);
ci.setPrice(p.getNormalPrice());//need to check if the user is logged in
ci.setCount(1);
cart.add(ci);

response.sendRedirect("cart.jsp");
%>
















