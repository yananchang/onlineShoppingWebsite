<%@page contentType="text/html;charset=GB18030" pageEncoding="GB18030" %>

<% 
String strId = request.getParameter("id");
if(strId == null || strId.trim().equals("")){
	out.println("��ѡ�����Ʒ�д�");
	return;
}
int id = Integer.parseInt(strId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
�0�2 <head>
�0�2�0�2�0�2 <title>index.html</title>
�0�2�0�2�0�2 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
�0�2�0�2�0�2 <meta http-equiv="description" content="this is my page">
�0�2�0�2�0�2 <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
�0�2 </head>
�0�2 <body>
�0�2�0�2 <form action="../servlet/FileUpload" method="post" enctype="multipart/form-data" name="form1">
	<input type="hidden" name="id" value="<%= id%>">
�0�2 <input type="file" name="file">
�0�2 <input type="submit" name="Submit" value="upload">
</form>

<br>
<br>
�0�2�0�2�0�2 <form name="uploadform" method="POST" action="./servlet/FileUpload" ENCTYPE="multipart/form-data">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <table border="1" width="450" cellpadding="4" cellspacing="2" bordercolor="#9BD7FF">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <tr><td width="100%" colspan="2">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 �ļ�1��<input name="x" size="40" type="file">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </td></tr>
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <tr><td width="100%" colspan="2">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 �ļ�2��<input name="y" size="40" type="file">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </td></tr>
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <tr><td width="100%" colspan="2">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2�0�2 �ļ�3��<input name="z" size="40" type="file">
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </td></tr>
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 </table>
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <br/><br/>
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <table>
�0�2�0�2�0�2�0�2�0�2�0�2�0�2 <tr><td align="center"><input name="upload" type="submit" value="��ʼ�ϴ�"/></td></tr>
�0�2�0�2�0�2�0�2�0�2�0�2 </table>
</form>
�0�2 </body>
</html>