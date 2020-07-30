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

import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.model.Food;
import com.model.Goods;
import com.service.DBGoodsImplement;
import com.service.foodpageService;
import com.util.Conversion;
import com.util.JdbcUtil;
import com.util.PageUtil;
import com.util.JsonUtils;
/**
 * Servlet implementation class foodpageServlet
 */
@WebServlet("/foodpage")
public class foodpageServlet extends BaseServlet {
	protected void query(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Integer pagesize=8;
			Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
			String ftype = request.getParameter("ftype");
			
			foodpageService service = new foodpageService();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.count(ftype), cp, pagesize);
			
			request.setAttribute("foods", service.query(ftype, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("all.jsp").forward(request, response);
			//response.sendRedirect("all.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/*protected void addFood(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	request.getRequestDispatcher("food-list.jsp").forward(request, response);
    }*/
    
	/*protected void update(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		foodpageService service = new foodpageService();
		try {
			Food food = new Food();
			Conversion.convert(food, request);
			service.update(food);
			response.sendRedirect("food-list.jsp");
			//查询数据库中学生列表 
			//response.sendRedirect("foodpage?action=query");
			//response.sendRedirect("index.jsp");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			request.setAttribute("mess", "修改失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}*/
	
	protected void toupdate(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String fnumber = request.getParameter("fnumber");
		String sql="select * from foodinfo where fnumber =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<Food> foods = jdbc.queryPreparedStatement(sql, Food.class, fnumber);
		String food = JsonUtils.objectToJson(foods.get(0));
		response.getWriter().print(food);
		
		//request.setAttribute("food", foods.get(0));
		//重定向 无法传送request
		//response.sendRedirect("food-edit.jsp");
		/*request.getRequestDispatcher("food-edit.jsp").forward(request, response);*/
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String fnumber = request.getParameter("fnumber");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from foodinfo where fnumber=?";
		try {
			jdbc.updatePreparedStatement(sql,fnumber);
			response.sendRedirect("food-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void addfood(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		foodpageService service = new foodpageService();
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
			Food food = new Food();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("fname")){
						food.setFname(val);
					}else if(name.equals("fstore")){
						food.setFstore(val);
					}else if(name.equals("ftype")){
						food.setFtype(val);
					}else if(name.equals("faddress")){
						food.setFaddress(val);
					}else if(name.equals("fprice")){
						food.setFprice(val);
					}else if(name.equals("fphone")){
						food.setFphone(val);
					}else if(name.equals("fintroduce")){
						food.setFintroduce(val);
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
					if(name.equals("fpicture")){
						food.setFpicture("/images/"+temp);
					}
					
				}
				
			}
			service.add(food);
			response.sendRedirect("food-list.jsp");
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
	protected void Blist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		JdbcUtil jdbc = new JdbcUtil();
		try {
			
			String sql="select * from foodinfo";
			List<Food> foods = jdbc.queryPreparedStatement(sql, Food.class);
			
			String food = JsonUtils.objectToJson(foods);
			response.getWriter().print(food);
			//response.sendRedirect("food-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void updatelist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		foodpageService service = new foodpageService();
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
			Food food = new Food();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("fnumber")){
						food.setFnumber(Integer.valueOf(val));
					}else if(name.equals("fname")){
						food.setFname(val);
					}else if(name.equals("fstore")){
						food.setFstore(val);
					}else if(name.equals("ftype")){
						food.setFtype(val);
					}else if(name.equals("faddress")){
						food.setFaddress(val);
					}else if(name.equals("fprice")){
						food.setFprice(val);
					}else if(name.equals("fphone")){
						food.setFphone(val);
					}else if(name.equals("fintroduce")){
						food.setFintroduce(val);
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
					if(name.equals("fpicture")){
						food.setFpicture("/images/"+temp);
					}
					
				}
				
			}
			service.updatelist(food);
			response.sendRedirect("food-list.jsp");
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

}
