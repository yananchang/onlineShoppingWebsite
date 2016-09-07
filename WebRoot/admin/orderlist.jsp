<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bjsxt.shopping.*, 
				java.util.*"%>
<%@ include file="_sessioncheck.jsp" %>

<%! 
private static final int PAGE_SIZE = 3;
%>

<% 
String strPageNo = request.getParameter("pageno");
int pageNo = 1;
if(strPageNo != null){
	pageNo = Integer.parseInt(strPageNo);
}
if(pageNo <= 1) pageNo = 1;
%>

<% 
//get all the users
List<SalesOrder> orders = new ArrayList<SalesOrder>();
int pageCount = OrderMgr.getInstance().getOrders(orders, pageNo, PAGE_SIZE);

if(pageNo > pageCount) pageNo = pageCount;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<td>ID</td>
			<td>username</td>
			<td>addr</td>
			<td>odate</td>
			<td>status</td>

		</tr>
		<% 
		for (Iterator<SalesOrder> it = orders.iterator(); it.hasNext();){
			SalesOrder so = it.next();
		
		%>
			<tr>
				<td><%=so.getId() %></td>
				<td><%=so.getUser().getUsername() %></td>
				<td><%=so.getAddr() %></td>
				<td><%=so.getoDate() %></td>
				<td><%=so.getStatus() %></td>
				<td>
					<a href="orderdetailshow.jsp?id=<%=so.getId()%>" target="detail">订单明细</a>
					&nbsp;
					<a href="ordermodify.jsp?id=<%=so.getId()%>" target="detail">订单修改</a>
					
				</td>
			</tr>
		<% 
		}
		%>
	</table>
	<center>
		第<%=pageNo %>页
		&nbsp;
		共<%=pageCount %>页
		&nbsp;
		<a href="productlist.jsp?pageno=<%=pageNo-1 %>">上一页</a>
		&nbsp;
		<a href="productlist.jsp?pageno=<%=pageNo+1 %>">下一页</a>
		&nbsp;
		<a href="productlist.jsp?pageno=<%=pageCount %>">最后一页</a>
		
	</center>
</body>
</html>