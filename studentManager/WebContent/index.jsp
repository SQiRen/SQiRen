<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
<script type="text/javascript">
   function J(f)
{
   if(f.name.value=="")
   {
    window.alert("请输入名字！"); 
    f.name.focus(); 
    return (false); 
   }
   if(f.pwd.value=="")
   {
    window.alert("请输入密码"); 
    f.pwd.focus(); 
    return (false); 
   }
 }
</script>
   
    <title>用户登陆页面</title>
    
  </head>
  <% 
  		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
  %>
  
  <body >
    <H1>&nbsp;</H1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table width="970" height="318" border="0">
      <tr>
        <td height="62" colspan="2"></td>
        <td width="139">&nbsp;</td>
        <td width="363">&nbsp;</td>
      </tr>
      <tr>
        <td width="258" height="175"></td>
        <td colspan="2">
<FORM name="f" action="/studentManager/servlet/Login_Servlet" method="post" onsubmit="return J(f);">
   <P align="center"><br><br>
   名字: <INPUT type="text" name="name"><BR><BR>
   密码: <INPUT type="password" name="pwd"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </P>
   <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="submit" name="submit"  width="70" height="22"> 
          <a href="addUser.jsp"><span class="tn-button">新注册</span></a>
        </FORM>
    </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="73">&nbsp;</td>
        <td width="192">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
  </table>
</body>
</html>
