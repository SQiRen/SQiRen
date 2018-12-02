package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DAO;
import com.bean.User;
import com.bean.pageBean;

public class search_Servlet extends HttpServlet {

	/** 
	 * 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html;charset=UTF-8");
		String idx = request.getParameter("id");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String class_ = request.getParameter("class_");
		String address = request.getParameter("address");
		
		String sql = "select * from stu_info where";
		String sql1 = "select count(*) from stu_info where";
		
		if(idx!=null && !idx.equals(""))
		{
			sql=sql+" idx = " + idx +"  and";
			sql1=sql1+" idx =" + idx +"  and";
		}
		if(name!=null && !name.equals(""))
		{
			sql = sql +" nam like '%" + name +"%'  and";
			sql1 = sql1 +" nam like '%" + name +"%'  and";
		}
		if(sex!=null && !sex.equals(""))
		{
			sex = new String(sex.getBytes("UTF-8"));
			sql = sql +" sex like '%" + sex +"%'  and";
			sql1 = sql1 +" sex like '%" + sex +"%'  and";
		}
		if(class_!=null && !class_.equals(""))
		{
			sql = sql +" class_ like '%" + class_ +"%'  and";
			sql1 = sql1 +" class_ like '%" + class_ +"%'  and";
		}
		if(address!=null && !address.equals(""))
		{
			sql = sql +" address like '%" + address+"%'  and";
			sql1 = sql1 +" address like '%" + address+"%'  and";
		}
		sql = sql.substring(0,sql.length()-5); //截掉SQL 语句的后5个字符
		sql1 = sql1.substring(0,sql1.length()-5);  //截掉SQL1 语句的后5个字符
		
		DAO dao =new DAO();
		pageBean page = new pageBean();
		
		int totalRows=(int) dao.getTotalRows(sql1) ;  //得到总条数
		page.setTotalRows(totalRows);                  //把总条数放到BEAN里面
		
		System.out.println(sql);
		System.out.println(sql1);
		System.out.println(totalRows);
		
		List results = dao.getInfo1(page,sql);
		page.setResult(results);
		request.setAttribute("pagebean", page);
		
		request.getRequestDispatcher("/search_view.jsp").forward(request, response);
	}
}
