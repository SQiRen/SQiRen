<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  
 <script type="text/javascript">
  function Juge(form1)
{
   if(form1.name.value=="")
   {
    window.alert("请输入名字！"); 
    form1.name.focus(); 
    return (false); 
   }
   if(form1.pwd.value =="")
   	{
   		window.alert("请输入你密码");
   		form1.pwd.focus();
   		return (false);
   	}
   	
   	if(form1.pwd.value.length <6)
   	{
   		window.alert("密码长度过短 可能不安全");
   		form1.pwd.focus();
   		return (false);
   	}
  if (form1.pwd.value != form1.pwd1.value) 
     { 
       window.alert("两者密码不匹配！"); 
       form1.pwd1.focus(); 
       return (false); 
     }
   if(form1.age.value=="")
   {
    window.alert("请输入你的年龄"); 
    form1.age.focus(); 
    return (false); 
   }
   if(form1.age.value!="")
   {
   	if(isNaN(form1.age.value))
		{
			alert("年龄不能是字符!");
    		return false;
		}
	}
   
   if(form1.address.value=="")
   {
    window.alert("请输入你的地址"); 
    form1.address.focus(); 
    return (false); 
   }
   
  
}

</script>
  
    <title>添加用户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  &nbsp;&nbsp;&nbsp;&nbsp; 
    <P></P><form name="form1" method="post" action="/studentManager/servlet/addUser_Servlet" onsubmit="return Juge(form1);">
      <table width="263" height="272" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="86"><div align="center">名字</div></td>
          <td width="178"><input name="name" type="text" id="name" size="15"></td>
        </tr>
        <tr>
          <td><div align="center">密码</div></td>
          <td><input name="pwd" type="text" id="pwd" size="15"></td>
        </tr>
        <tr>
          <td><div align="center">确认密码</div></td>
          <td><input name="pwd1" type="text" id="pwd1" size="15"></td>
        </tr>
        <tr>
          <td><div align="center">年龄</div></td>
          <td><input name="age" type="text" id="age" size="5"></td>
        </tr>
        <tr>
          <td><div align="center">性别</div></td>
          <td><input name="sex" type="radio" value="男" checked>
          男
            <input type="radio" name="sex" value="女">
          女</td>
        </tr>
        <tr>
          <td><div align="center">地址</div></td>
          <td><input name="address" type="text" id="address"></td>
        </tr>
        <tr>
          <td colspan="2"><div align="center">
            <input type="submit" name="Submit" value="确定">
            &nbsp;&nbsp;
            <input type="reset" name="Submit2" value="重置">
          </div></td>
        </tr>
      </table>
        </form>
    <p><br>
        </p>
  </body>
</html>


