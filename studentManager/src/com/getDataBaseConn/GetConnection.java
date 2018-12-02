package com.getDataBaseConn;

import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

/**
 * 获得数据库连接的工具类
 *
 */

public class GetConnection {
	public static Connection getConnection(){
		
		//注册驱动
		//获得连接
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","159357");
			System.out.println("成功");
		} catch (ClassNotFoundException e) {
			  
			e.printStackTrace();
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return con;
	}
	
}
	