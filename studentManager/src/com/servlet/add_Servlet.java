package com.servlet;

import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.bean.User;
import com.DAO.*;

public class add_Servlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
	
	 public add_Servlet() {
	        super();
	    }
	 
	@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 1024);//1M
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(1024 * 1024 * 50);//50M
        upload.setHeaderEncoding("UTF-8");
        String fieldName=  null;
       // FileItem item=null;
        String values = null;
        try {
            DAO dao=new DAO();
            User user=new User();
            //解析request对象
            List<FileItem> list = upload.parseRequest(request);
            //while(iterator.hasNext()){
            for(FileItem item : list){
               // item = iterator.next();
                if(item.isFormField()){//判断是文件类型
                    out.println(item.getFieldName()+"="+item.getString("UTF-8")+"<br>");

                    fieldName = item.getFieldName();//得到表单中name的值
                    values = item.getString("UTF-8");//得到表单中value的值
                    /**
                                         * 根据表单控件名得到value的值并且插入到GoodsBean中
                     */
                    if(fieldName.equals("idx")) {
                    user.setIdx(new Long(values));}
                    else if(fieldName.equals("nam")) {
                    user.setNam(new String(values));}
                    else if(fieldName.equals("pwd")) {
                    user.setPwd(new String(values));}
                    else if(fieldName.equals("sex")) {
                    user.setSex(new String(values));}
                    else if(fieldName.equals("bir")) {
                    user.setBir(new String(values));}
                    else if(fieldName.equals("cla")) {
                    user.setClass_(new String(values));}
                    else if(fieldName.equals("qq")) {
                    user.setQq(new String(values));}
                    else if(fieldName.equals("email")) {
                    user.setEmail(new String(values));}
                    else if(fieldName.equals("tel")) {
                    user.setTel(new String(values));}
                    else if(fieldName.equals("address")) {
                    user.setAddress(new String(values));}
                    else if(fieldName.equals("join_time")) {
                    user.setJoin_time(new String(values));}
                    else if(fieldName.equals("lik")) {
                    user.setLik(new String(values));}

                } else {//上传路径
                    String path = "C:/JAVA/studentManager/WebContent/image";
                    String fileName = item.getName();//得到文件名
                    int xieGangIndex = fileName.lastIndexOf("\\") + 1;
                    fileName = fileName.substring(xieGangIndex);
                    System.out.println(path);
                    System.out.println(fileName);
                    user.setInfo(fileName);//把photo插入GoodsBean中
                    FileOutputStream outputStream = new FileOutputStream(path + "/"+fileName);//创建一个文件输出流对象
                    InputStream inputStream = item.getInputStream();//创建一个输入流
                    byte pool[] = new byte[1024];
                    int len = -1;
                    while((len = inputStream.read(pool, 0, pool.length)) != -1){
                        outputStream.write(pool, 0, len);
                    }
                    outputStream.flush();
                    outputStream.close();
                    inputStream.close();
                    //显示最新插入的图片
                    //out.println("<img src=\"C:/JAVA/studentManager/WebContent/image"+fileName+"\" alt=\""+fileName+"\" width=\"200px\" height=\"100px\"/><br/>");
                }
            }
            out.println("上传成功！");
            try {
				dao.add(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        } catch (FileUploadException e) {
            e.printStackTrace();
        }       
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		doPost(request,response);
	}
	public String getFineName() {
		Random random = new Random();
		String format = new SimpleDateFormat("yyyy_MM_dd_SSS").format(new Date());
		int a=random.nextInt(10);
		int b = random.nextInt(10);
		return format+a+b+"_";
	}
}
