<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.*,java.sql.*, java.util.*"%>

<%@ include file="_sessioncheck.jsp" %>

<% 
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");

String strCategoryId = request.getParameter("categoryid");
int categoryId = 0;
if(strCategoryId != null && !strCategoryId.trim().equals("")){
	categoryId = Integer.parseInt(strCategoryId);
}


if(action != null && action.trim().equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr"); 
	double normalPrice = Double.parseDouble(request.getParameter("normalprice")); 
	double memberPrice = Double.parseDouble(request.getParameter("memberprice")); 
	
	
	Category c = Category.loadById(categoryId);
	if(!c.isLeaf()){
		out.println("非叶子节点下不能添加商品");
		return;
	}
	
	Product p = new Product();
	p.setId(-1);
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setPdate(new Timestamp(System.currentTimeMillis()));
	p.setCategoryId(categoryId);
	
	ProductMgr.getInstance().addProduct(p);
	
	
	out.println("<h1>category added!<h1>");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<title>My JSP 'userdelete.jsp' starting page</title>
<script type="text/javascript">
	var arrLeaf = nwe Array();

	<!--
	function checkdata(){
		if(arrLeaf[document.form.categoryid.selectedIndex] != "leaf"){
			alert("不能选择非叶子节点");
			document.form.categoryid.focus();
			return false;
		}
		return true;
	}
	-->
</script>    

  </head>
  
  <body>
  	<center>添加根类别</center>
	<form action="productadd.jsp" method="post" onsubmit="return checkdata()" name="form">
		<input type="hidden" name="action" value="add">

		<table>
			<tr>
				<td>name：</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>descr：</td>
				<td><textarea name="descr"></textarea></td>
			</tr>
			<tr>
				<td>normalprice：</td>
				<td><input type="text" name="normalprice"/></td>
			</tr>
			<tr>
				<td>memberprice：</td>
				<td><input type="text" name="memberprice"/></td>
			</tr>
			<tr>
				<td>category</td>
				<td>
					<select name="categoryid">
						<option value="0"> all options</option>
						<script type="text/javascript">
							arrLeaf[0] = "notleaf";
						</script>
						<% 
						List<Category> categories = Category.getCategories();
						int index = 1;
						for(Iterator<Category> it = categories.iterator();it.hasNext();){
							Category c = it.next();
							String preStr = "--";
							for(int i=1; i<c.getGrade(); i++){
								preStr += "--";
							}
						%>
						<script type="text/javascript">
							arrLeaf[<%=index%>] ='<%=c.isLeaf() ? "leaf" : "notleaf"%>';
						</script>
						<option value="<%=c.getId() %>" <%=c.getId() == categoryId ? "selected" : "" %>><%=preStr + c.getName() %></option>
						
						<% 
						index ++;
						}
						%>
						</select>
					</td>
			</tr>

			<tr>
				<td colspan=2><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
  </body>
</html>














