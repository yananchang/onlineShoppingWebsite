<%@ page contentType="text/html;charset=GB18030"  import="java.util.*, com.bjsxt.shopping.*"  pageEncoding="GB18030" %>

<%
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
	buf.append("<category><id>" + c.getId() +"</id><name>"+ c.getName() + "</name></category>");
}
buf.insert(0, "<categories>");
buf.append("</categories>");
buf.insert(0, "<?xml version='1.0' encoding='gb2312'?>");

System.out.println(buf);

response.setHeader("Cache-Control", "no-store");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
response.getWriter().write(buf.toString().trim());
%>



