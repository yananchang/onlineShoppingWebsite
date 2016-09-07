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
	u = new User();
	u.setId(-1);
}
%>

<jsp:useBean id="cart" class="com.bjsxt.shopping.Cart" scope="session"></jsp:useBean>


<% 
if(cart == null){
	out.println("没有任何购物项");
	return;
}
%>

<%
String addr = request.getParameter("addr");
SalesOrder so = new SalesOrder();
so.setCart(cart);
so.setAddr(addr);
so.setUser(u);
so.setoDate(new Timestamp(System.currentTimeMillis()));
so.setStatus(0);

so.save();

session.removeAttribute("cart");
%>

<center>
	谢谢您在本站购物！欢迎继续！

</center>





