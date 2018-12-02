<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
   <title>My JSP 'info.jsp' starting page</title>
  </head>
  
  <% 
  		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
  %>
  
  <body>
  <%=
  	request.getAttribute("info")
  %>
  
  <br>
  <%
  	String idx = (String)request.getAttribute("id");
  	if (idx.equals("l"))
  	{
  %>
  
  <br>
 
  <center><a href="/studentManager/add.jsp">继续添加</a><br><br><br><br>
  <%} else {%> <%= request.getAttribute("denglu")%><%} %>
  
 <center> <a href="/studentManager/servlet/look_Servlet" target="frm">察看全部信息</a></center><br>
  </center>
  </body>
</html>
