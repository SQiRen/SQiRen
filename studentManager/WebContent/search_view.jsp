<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.bean.*,java.util.*"%>

<html>
  <head>
    
    <title>显示查找到符合条件的信息</title>
    
<style type="text/css"></style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  
  <% 
	request.setCharacterEncoding("UTF-8");
  	response.setContentType("text/html;charset=UTF-8"); 
  	pageBean pagebean = (pageBean) request.getAttribute("pagebean");
  	
  	int nowPage , perPage , endPage ;
  	float allRows;
  	
  	nowPage = pagebean.getNowPage();  //当前页数
  	perPage = pagebean.getPerPageRows();  //每页显示多少条数
  	endPage = pagebean.getAllPages();    // 最后一页
  	allRows = pagebean.getTotalRows();
  	List list = pagebean.getResult();
  %>
  
  <script language="javascript">
    function xiangxi(id)
    {               
    	window.open("/studentManager/servlet/deta_Servlet?id="+id,"","height=500,width=470,left=280,top=150,status=no,location=no,toolbar=no,directories=no,menubar=no")
   	}
  </script>
  
  <body>
    <center>显示查找到符合条件的信息</center>
    <table width="704" height="45" border="0" align="center">
      <tr>
        <td height="41">
          
          <table width="699" height="45" border="0">
            <tr>
              <td width="121">&nbsp;</td>
              <td width="568"><font color =red><br>
              <marquee direction=left scrollamount="4"><b>修改后的信息刷新后才能正确反映 删除的信息将不能复原，请慎重考虑</b></marquee> </font></td>
            </tr>
          </table>        
          </td>
      </tr>
  </table>
    <table width="685" height="45" cellspacing="0" cellpadding="0" border="1" align="center">
		<tbody>
			<tr bgcolor="#336699">
				<td width="40" height="30" align="center"><span class="style10">编号</span></td>
				<td width="79" align="center"><span class="style10">名字 </span></td>
				<td width="50" align="center"><span class="style10">性别 </span></td>
				<td width="105" align="center"><span class="style10">班级</span></td>
				<td width="198" align="center"><span class="style10">地址</span></td>
				<td colspan="3" align="center"><span class="style10">操作</span></td>
			</tr>
			
			<%
			Iterator it = list.iterator();
			while (it.hasNext()) 
			{
				User user = (User) it.next();
						
						Long id = user.getIdx();
					    String name = user.getNam();
					    String sex = user.getSex();
						String class_ =user.getClass_();
						String address = user.getAddress();
			%>
		  <tr>
		 		 <td height="30" align="center"><%= id %></td>
				 <td align="center"><%= name %></td>
				 <td align="center"><%= sex %></td>
				 <td width="105" align="center"><%= class_ %></td>
				 <td align="center"><%= address %></td>                    
				 <td width="70" align="center">                                <!--详细按钮-->
				 	<input TYPE="button" value="详细" align=bottom onClick="xiangxi(<%=id%>)" />
				 </td>
				 <td width="70" align="center">                                 <!--修改按钮-->
				 	<input TYPE="button"  value="修改" align=bottom onClick="xiangxi(<%=id%>)" />
				 </td>
				 <td width="70"align="center" valign=middle>
				 	<a href = "/studentManager/servlet/delete_Servlet?id=<%= id %>& nowpage=<%=nowPage  %>">     <!--删除按钮-->
				 	<input name="" type="button"  value="删除"></a>
				 </td>
		  </tr>
			<%
				}
			%>
			<TR>
			  <TD height="37" colspan="8" >
			  &nbsp;&nbsp;&nbsp;&nbsp;
		      &nbsp;&nbsp;   一共有<%=allRows%>条数据
			  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 	
			      <a href="/studentManger/servlet/search_Servlet">刷新</a>  
			    
   	      </TD>
	      </TR>	
		</tbody>
  </table>
    <p>&nbsp;</p>
  </body>
</html>
