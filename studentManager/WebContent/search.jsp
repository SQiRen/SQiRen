<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
  
    <title>查找学生信息</title>
    
    <style type="text/css">
    </style>
  </head>
  
    <% 
  		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
   %>
  
  <body>
  <center>
    <form name="form2" method="get" action="/studentManager/servlet/search_Servlet">
      <table width="274" height="239" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="66" height="37" bgcolor="#336699"><div align="center" class="style1">编号</div></td>
          <td width="202">&nbsp;&nbsp;<input name="id" type="text" size="5"></td>
        </tr>
        <tr>
          <td height="40" bgcolor="#336699"><div align="center" class="style1">姓名</div></td>
          <td>
            &nbsp;&nbsp;<input name="name" type="text" size="10">  
            <input type = hidden name = perPage value = 1>
          </td>
        </tr>
        <tr>
          <td height="35" bgcolor="#336699"><div align="center" class="style1">性别</div></td>
          <td>
		  &nbsp;&nbsp;<input name="sex" type="radio" value="男">
            男
              <input type="radio" name="sex" value="女">
            女</td>
        </tr>
        <tr>
          <td height="37" bgcolor="#336699"><div align="center" class="style1">班级</div></td>
          <td>&nbsp;&nbsp;<input name="class_" type="text" size="10"></td>
        </tr>
        <tr>
          <td height="39" bgcolor="#336699"><div align="center" class="style1">地址</div></td>
          <td>&nbsp;&nbsp;<input type="text" name="address"></td>
        </tr>
        <tr>
          <td colspan="2">
          	<div align="center">
            <input type="submit"  value="提交">&nbsp;&nbsp;
            <input type="reset"  value="重置">
          	</div>
          </td>
        </tr>
      </table>
    </form>
  </center>
  </body>
</html>
