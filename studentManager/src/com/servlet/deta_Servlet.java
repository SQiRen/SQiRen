package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.bean.pageBean;
import com.DAO.*;

public class deta_Servlet extends HttpServlet {

	/*
	 *   显示学生的详细信息的   方法
	 * 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
			
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		
		DAO dao = new DAO();
		pageBean page = new pageBean();
		 //   设置  总的条数
		String sql = "select count(*) from stu_info";
		int totalRows=(int) dao.getTotalRows(sql) ;
		page.setTotalRows(totalRows);
		
		int perPage = page.getPerPageRows();
		
		 //   设置 总页数
		int allPages ;
		
		if(totalRows%5==0)
		{
			allPages =(int) (totalRows/perPage); 
		}
		else
			allPages=(int) (totalRows/perPage+1);
		page.setAllPages(allPages);
		
		//设置当前页数
		String per= request.getParameter("perPage");
		if(per==null)
		{
			int i = 1;
			page.setNowPage(i);
		}
		else
		page.setNowPage( Integer.parseInt(per));
		
		List results;
		String id = request.getParameter("id");
		int idx;
		if(id!=null)
		{
			idx = Integer.parseInt(id);
		    sql = "select * from stu_info where idx= "+idx;
			results = dao.getInfo(sql);
			page.setResult(results);
			request.setAttribute("pageBean",page);
		
			request.getRequestDispatcher("/detailed.jsp").forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		doGet(request,response);
	}

}
