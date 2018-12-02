package com.bean;

import java.util.List;

public class pageBean 
{
	private int nowPage = 1   ;  //当前页数  
	private int perPageRows = 8; // 每页显示结果条数
	
	private int allPages  ;      //总页数
	private long totalRows;     // 总条数
	
	private List result;         // 返回的结果集
	public int getAllPages() 
	{
		return allPages;
	}
	public void setAllPages(int allPages) 
	{
		this.allPages = allPages;
	}
	public int getNowPage() 
	{
		return nowPage;
	}
	public void setNowPage(int nowPage) 
	{
		this.nowPage = nowPage;
	}
	public int getPerPageRows() 
	{
		return perPageRows;
	}
	public void setPerPageRows(int perPageRows) 
	{
		this.perPageRows = perPageRows;
	}
	public long getTotalRows() 
	{
		return totalRows;
	}
	public void setTotalRows(long totalRows) 
	{
		this.totalRows = totalRows;
	}
	public List getResult() 
	{
		return result;
	}
	public void setResult(List results) 
	{
		this.result = results;
	}
}
