package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DAO;
import com.bean.addUserBean;

public class addUser_Servlet extends HttpServlet {

	/**
	 *      添加用户
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String age1 = request.getParameter("age");
		
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		
		addUserBean  user = new addUserBean();
		user.setName(name);
		user.setPwd(pwd);
		user.setSex(sex);
		int age;
		if(age1!=null)
		{
			age = Integer.parseInt(age1);
			user.setAge(age);
		}
		user.setAddress(address);
		
		DAO dao  = new DAO();
		dao.addUser(user);
		request.setAttribute("info",new String("<br><br><center><h1><font color=red>添加成功！" +
		"</font></h1></center><br>"));
		request.setAttribute("id", new String("a"));
		request.setAttribute("denglu",new String("<br><br><center><a href = /studentManager/index.jsp target =_parent>登陆</href></center><br>"));
		
		
		request.getRequestDispatcher("/info.jsp").forward(request,response);
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		doPost(request,response);
	}
}
