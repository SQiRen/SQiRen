<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
   <title>主页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/html">
    </style>
	
  </head>
  <body>
   
  	<table width="801" height="198" border="0" align="center">
	<tr >
		<td width="60" height="22" >&nbsp;</td> 
		<td width="110"  align="center"><a href="add.jsp" target="frm" class="style2 ">添加信息</a></td>
		<td width="110"  align="center"><a href="/studentManager/servlet/look_Servlet" target="frm" class="style2">察看信息</a></td>
		<td width="110"  align="center"><a href="search.jsp" target="frm" class="style2">查找信息</a></td>
		<td width="110"  align="center"><a href="addUser.jsp" target="frm" class="style2">添加用户</a></td>
		<td width="74"   align="center"><a href="/" onClick="javascript:window.close();return false;" class="style2">退出</a></td>
  	    <td width="45"   align="center">&nbsp;</td>
	</tr>
  <tr>
    <td height="168" colspan="9"  >
		<iframe align="top" src="view.jsp" name="frm" scrolling="yes"  width="801" height="500" frameborder="0">
		</iframe>
	</td>
  </tr>
</table>
<br>
  </body>
  
</html>



  