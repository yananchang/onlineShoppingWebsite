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
	out.println("������û�е�¼�������ȷ�ϼ������򣬰��г��ۣ�ע������ѵ�");
	//out.println("<a href=confirmUseNormal.jsp>����</a><br>");
	out.println("<a href=login.jsp>��¼</a>");
}
%>
<jsp:useBean id="cart" class="com.bjsxt.shopping.Cart" scope="session"></jsp:useBean>

<table border=1 align="center">
  <tr>
    <th>��ƷID</th>
    <th>��Ʒ����</th>
    <th>��Ʒ�۸�<%=(u==null ? "�г���" : "��Ա��") %>��</th>
    <th>��������</th>
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
	��<%=Math.round(cart.getTotalPrice()*100) / 100.0 %>Ԫ<br>
	<% 
	if(u != null){
		%>
		��ӭ����<%=u.getUsername() %>��ȷ�������ͻ���Ϣ<br>
		<% 
	}
	%>
	
	<form action="order.jsp" method="post">
		�ͻ���Ϣ��<br>
		<textarea name="addr" rows="" cols=""><%=(u==null? "" : u.getAddr()) %></textarea><br>
		<input type="submit" value="�µ�">
	</form>
</center>
















