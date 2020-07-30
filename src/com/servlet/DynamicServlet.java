package com.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.model.Dynamic;
import com.model.Info;
import com.service.DynamicService;
import com.service.InfoService;
import com.util.JdbcUtil;
import com.util.JsonUtils;
import com.util.PageUtil;

/**
 * Servlet implementation class DynamicServlet
 */
@WebServlet("/Dynamic")
public class DynamicServlet extends BaseServlet {
	
	protected void query(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Integer pagesize=5;
			Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
			String dnumber = request.getParameter("dnumber");
			
			DynamicService service = new DynamicService();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.count(dnumber), cp, pagesize);
			
			request.setAttribute("dynamic", service.query(dnumber, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("dynamic.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		DynamicService service = new DynamicService();
		InputStream in = null;
		FileOutputStream fos = null;
		try {
			//1、创建解析工厂DiskFileItemFactory对象
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//2、使用DiskFileItemFactory 对象创建ServletFileUpload对象。
			ServletFileUpload upload = new ServletFileUpload(factory);
			//3、调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
			List<FileItem> items = upload.parseRequest(request);
			//4、对list进行迭代，每迭代一个FileItem对象，调用其isFormField方法判断是否为附件
			Dynamic dynamic = new Dynamic();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("dnumber")){
						dynamic.setDnumber(Integer.valueOf(val));
					}else if(name.equals("dautor")){
						dynamic.setDautor(val);
					}else if(name.equals("dtitle")){
						dynamic.setDtitle(val);
					}else if(name.equals("dcontent")){
						dynamic.setDcontent(val);
					}else if(name.equals("ddate")){
						dynamic.setDdate(val);
					}else if(name.equals("dtime")){
						dynamic.setDtime(val);
					}
					
				}else{
					//6、文件，则调用getInputStream方法得到数据输入流，从而读取上传数据。
					in = item.getInputStream();
					//获取文件名
					String filename = item.getName();
					//face.jpg       new Date().getTime()+5位的随机数.jpg   121321243243.jpg
					String subfix = filename.substring(filename.indexOf("."));
					
					String temp = new Date().getTime()+subfix;
					fos = new FileOutputStream("D:/upload/"+temp);
					byte[] b = new byte[1024];
					int len=-1;
					while((len=in.read(b))!=-1){
						fos.write(b, 0, len);
					}
					String name = item.getFieldName();
					if(name.equals("dpicture")){
						dynamic.setDpicture("/images/"+temp);
					}
					
				}
				
			}
			service.add(dynamic);
			/*response.sendRedirect("Info?action=query");*/
			request.getRequestDispatcher("Dynamic?action=query").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(in!=null){
				in.close();
			}
			if(fos!=null){
				fos.close();
			}
			
		}
	}
	
	protected void dynamiclist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		JdbcUtil jdbc = new JdbcUtil();
		try {
			
			String sql="select * from dynamicinfo";
			List<Dynamic> dynamics = jdbc.queryPreparedStatement(sql, Dynamic.class);
			
			String dynamic = JsonUtils.objectToJson(dynamics);
			response.getWriter().print(dynamic);
			//response.sendRedirect("food-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void addlist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		DynamicService service = new DynamicService();
		InputStream in = null;
		FileOutputStream fos = null;
		try {
			//1、创建解析工厂DiskFileItemFactory对象
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//2、使用DiskFileItemFactory 对象创建ServletFileUpload对象。
			ServletFileUpload upload = new ServletFileUpload(factory);
			//3、调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
			List<FileItem> items = upload.parseRequest(request);
			//4、对list进行迭代，每迭代一个FileItem对象，调用其isFormField方法判断是否为附件
			Dynamic dynamic = new Dynamic();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("dautor")){
						dynamic.setDautor(val);
					}else if(name.equals("dtitle")){
						dynamic.setDtitle(val);
					}else if(name.equals("dcontent")){
						dynamic.setDcontent(val);
					}else if(name.equals("ddate")){
						dynamic.setDdate(val);
					}else if(name.equals("dtime")){
						dynamic.setDtime(val);
					}
					
				}else{
					//6、文件，则调用getInputStream方法得到数据输入流，从而读取上传数据。
					in = item.getInputStream();
					//获取文件名
					String filename = item.getName();
					//face.jpg       new Date().getTime()+5位的随机数.jpg   121321243243.jpg
					String subfix = filename.substring(filename.indexOf("."));
					
					String temp = new Date().getTime()+subfix;
					fos = new FileOutputStream("D:/upload/"+temp);
					byte[] b = new byte[1024];
					int len=-1;
					while((len=in.read(b))!=-1){
						fos.write(b, 0, len);
					}
					String name = item.getFieldName();
					if(name.equals("dpicture")){
						dynamic.setDpicture("/images/"+temp);
					}
					
				}
				
			}
			service.addlist(dynamic);
			response.sendRedirect("dynamic-list.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(in!=null){
				in.close();
			}
			if(fos!=null){
				fos.close();
			}
			
		}
	}
	
	protected void toupdate(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String dnumber = request.getParameter("dnumber");
		String sql="select * from dynamicinfo where dnumber =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<Dynamic> dynamics = jdbc.queryPreparedStatement(sql, Dynamic.class, dnumber);
		String dynamic = JsonUtils.objectToJson(dynamics.get(0));
		response.getWriter().print(dynamic);
		
		
	}
	
	protected void updatelist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		DynamicService service = new DynamicService();
		InputStream in = null;
		FileOutputStream fos = null;
		try {
			//1、创建解析工厂DiskFileItemFactory对象
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//2、使用DiskFileItemFactory 对象创建ServletFileUpload对象。
			ServletFileUpload upload = new ServletFileUpload(factory);
			//3、调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
			List<FileItem> items = upload.parseRequest(request);
			//4、对list进行迭代，每迭代一个FileItem对象，调用其isFormField方法判断是否为附件
			Dynamic dynamic = new Dynamic();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("dnumber")){
						dynamic.setDnumber(Integer.valueOf(val));
					}else if(name.equals("dautor")){
						dynamic.setDautor(val);
					}else if(name.equals("dtitle")){
						dynamic.setDtitle(val);
					}else if(name.equals("dcontent")){
						dynamic.setDcontent(val);
					}else if(name.equals("ddate")){
						dynamic.setDdate(val);
					}else if(name.equals("dtime")){
						dynamic.setDtime(val);
					}
					
				}else{
					//6、文件，则调用getInputStream方法得到数据输入流，从而读取上传数据。
					in = item.getInputStream();
					//获取文件名
					String filename = item.getName();
					//face.jpg       new Date().getTime()+5位的随机数.jpg   121321243243.jpg
					String subfix = filename.substring(filename.indexOf("."));
					
					String temp = new Date().getTime()+subfix;
					fos = new FileOutputStream("D:/upload/"+temp);
					byte[] b = new byte[1024];
					int len=-1;
					while((len=in.read(b))!=-1){
						fos.write(b, 0, len);
					}
					String name = item.getFieldName();
					if(name.equals("dpicture")){
						dynamic.setDpicture("/images/"+temp);
					}
					
				}
				
			}
			service.updatelist(dynamic);
			response.sendRedirect("dynamic-list.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(in!=null){
				in.close();
			}
			if(fos!=null){
				fos.close();
			}
			
		}
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String dnumber = request.getParameter("dnumber");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from dynamicinfo where dnumber=?";
		try {
			jdbc.updatePreparedStatement(sql,dnumber);
			response.sendRedirect("dynamic-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
}
