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
import com.model.Goods;
import com.model.appointmentinfo;
import com.service.DBGoodsImplement;
import com.service.appointmentService;
import com.service.foodpageService;
import com.util.JdbcUtil;
import com.util.JsonUtils;
import com.util.PageUtil;

/**
 * Servlet implementation class appointmentServlet
 */
@WebServlet("/appointment")
public class appointmentServlet extends BaseServlet {
	
	protected void query(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Integer pagesize=8;
			Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
			String atitle = request.getParameter("atitle");
			
			appointmentService service = new appointmentService();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.count(atitle), cp, pagesize);
			
			request.setAttribute("appoints", service.query(atitle, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("yueban.jsp").forward(request, response);
			//response.sendRedirect("all.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void addappoint(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		appointmentService service = new appointmentService();
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
			appointmentinfo appoint = new appointmentinfo();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("atitle")){
						appoint.setAtitle(val);;
					}else if(name.equals("acontent")){
						appoint.setAcontent(val);
					}else if(name.equals("astartaddress")){
						appoint.setAstartaddress(val);
					}else if(name.equals("aendaddress")){
						appoint.setAendaddress(val);
					}else if(name.equals("aprice")){
						appoint.setAprice(val);
					}else if(name.equals("atime")){
						appoint.setAtime(val);
					}else if(name.equals("aphone")){
						appoint.setAphone(val);
					}else if(name.equals("aautor")){
						appoint.setAautor(val);
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
					if(name.equals("apicture")){
						appoint.setApicture("/images/"+temp);
						
					}
					
				}
				
			}
			service.add(appoint);
			response.getWriter().write("1");
			/*request.getRequestDispatcher("appoint-list.jsp").forward(request, response);*/
			
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
	
	protected void appointlist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		try {
			JdbcUtil jdbc = new JdbcUtil();
			String sql="select * from appointmentinfo";
			List<appointmentinfo> appoints = jdbc.queryPreparedStatement(sql, appointmentinfo.class);
			
			String appoint = JsonUtils.objectToJson(appoints);
			response.getWriter().print(appoint);
			//response.sendRedirect("food-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void toupdateappoint(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String akid = request.getParameter("akid");
		String sql="select * from appointmentinfo where akid =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<appointmentinfo> appointment = jdbc.queryPreparedStatement(sql, appointmentinfo.class, akid);
		String appoint = JsonUtils.objectToJson(appointment.get(0));
		response.getWriter().print(appoint);
		
	}
	
	protected void updateappoint(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		appointmentService service = new appointmentService();
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
			appointmentinfo appointment = new appointmentinfo();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("akid")){
						appointment.setAkid(Integer.valueOf(val));
					}else if(name.equals("aautor")){
						appointment.setAautor(val);
					}else if(name.equals("astartaddress")){
						appointment.setAstartaddress(val);
					}else if(name.equals("aendaddress")){
						appointment.setAendaddress(val);
					}else if(name.equals("aphone")){
						appointment.setAphone(val);
					}else if(name.equals("aprice")){
						appointment.setAprice(val);
					}else if(name.equals("atitle")){
						appointment.setAtitle(val);
					}else if(name.equals("acontent")){
						appointment.setAcontent(val);
					}else if(name.equals("atime")){
						appointment.setAtime(val);
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
					if(name.equals("apicture")){
						appointment.setApicture("/images/"+temp);
					}
					
				}
				
			}
			service.updateappoint(appointment);
			response.sendRedirect("appoint-list.jsp");
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
		String akid = request.getParameter("akid");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from appointmentinfo where akid=?";
		try {
			jdbc.updatePreparedStatement(sql,akid);
			response.sendRedirect("appoint-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
}
