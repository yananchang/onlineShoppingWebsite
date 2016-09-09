<%@ page contentType="text/html;charset=GB18030"  import="java.util.*, com.bjsxt.shopping.*"  pageEncoding="GB18030" %>

<%
//动态生成js代码
int id = Integer.parseInt(request.getParameter("id"));
Category parent = Category.loadById(id);
List<Category> childs = parent.getChilds();
System.out.println(childs.size());


StringBuffer buf = new StringBuffer();

/*
//普通的自己构建的字符串
for(int i=0; i<childs.size(); i++){
	Category c = childs.get(i);
	buf.append(c.getId() + "," + c.getName() + "-");
}
//delete the last '-' of the string
if(childs.size() > 0) buf.deleteCharAt(buf.length() - 1);
*/

for(int i=0; i<childs.size(); i++){
	Category c = childs.get(i);
	buf.append("document.form2.category2.options[" + (i+1) + "].text = '" + c.getName() + "';\n");
	buf.append("document.form2.category2.options[" + (i+1) + "].value = '" + c.getId() + "';\n");
	
}

buf.insert(0, "document.form2.category2.options[0].text = '请选择二级目录';\n");
	buf.insert(0, "document.form2.category2.options[0].value = '-1';\n");
	buf.insert(0, "document.form2.category2.selectedIndex = 0;\n");
	buf.insert(0, "document.form2.category2.options.length = " + (childs.size()+1) + ";\n");
	

System.out.println(buf);

response.setHeader("Cache-Control", "no-store");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
//response.getWriter().write(buf.toString().trim());
out.print(buf.toString().trim());

%>



