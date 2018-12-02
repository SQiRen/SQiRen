<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
<script type="text/javascript">
function Juge(form1)
{
	if(isNaN(form1.idx.value))
	{
		alert("序号不能是字符!");
    	return false;
	}
   if(form1.nam.value=="")
   {
    window.alert("请输入名字！"); 
    form1.nam.focus(); 
    return (false); 
   }
   if(form1.pwd.value=="")
   {
    window.alert("请输入密码！"); 
    form1.nam.focus(); 
    return (false); 
   }
   if(form1.bir.value =="")
   	{
   		window.alert("请输入你的生日");
   		form1.bir.focus();
   		return (false);
   	}
  if(form1.cla.value=="")
   {
    window.alert("请输入你的班级！"); 
    form1.cla.focus(); 
    return (false); 
   }
   if(isNaN(form1.qq.value))
	{
		alert("QQ不能是字符!");
    	return false;
	}
   if(form1.email.value=="")
   {
    window.alert("请输入你的邮箱"); 
    form1.email.focus(); 
    return (false); 
   }
    if(form1.email.value.length!=0)
    {
       if (form1.email.value.charAt(0)=="." ||        
         form1.email.value.charAt(0)=="@"||       
         form1.email.value.indexOf('@', 0) == -1 || 
         form1.email.value.indexOf('.', 0) == -1 || 
         form1.email.value.lastIndexOf("@")==form1.email.value.length-1 || 
         form1.email.value.lastIndexOf(".")==form1.email.value.length-1)
          {
             alert("Email地址格式不正确！");
             form1.email.focus();
             return false;
          }
    }
   if(form1.tel.value=="")
   {
    window.alert("请输入你的电话"); 
    form1.tel.focus(); 
    return (false); 
   }
   if(form1.tel.value!="")
   {
   	if(isNaN(form1.tel.value))
		{
			alert("电话号码不能是字符!");
    		return false;
		}
	}
   if(form1.tel.value.length!=11)
   {
    window.alert("若是手机请直接输入，座机请在前面加区号"); 
    form1.tel.focus();  
    return (false); 
   }
   if(form1.address.value=="")
   {
    window.alert("请输入你的地址"); 
    form1.address.focus(); 
    return (false); 
   }
   if(form1.join_time.value=="")
   {
    window.alert("请输入你的加入时间"); 
    form1.address.focus(); 
    return (false); 
   }
  
}

</script>
    <title>注册页面</title>
  </head>
  
  <% 
  		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
  %>
  
  <body >
  
 
   
  <form name="form1" action="/studentManager/servlet/add_Servlet" enctype="multipart/form-data"  method="post">
<table width="407" height="519" border="0">
   <tr>
    <td width="102">序号： <font color="#ff0000">*</font></td>
    <td width="295"><input name="idx" type="text" size="20"><font color="#ff0000" size="-1"></font></td>
  </tr>
  <tr>
    <td width="102">名字： <font color="#ff0000">*</font></td>
    <td width="295"><input name="nam" type="text" size="20"><font color="#ff0000" size="-1">（请用真实姓名）</font></td>
  </tr>
  <tr>
    <td width="102">密码： <font color="#ff0000">*</font></td>
    <td width="295"><input name="pwd" type="text" size="20"><font color="#ff0000" size="-1">（密码长度大于六位，并保持与注册用户时一致）</font></td>
  </tr>
  <tr>
    <td>性别：</td>
    <td><input type="radio" name="sex" value="男" checked>
      男  &nbsp;
      <input type="radio" name="sex" value="女"> 
      女 </td>
  </tr>
  <tr>
    <td>生日： <font color="#ff0000"> *</font></td>
    <td><input name="bir" type="text" size="20"><font color="#ff0000" size="-1">（格式如 1990-01-01）</font></td>
  </tr>
  <tr>
    <td>班级： <font color="#ff0000">*</font></td>
    <td><input name="cla" type="text" size="15"></td>
  </tr>
  <tr>
    <td>QQ：</td>
    <td><input name="qq" type="text" size="11"></td>
  </tr>
  <tr>
    <td>邮箱： <font color="#ff0000">*</font></td>
    <td><input name="email" type="text" size="27"><font color="#ff0000" size="-1">（格式要正确）</font></td>
  </tr>
  <tr>
    <td>电话： <font color="#ff0000">*</font></td>
    <td><input name="tel" type="text" size="15" >
      <font color="#ff0000" size="-1" >（请填写正确的电话号码）</font></td>
  </tr>
  <tr>
    <td>地址： <font color="#ff0000">*</font></td>
    <td><input name="address" type="text" size="35"></td>
  </tr>
  <tr>
    <td>加入时间： <font color="#ff0000">*</font></td>
    <td><input name="join_time" type="text" size="35"></td>
  </tr>
  <tr>
    <td>爱好： </td>
    <td><input type="text" name="lik"></td>
  </tr>
  <tr>
    <td><p>头像上传: </p>
    <td><input id="info" type=file name="info"></td>
  </tr>
</table>
<P>
  <INPUT type="submit" value="添加">&nbsp;&nbsp;
  <INPUT type="reset" value="重填">
     <BR>
    </P>
    </form>
  </body>
</html>
