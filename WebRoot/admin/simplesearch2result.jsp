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


int pageNo = 1;
String strPageNo = request.getParameter("pageno");
if(strPageNo != null && !strPageNo.trim().equals("")){
		pageNo = Integer.parseInt(strPageNo);
}

String strCategoryIdQuery = "";
 
//处理简单搜索2

	
	
keyWord = request.getParameter("keyword");

String[] strCategoryIds = request.getParameterValues("categoryid");

int[] idArray;

if(strCategoryIds == null || strCategoryIds.length == 0){
	idArray = null;
}else{
	for (int i=0; i<strCategoryIds.length; i++){
		strCategoryIdQuery += "&categoryid=" + strCategoryIds[i];
	}
	idArray = new int[strCategoryIds.length];
	for (int i=0; i<strCategoryIds.length; i++){
		idArray[i] = Integer.parseInt(strCategoryIds[i]);
	}
	products = new ArrayList<Product>();
	pageCount = ProductMgr.getInstance().findProducts(products, idArray, keyWord, -1, -1, 
									  -1, -1, null, null, pageNo, 3);

}
	
	

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
		
			<a href="productsearch.jsp?action=<%=action%>&keyword=<%=keyWord%>&pageno=<%=pageNo+1%><%=strCategoryIdQuery%>">下一页</a>
		
		
		
	</center>

<!-- 显示处理结果结束 -->
