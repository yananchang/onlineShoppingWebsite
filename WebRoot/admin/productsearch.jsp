<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*,java.sql.*, java.util.*"%>

<%@ include file="_sessioncheck.jsp" %>


<% 
List<Category> categories = Category.getCategories();

request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action != null && action.equals("complexsearch")){
	%>
	<jsp:forward page="complexsearchresult.jsp"></jsp:forward>
	<%
}

if(action != null && action.equals("simplesearch2")){
	%>
	<jsp:forward page="simplesearch2result.jsp"></jsp:forward>
	<%
}
%>


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














