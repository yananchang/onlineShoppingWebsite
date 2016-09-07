<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*,java.sql.*, java.util.*"%>

<%@ include file="_sessioncheck.jsp" %>

<% 

request.setCharacterEncoding("GBK");
String action = request.getParameter("action");

//List<Category> categories = Category.getCategories();
List<Product> products = new ArrayList<Product>();
int pageCount = 0;
String keyWord = null;
double lowNormalPrice = -1;
double highNormalPrice = -1;
double lowMemberPrice = -1;
double highMemberPrice = -1;
String strStartDate = null;
String strEndDate = null;
Timestamp startDate = null;
Timestamp endDate = null;

int pageNo = 1;
String strPageNo = request.getParameter("pageno");
if(strPageNo != null && !strPageNo.trim().equals("")){
		pageNo = Integer.parseInt(strPageNo);
}

int categoryId = 0;
	
	
keyWord = request.getParameter("keyword");
lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice")); 
highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice")); 
lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice")); 
highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice")); 	
categoryId = Integer.parseInt(request.getParameter("categoryid"));
int[] idArray;
if(categoryId == 0){
	idArray = null;
}else{
	idArray = new int[1];
	idArray[0] = categoryId;

}


strStartDate = request.getParameter("startdate");
if(strStartDate == null || strStartDate.trim().equals("")){
	startDate = null;
}else{
	startDate = Timestamp.valueOf(request.getParameter("startdate"));
}


strEndDate = request.getParameter("enddate");
if(strEndDate == null || strEndDate.trim().equals("")){
	endDate = null;
}else{
	endDate = Timestamp.valueOf(request.getParameter("enddate"));
}

products = new ArrayList<Product>();
pageCount = ProductMgr.getInstance().findProducts(products, idArray, keyWord, lowNormalPrice, highNormalPrice, 
									  lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, 3);




%>

<!-- 显示处理结果开始 -->
	<center>Search Result</center>
	<table border="1" align="center">
		<tr>
			<td>ID</td>
			<td>name</td>
			<td>descr</td>
			<td>normalprice</td>
			<td>memberprice</td>
			<td>pdate</td>
			<td>categoryid</td>
		</tr>
		<% 
		for (Iterator<Product> it = products.iterator(); it.hasNext();){
			Product p = it.next();
		
		%>
			<tr>
				<td><%=p.getId() %></td>
				<td><%=p.getName() %></td>
				<td><%=p.getDescr() %></td>
				<td><%=p.getNormalPrice() %></td>
				<td><%=p.getMemberPrice() %></td>
				<td><%=p.getPdate() %></td>
				<td><%=p.getCategoryId() %></td>

				<td>
					<a href="productdelete.jsp?id=<%=p.getId()%>" target="detail">删除</a>
					&nbsp;&nbsp;
					<a href="productmodify.jsp?id=<%=p.getId()%>" target="detail">修改</a>
				</td>
			</tr>
		<% 
		}
		%>
	</table>
	<center>
		共<%=pageCount %>页
		&nbsp;
		
			<a href="productsearch.jsp?action=<%=action%>&keyword=<%=keyWord%>&lownormalprice=<%=lowNormalPrice%>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice%>&highmemberprice=<%=highMemberPrice%>&startdate=<%=strStartDate%>&enddate=<%=strEndDate%>&pageno=<%=pageNo+1%>">下一页</a>
		
		
		
	</center>

<!-- 显示处理结果结束 -->
