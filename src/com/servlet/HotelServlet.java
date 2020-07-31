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
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.model.Goods;
import com.model.Hotel;
import com.model.Tickets;
import com.service.HotelService;
import com.service.TicketsService;
import com.util.JdbcUtil;
import com.util.JsonUtils;
import com.util.PageUtil;

/**
 * Servlet implementation class HotelServlet
 */
@WebServlet("/Hotel")
public class HotelServlet extends BaseServlet {
	
	protected void hotellist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		JdbcUtil jdbc = new JdbcUtil();
		try {
			String sql="select * from hotelinfo";
			List<Hotel> hotels = jdbc.queryPreparedStatement(sql, Hotel.class);
			
			String hotel = JsonUtils.objectToJson(hotels);
			response.getWriter().print(hotel);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void addhotel(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		HotelService service = new HotelService();
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
			Hotel hotel = new Hotel();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("hname")){
						hotel.setHname(val);
					}else if(name.equals("hdetail")){
						hotel.setHdetail(val);
					}else if(name.equals("hprice")){
						hotel.setHprice(val);
					}else if(name.equals("haddress")){
						hotel.setHaddress(val);
					}else if(name.equals("htype")){
						hotel.setHtype(val);
					}else if(name.equals("hphone")){
						hotel.setHphone(val);
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
					if(name.equals("hpicture")){
						hotel.setHpicture("/images/"+temp);
					}
					
				}
				
			}
			service.addhotel(hotel);
			response.sendRedirect("hotel-list.jsp");
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
		String hnumber = request.getParameter("hnumber");
		String sql="select * from hotelinfo where hnumber =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<Hotel> hotels = jdbc.queryPreparedStatement(sql, Hotel.class, hnumber);
		String hotel = JsonUtils.objectToJson(hotels.get(0));
		response.getWriter().print(hotel);
		
	}
	
protected void updatehotel(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		HotelService service = new HotelService();
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
			Hotel hotel = new Hotel();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("hnumber")){
						hotel.setHnumber(Integer.valueOf(val));
					}else if(name.equals("hname")){
						hotel.setHname(val);
					}else if(name.equals("hdetail")){
						hotel.setHdetail(val);
					}else if(name.equals("hprice")){
						hotel.setHprice(val);
					}else if(name.equals("haddress")){
						hotel.setHaddress(val);
					}else if(name.equals("htype")){
						hotel.setHtype(val);
					}else if(name.equals("hphone")){
						hotel.setHphone(val);
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
					if(name.equals("hpicture")){
						hotel.setHpicture("/images/"+temp);
					}
					
				}
				
			}
			service.updatehotel(hotel);
			response.sendRedirect("hotel-list.jsp");
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
		String hnumber = request.getParameter("hnumber");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from hotelinfo where hnumber=?";
		try {
			jdbc.updatePreparedStatement(sql,hnumber);
			response.sendRedirect("hotel-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void query(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Integer pagesize=100;
			Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
			String huumber = request.getParameter("huumber");
			
			HotelService service = new HotelService();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.count(huumber), cp, pagesize);
			
			request.setAttribute("hotels", service.query(huumber, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("hotel2.jsp").forward(request, response);
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
			String hname = request.getParameter("hname");
			
			HotelService service = new HotelService();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.countname(hname), cp, pagesize);
			
			request.setAttribute("hotels", service.queryname(hname, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("hotel2.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void queryId(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			
			String hnumber = request.getParameter("hnumber");
			HotelService service = new HotelService();
			String str =JsonUtils.objectToJson(service.queryId(hnumber));
			response.getWriter().print(str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void querydetail(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			
			String hnumber = request.getParameter("hnumber");
			HotelService service = new HotelService();
			//调用分页工具类
			String str =JsonUtils.objectToJson(service.querydetail(hnumber).get(0));
			response.getWriter().print(str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	
	

	
}
