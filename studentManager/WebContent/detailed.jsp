<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.bean.*,java.util.*"%>
<html>
  <head>
    
<script type="text/javascript">
function Juge(form1)
{
   if(form1.bir.value =="")
   	{
   		window.alert("请输入你的生日");
   		form1.bir.focus();
   		return (false);
   	}
  if(form1.class_.value=="")
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
}
  
</script>
    <title>察看学生信息</title>
<style type="text/css">
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   </head>
  
  <% 
	request.setCharacterEncoding("UTF-8");
  	response.setContentType("text/html;charset=UTF-8"); 
  	pageBean pagebean = (pageBean) request.getAttribute("pageBean");
  	
  	int nowPage , perPage , endPage ;
  	
  	nowPage = pagebean.getNowPage();  //当前页数
  	perPage = pagebean.getPerPageRows();  //每页显示多少条数
  	endPage = pagebean.getAllPages();    // 最后一页
  	 
  	List list = pagebean.getResult();
  %>
  
  <body>
  			<%
					
  			           Iterator it = list.iterator();
			            while (it.hasNext()) 
			           {
			            	User users = (User) it.next();
						Long id = users.getIdx();
					    String name = users.getNam();
					    String sex = users.getSex();
					    String bir = users.getBir();
						String class_ =users.getClass_();
						String QQ = users.getQq();
						String email = users.getEmail();
						String join_time = users.getJoin_time();
						String like = users.getLik();
						String address = users.getAddress();
						String info = users.getInfo();
						String tel = users.getTel();
			%>
			
	
  <form method=post name=form1 action=/studentManager/servlet/modi_Servlet  onsubmit="return Juge(form1);"> 
    <table width="441" height="426" border="1" align="center">
      <tr>
        <td width="102" bgcolor="＃336699"><div align="center" class="style10">编号</div></td>
        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= id %>
        <input type = hidden name= id value =<%= id %> > </td>
        
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center" class="style10">姓名</div></td>
        <td colspan="2">&nbsp;&nbsp;<%= name %></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center" class="style10">性别</div></td>
        <td colspan="2"> 
        <%
        	if(sex.equals("男")){ %>
        	&nbsp;
        	<input type = radio name= sex value="男" checked>男&nbsp;&nbsp;&nbsp;
        	<input type = radio name= sex value="女">女
        <%
        } if(sex.equals("女"))  {  %>
        	&nbsp;
        	<input type = radio name= sex value="男" >男&nbsp;&nbsp;&nbsp;
        	<input type = radio name= sex value="女" checked>女
        <%}
        %></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center" class="style10">生日</div></td>
        <td colspan="2">&nbsp;&nbsp;<input type = "text" name=bir value = <%= bir %> ></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center"  class="style10">班级</div></td>
        <td colspan="2">&nbsp;&nbsp;<input type = "text" name=class_ value = <%= class_ %> ></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center" class="style10">QQ</div></td>
        <td colspan="2">&nbsp;&nbsp;<input type = "text" name=qq value = <%= QQ %>></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center"  class="style10">邮箱</div></td>
        <td colspan="2">&nbsp;&nbsp;<input type = "text"  name=email value = <%= email %>></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center"  class="style10">电话</div></td>
        <td colspan="2">&nbsp;&nbsp;<input type = "text" name=tel value = <%= tel %> ></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center" class="style10">地址</div></td>
        <td colspan="2">&nbsp;&nbsp;<input type = "text" name=address value = <%= address %>></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center"  class="style10">添加时间</div></td>
        <td colspan="2">&nbsp;&nbsp;<%= join_time %></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center" class="style10">爱好</div></td>
        <td colspan="2">&nbsp;&nbsp;<input type = "text" name=like value = <%= like %> ></td>
      </tr>
      <tr>
        <td bgcolor="＃336699"><div align="center" class="style10">头像：</div></td>
        <td colspan="2">&nbsp;&nbsp;
      <img src="/image/<%= info %>"  width="100" height="100"/><br/> 
      </tr>
      <tr>
        <td height="38" bgcolor="＃336699"><div align="center" class="style10">操作</div></td>
		<td align="center"  valign="middle"><input type="submit" value="保存"></td>
      </tr>
      <%
		}
	  %>
    </table>
  </form>
  <center><a href="javascript:window.close()">关闭窗口</a></center><br>
  
  </body>
</html>
