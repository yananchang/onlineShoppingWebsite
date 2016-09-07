<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bjsxt.shopping.*, 
				java.util.*"%>
<%@ include file="_sessioncheck.jsp" %>

<% 
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductMgr.getInstance().loadById(id);
String action = request.getParameter("action");
if(action != null && action.trim().equals("modify")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr"); 
	double normalPrice = Double.parseDouble(request.getParameter("normalprice")); 
	double memberPrice = Double.parseDouble(request.getParameter("memberprice")); 
	int categoryId = Integer.parseInt(request.getParameter("categoryid"));
	
	Category c = Category.loadById(categoryId);
	if(!c.isLeaf()){
		out.println("非叶子节点下不能添加商品");
		return;
	}
	
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);

	p.setCategoryId(categoryId);
	
	ProductMgr.getInstance().updateProduct(p);
	
	%>
	<script type="text/javascript">
		window.parent.main.location.reload();
	</script>
	<%
	out.println("Congratulations! Product info update ok!");
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>

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
	<center>修改产品</center>
	<form action="productmodify.jsp" method="post" onsubmit="return checkdata()" name="form">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=id %>">

		<table>
			<tr>
				<td>name：</td>
				<td><input type="text" name="name" value="<%=p.getName()%>"/></td>
			</tr>
			<tr>
				<td>descr：</td>
				<td><textarea name="descr"><%=p.getDescr()%></textarea></td>
			</tr>
			<tr>
				<td>normalprice：</td>
				<td><input type="text" name="normalprice" value="<%=p.getNormalPrice()%>"/></td>
			</tr>
			<tr>
				<td>memberprice：</td>
				<td><input type="text" name="memberprice" value="<%=p.getMemberPrice()%>"/></td>
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
						<option value="<%=c.getId() %>" <%=c.getId() == p.getCategoryId() ? "selected" : "" %>><%=preStr + c.getName() %></option>
						
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