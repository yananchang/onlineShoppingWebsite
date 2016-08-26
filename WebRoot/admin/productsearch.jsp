<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*,java.sql.*, java.util.*"%>

<%@ include file="_sessioncheck.jsp" %>

<% 
List<Category> categories = Category.getCategories();
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

String strCategoryIdQuery = "";
%>

<% 
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");

if(action != null && action.trim().equals("complexsearch")){
	
	
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
	

	
}
%>

<% 
//处理简单搜索2
if(action != null && action.trim().equals("simplesearch2")){
	
	
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
		<% 
		if(action != null && action.equals("complexsearch")){
		%>
			<a href="productsearch.jsp?action=<%=action%>&keyword=<%=keyWord%>&lownormalprice=<%=lowNormalPrice%>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice%>&highmemberprice=<%=highMemberPrice%>&startdate=<%=strStartDate%>&enddate=<%=strEndDate%>&pageno=<%=pageNo+1%>">下一页</a>
		<%
		} 
		%>
		
		<% 
		if(action != null && action.equals("simplesearch2")){
		%>
			<a href="productsearch.jsp?action=<%=action%>&keyword=<%=keyWord%>&pageno=<%=pageNo+1%><%=strCategoryIdQuery%>">下一页</a>
		<%
		} 
		%>
	</center>

<!-- 显示处理结果结束 -->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'userdelete.jsp' starting page</title>
<script type="text/javascript">
<!--
	function checkdata(){
		with(document.forms["complex"]){
			if(lownormalprice.value == null || lownormalprice.value == ""){
				lownormalprice.value = -1;
			}
			if(highnormalprice.value == null || highnormalprice.value == ""){
				highnormalprice.value = -1;
			}
			if(lowmemberprice.value == null || lowmemberprice.value == ""){
				lowmemberprice.value = -1;
			}
			if(highmemberprice.value == null || highmemberprice.value == ""){
				highmemberprice.value = -1;
			}
		}
	}
-->
</script>

  </head>
  
  <body>
  	<center>简单搜索</center>
  	<form action="productsearch.jsp" method="post">
  		<input type="hidden" name="action" value="simplesearch">
  		类别：<select></select>
  		关键字：<input type="text" name="keyword">
  		<input type="submit" value="search">
  	</form>
  	
  	<center>第二种搜索方法</center>
  	<form action="productsearch.jsp" method="post">
  		<input type="hidden" name="action" value="simplesearch2">
  		类别：<br>
  		<% 
		for(Iterator<Category> it = categories.iterator();it.hasNext();){
			Category c = it.next();
			if(c.isLeaf()){
		%>
			<input type="checkbox" name="categoryid" value="<%=c.getId() %>"> <%=c.getName() %><br>
		
		<% 
			}else{
		%>
			&nbsp;&nbsp;<%=c.getName() %> <br>
		<% 
			}
		}
		%>
  		关键字：<input type="text" name="keyword">
  		<input type="submit" value="search">
  	</form>
  	
  	<center>复杂搜索</center>
	<form action="productsearch.jsp" method="post" onsubmit="checkdata()" name="complex">
		<input type="hidden" name="action" value="complexsearch">

		<table>
			<tr>
				<td>category：</td>
				<td>
					<select name="categoryid">
						<option value="0"> all options</option>
						<% 
						for(Iterator<Category> it = categories.iterator();it.hasNext();){
							Category c = it.next();
							String preStr = "--";
							for(int i=1; i<c.getGrade(); i++){
								preStr += "--";
							}
						%>
						<option value="<%=c.getId() %>"><%=preStr + c.getName() %></option>
						
						<% 
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>keyword：</td>
				<td><input type="text" name="keyword"></td>
			</tr>
			<tr>
				<td>normalprice：</td>
				<td>
					From<input type="text" name="lownormalprice"/>
					To<input type="text" name="highnormalprice"/>
				</td>
			</tr>
			<tr>
				<td>memberprice：</td>
				<td>
					From<input type="text" name="lowmemberprice"/>
					To<input type="text" name="highmemberprice"/>
				</td>
			</tr>
			<tr>
				<td>pdate：</td>
				<td>
					From<input type="text" name="startdate"/>
					To<input type="text" name="enddate"/>
				</td>
			</tr>

			<tr>
				<td colspan=2><input type="submit" value="search"></td>
			</tr>
		</table>
	</form>
  </body>
</html>














