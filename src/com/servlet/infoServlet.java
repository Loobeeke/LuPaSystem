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

import com.util.*;
import com.model.Food;
import com.model.Info;
import com.model.Info;
import com.service.InfoService;
import com.service.foodpageService;

/**
 * Servlet implementation class infoServlet
 */
@WebServlet("/Info")
public class infoServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	 protected void addInfo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	    	request.getRequestDispatcher("resetInfo.jsp").forward(request, response);
	    }
	protected void query(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			try {
				Integer pagesize=5;
				Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
				String tnumber = request.getParameter("tnumber");
				
				InfoService service = new InfoService();
				//调用分页工具类
				String pageTool = PageUtil.getPageTool(request, service.count(tnumber), cp, pagesize);
				
				request.setAttribute("infos", service.query(tnumber, cp, pagesize));
				request.setAttribute("pageTool", pageTool);
				request.getRequestDispatcher("info.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("mess", "查询失败，请稍后在试");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
			
		protected void add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			
			InfoService service = new InfoService();
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
				Info info = new Info();
				for(FileItem item:items){
					//判断是否是文件
					if(item.isFormField()){
						//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
						String name = item.getFieldName();
						String val = item.getString("utf-8");
						if(name.equals("tauthor")){
							info.setTauthor(val);
						}else if(name.equals("theading")){
							info.setTheading(val);
						}else if(name.equals("tcontent")){
							info.setTcontent(val);
						}else if(name.equals("tdate")){
							info.setTdate(val);
						}else if(name.equals("ttime")){
							info.setTtime(val);
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
						if(name.equals("tpicture")){
							info.setTpicture("/images/"+temp);
						}
						
					}
					
				}
				service.add(info);
				/*response.sendRedirect("Info?action=query");*/
				request.getRequestDispatcher("Info?action=query").forward(request, response);
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
		
		protected void travellist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			JdbcUtil jdbc = new JdbcUtil();
			try {
				String theading = request.getParameter("theading");
				InfoService service = new InfoService();
				List<Info> infos = service.travellist(theading);
				String info = JsonUtils.objectToJson(infos);
				response.getWriter().print(info);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("mess", "查询失败，请稍后在试");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
		//添加信息
		protected void addlist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			
			InfoService service = new InfoService();
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
				Info info = new Info();
				for(FileItem item:items){
					//判断是否是文件
					if(item.isFormField()){
						//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
						String name = item.getFieldName();
						String val = item.getString("utf-8");
						if(name.equals("tauthor")){
							info.setTauthor(val);
						}else if(name.equals("theading")){
							info.setTheading(val);
						}else if(name.equals("tcontent")){
							info.setTcontent(val);
						}else if(name.equals("tdate")){
							info.setTdate(val);
						}else if(name.equals("ttime")){
							info.setTtime(val);
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
						if(name.equals("tpicture")){
							info.setTpicture("/images/"+temp);
						}
						
					}
					
				}
				service.addlist(info);
				response.sendRedirect("travel-list.jsp");
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
		//在修改界面中展示数据
		protected void toupdate(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			String tnumber = request.getParameter("tnumber");
			String sql="select * from trvalinfo where tnumber =?";
			JdbcUtil jdbc = new JdbcUtil();
			List<Info> infos = jdbc.queryPreparedStatement(sql, Info.class, tnumber);
			String info = JsonUtils.objectToJson(infos.get(0));
			response.getWriter().print(info);
			
			
		}
		
		protected void updatelist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			
			InfoService service = new InfoService();
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
				Info info = new Info();
				for(FileItem item:items){
					//判断是否是文件
					if(item.isFormField()){
						//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
						String name = item.getFieldName();
						String val = item.getString("utf-8");
						if(name.equals("tnumber")){
							info.setTnumber(Integer.valueOf(val));
						}else if(name.equals("tauthor")){
							info.setTauthor(val);
						}else if(name.equals("theading")){
							info.setTheading(val);
						}else if(name.equals("tcontent")){
							info.setTcontent(val);
						}else if(name.equals("tdate")){
							info.setTdate(val);
						}else if(name.equals("ttime")){
							info.setTtime(val);
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
						if(name.equals("tpicture")){
							info.setTpicture("/images/"+temp);
						}
						
					}
					
				}
				service.updatelist(info);
				response.sendRedirect("travel-list.jsp");
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
			String tnumber = request.getParameter("tnumber");
			JdbcUtil jdbc = new JdbcUtil();
			String sql="delete from trvalinfo where tnumber=?";
			try {
				jdbc.updatePreparedStatement(sql,tnumber);
				response.sendRedirect("travel-list.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("mess", "删除失败，请稍后在试");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
		
		protected void querydetail(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			try {
				
				String tnumber = request.getParameter("tnumber");
				InfoService service = new InfoService();
				//调用分页工具类
				String str =JsonUtils.objectToJson(service.querydetail(tnumber).get(0));
				response.getWriter().print(str);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("mess", "查询失败，请稍后在试");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
}
