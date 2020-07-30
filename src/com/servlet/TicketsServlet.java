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

import com.model.Food;
import com.model.Info;
import com.model.Tickets;
import com.service.InfoService;
import com.service.TicketsService;
import com.util.Conversion;
import com.util.JdbcUtil;
import com.util.JsonUtils;
import com.util.PageUtil;

/**
 * Servlet implementation class TicketsServlet
 */
@WebServlet("/Tickets")
public class TicketsServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void addTickets(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	request.getRequestDispatcher("tickets.jsp").forward(request, response);
    }
   
	protected void query(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Integer pagesize=8;
			Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
			String id = request.getParameter("id");
			
			TicketsService service = new TicketsService();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.count(id), cp, pagesize);
			
			request.setAttribute("tickets", service.query(id, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("tickets.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	protected void queryname(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Integer pagesize=8;
			Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
			String name = request.getParameter("name");
			
			TicketsService service = new TicketsService();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.countname(name), cp, pagesize);
			
			request.setAttribute("tickets", service.queryname(name, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("tickets.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void queryId(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			
			String id = request.getParameter("id");
			TicketsService service = new TicketsService();
			//request.setAttribute("tickets", service.queryId(id));
			//request.getRequestDispatcher("tickets.jsp").forward(request, response);
			String str =JsonUtils.objectToJson(service.queryId(id).get(0));
			response.getWriter().print(str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
		
	protected void add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Tickets tickets = new Tickets();
			Conversion.convert(tickets, request);
			TicketsService service = new TicketsService();
			service.add(tickets);
			//查询数据库中资讯列表 
			response.sendRedirect("Tickets?action=query");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "发布失败，请检查！！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void ticketslist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		JdbcUtil jdbc = new JdbcUtil();
		try {
			String sql="select * from tickets";
			List<Tickets> tickets = jdbc.queryPreparedStatement(sql, Tickets.class);
			
			String ticket = JsonUtils.objectToJson(tickets);
			response.getWriter().print(ticket);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void addtickets(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		TicketsService service = new TicketsService();
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
			Tickets tickets = new Tickets();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("name")){
						tickets.setName(val);
					}else if(name.equals("detail")){
						tickets.setDetail(val);
					}else if(name.equals("price")){
						tickets.setPrice(val);
					}else if(name.equals("oldprice")){
						tickets.setOldprice(val);
					}else if(name.equals("stock")){
						tickets.setStock(val);
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
					if(name.equals("picture")){
						tickets.setPicture("/images/"+temp);
					}
					
				}
				
			}
			service.addtickets(tickets);
			response.sendRedirect("ticket-list.jsp");
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
		String id = request.getParameter("id");
		String sql="select * from tickets where id =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<Tickets> tickets = jdbc.queryPreparedStatement(sql, Tickets.class, id);
		String ticket = JsonUtils.objectToJson(tickets.get(0));
		response.getWriter().print(ticket);
		
	}
	
	protected void updatetickets(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		TicketsService service = new TicketsService();
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
			Tickets tickets = new Tickets();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("id")){
						tickets.setId(Integer.valueOf(val));
					}else if(name.equals("name")){
						tickets.setName(val);
					}else if(name.equals("detail")){
						tickets.setDetail(val);
					}else if(name.equals("price")){
						tickets.setPrice(val);
					}else if(name.equals("oldprice")){
						tickets.setOldprice(val);
					}else if(name.equals("stock")){
						tickets.setStock(val);
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
					if(name.equals("picture")){
						tickets.setPicture("/images/"+temp);
					}
					
				}
				
			}
			service.updatetickets(tickets);
			response.sendRedirect("ticket-list.jsp");
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
		String id = request.getParameter("id");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from tickets where id=?";
		try {
			jdbc.updatePreparedStatement(sql,id);
			response.sendRedirect("ticket-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
