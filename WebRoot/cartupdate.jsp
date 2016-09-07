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

List<CartItem> items = cart.getItems();
for(int i=0; i<items.size(); i++){
	CartItem ci = items.get(i);
	String strCount = request.getParameter("p" + ci.getProductId());
	if(strCount != null && !strCount.trim().equals("")){
		ci.setCount(Integer.parseInt(strCount));
	}

}
%>

<center>修改成功</center>

三秒钟后自动重定向....
<div id="num">
</div>

<script type="text/javascript">
<!--
	var leftTime = 5000;
	function go(){
		document.getElementById("num").innerText = leftTime;
		leftTime -= 1000;
		if(leftTime <= 0){
		document.location.href = "cart.jsp";
		}
	}
	
	setInterval(go, 1000);
//-->
</script>


