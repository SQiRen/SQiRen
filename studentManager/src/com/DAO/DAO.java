package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;
import com.bean.addUserBean;
import com.bean.pageBean;
import com.getDataBaseConn.GetConnection;



public class DAO {

		/**
		 *连接数据库v
		 * 
		 */
		private Connection conn;
		private PreparedStatement pstat;
		String sql="";
		
	public boolean add(User user) throws SQLException 
	{
		/*
         *  将学生信息添加到数据库里		 
         *  
         */
		conn= GetConnection.getConnection();
		
		boolean i = true ;
		try
			{
				sql="insert into stu_info(idx,nam,sex,bir,class_,qq,email,tel,address,join_time,lik,info,pwd) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				pstat = conn.prepareStatement(sql);
				
				pstat.setLong(1, user.getIdx());
				pstat.setString(2, user.getNam());
				pstat.setString(3, user.getSex());
				pstat.setString(4, user.getBir());
				pstat.setString(5, user.getClass_());
				pstat.setString(6, user.getQq());
				pstat.setString(7, user.getEmail());
				pstat.setString(8, user.getTel());
				pstat.setString(9, user.getAddress());
				pstat.setString(10, user.getJoin_time());
				pstat.setString(11, user.getLik());
				pstat.setString(12, user.getInfo());
				pstat.setString(13, user.getPwd());
				
				pstat.executeUpdate();
				pstat.close();
				
			}
			catch(Exception e)
			{
				e.printStackTrace() ;
			}
		return i;
		
	}
	/**
	 * 验证用户 先讲存放到数据库上的用户信息取出来 然后再比对 
	 */
	public boolean login(User user) throws SQLException 
	{
		conn= GetConnection.getConnection();
		
		boolean i = false ;
		
	
		sql = "select nam from admin where nam=? and pwd=?";
		System.out.println(user.getNam());
		System.out.println(user.getPwd());
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1, user.getNam());
		pstat.setString(2, user.getPwd());
		
		ResultSet rs1 = pstat.executeQuery();
		if (rs1.next())
		{
			i = true;
			rs1.close();
			pstat.close();
		}
		else 
		{
			i = false ;
			rs1.close();
			pstat.close();
		}
		conn.close();
		return i;
	}
	/**
	 * 得到数据库表里学生信息的总条数
	 */
	public int getTotalRows(String sql)
	{
		conn= GetConnection.getConnection();
		
		int i = 0; 
		try  
		{
			pstat = conn.prepareStatement(sql);
			ResultSet rs2 = pstat.executeQuery(); 
			rs2.next();
			i = rs2.getInt(1); 
			System.out.print(i);
			rs2.close();
			pstat.close();
			conn.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	/**
	 *进行分页
	 * 
	 */
	public List getInfo(pageBean page) 
	{
		int nowPage = page.getNowPage();  //当前页数
		int perPageViwe = page.getPerPageRows();    //每页显示的条数
		System.out.println(perPageViwe);
		
		System.out.println(nowPage);
		int start = (nowPage - 1) * perPageViwe;     //起始位置
		int maxResults = perPageViwe;    //每页显示的条数
		System.out.println(start);
		
		
		
		System.out.println(maxResults);
		List users = null; //存放所有用户信息
		
		conn= GetConnection.getConnection();
		if (start >1)
		{
			sql = "select * from stu_info  where " +
					"idx not in (select idx from stu_info where rownum<="+start+")"+" where rownum<="+maxResults+"order by idx asc";
		}
		else 
		{
			sql ="select * from stu_info where rownum<="+maxResults+" order by idx asc";
		}
		try {
			pstat=conn.prepareStatement(sql);
			ResultSet rs =pstat.executeQuery();
			
			users = new ArrayList();
			
			while (rs.next())
			{
				long id = rs.getLong(1);
				String name = rs.getString(2);
				String sex = rs.getString(3);
				String bir = rs.getString(4);
				String class_ = rs.getString(5);
				String qq = rs.getString(6);
				String email = rs.getString(7);
				String tel = rs.getString(8);
				String address = rs.getString(9);
				String join_time = rs.getString(10);
				String lik = rs.getString(11);
				String info = rs.getString(12);
				
				User user = new User();    // 封装每条用户信息
				
				user.setIdx(id);
				user.setNam(name);
				user.setSex(sex);
				user.setBir(bir);
				user.setClass_(class_);
				user.setQq(qq);
				user.setEmail(email);
				user.setTel(tel);
				user.setJoin_time(join_time);
				user.setLik(lik);
				user.setInfo(info);
				user.setAddress(address);
				
				users.add(user);
			} 
			rs.close();
			pstat.close();
			conn.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return users;
	}
	
	/*
	 * 删除用户信息
	 */
	
	public void delete(int idx)
	{
		sql = "delete from stu_info where idx = "+idx;
		conn = GetConnection.getConnection();
		try 
		{
			pstat = conn.prepareStatement(sql);
			int rs = pstat.executeUpdate(); 
			pstat.close();
			conn.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}
	/**
	 * 得到符合条件学生的信息
	 */
	public List getInfo(String sql)
	{
		List users=null ;   // 封装每条用户信息
		conn= GetConnection.getConnection();
		try 
		{
			pstat = conn.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery();
			rs.next();
			
			users = new ArrayList();
			
			long id = rs.getLong(1);
			String name = rs.getString(2);
			String sex = rs.getString(3);
			String bir = rs.getString(4);
			String class_ = rs.getString(5);
			String qq = rs.getString(6);
			String email = rs.getString(7);
			String tel = rs.getString(8);
			String address = rs.getString(9);
			String join_time = rs.getString(10);
			String lik = rs.getString(11);
			String info = rs.getString(12);
			
			User user = new User();    // 封装每条用户信息
			
			user.setIdx(id);
			user.setNam(name);
			user.setSex(sex);
			user.setBir(bir);
			user.setClass_(class_);
			user.setQq(qq);
			user.setEmail(email);
			user.setTel(tel);
			user.setJoin_time(join_time);
			user.setLik(lik);
			user.setInfo(info);
			user.setAddress(address);
			
			users.add(user);
			rs.close();
			pstat.close();
			conn.close();
		} 
		catch 
		(SQLException e) 
		{
			e.printStackTrace();
		}
		return users;
	}
	/**
	 * 修改学生信息
	 */
	public void modi(User user)  
	{
		sql ="update stu_info set sex=?,bir=?,class_=?,qq=?,email=?,tel=?,address=?,lik=?,info=? where idx =?";
		conn = GetConnection.getConnection();
		try 
		{
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user.getSex());
			pstat.setString(2, user.getBir());
			pstat.setString(3, user.getClass_());
			pstat.setString(4, user.getQq());
			pstat.setString(5, user.getEmail());
			pstat.setString(6, user.getTel());
			pstat.setString(7, user.getAddress());
			pstat.setString(8, user.getLik());
			pstat.setString(9, user.getInfo());
			pstat.setLong(10, user.getIdx());
			pstat.executeUpdate(); 
			pstat.close();
			conn.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	
	public List getInfo1(pageBean page,String sql) 
	{
		
		List users = null; //存放所有用户信息
		
		conn= GetConnection.getConnection();
		
		try {
		
			pstat=conn.prepareStatement(sql);
			
			ResultSet rs =pstat.executeQuery();
			
			users = new ArrayList();
			
			while (rs.next())
			{
				long id = rs.getLong(1);
				String name = rs.getString(2);
				String sex = rs.getString(3);
				String bir = rs.getString(4);
				String class_ = rs.getString(5);
				String qq = rs.getString(6);
				String email = rs.getString(7);
				String tel = rs.getString(8);
				String address = rs.getString(9);
				String join_time = rs.getString(10);
				String lik = rs.getString(11);
				String info = rs.getString(12);
				
				User user = new User();    // 封装每条用户信息
				
				user.setIdx(id);
				user.setNam(name);
				user.setSex(sex);
				user.setBir(bir);
				user.setClass_(class_);
				user.setQq(qq);
				user.setEmail(email);
				user.setTel(tel);
				user.setJoin_time(join_time);
				user.setLik(lik);
				user.setInfo(info);
				user.setAddress(address);
				
				users.add(user);
			} 
			rs.close();
			pstat.close();
			conn.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return users;
	}
	public void addUser(addUserBean user) 
	{
		sql ="insert into admin values (?,?,?,?,?)";
		conn = GetConnection.getConnection();
		try 
		{
			pstat=conn.prepareStatement(sql);
			pstat.setString(1,user.getName());
			pstat.setString(2,user.getPwd());
			pstat.setInt(3,user.getAge());
			pstat.setString(4,user.getSex());
			pstat.setString(5,user.getAddress());
			
			pstat.executeUpdate();
			pstat.close();
			conn.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	public void updateinfoPic(long idx, String newFileName) throws ClassNotFoundException {
		String sql = "UPDATE stu_info SET info=? WHERE idx=?";
		conn = GetConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, newFileName);
			pstat.setLong(2, idx);
			pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
}

	
