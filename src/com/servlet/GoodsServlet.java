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
import com.model.Info;
import com.service.DBGoodsImplement;
import com.service.InfoService;
import com.service.foodpageService;
import com.util.JdbcUtil;
import com.util.JsonUtils;
import com.util.PageUtil;

/**
 * Servlet implementation class GoodsServlet
 */
@WebServlet("/goods")
public class GoodsServlet extends BaseServlet {
	protected void query(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			Integer pagesize=8;
			Integer cp = Integer.parseInt(request.getParameter("cp")==null?"1":request.getParameter("cp"));
			String gtype = request.getParameter("gtype");
			
			DBGoodsImplement service = new DBGoodsImplement();
			//调用分页工具类
			String pageTool = PageUtil.getPageTool(request, service.count(gtype), cp, pagesize);
			
			request.setAttribute("goods", service.query(gtype, cp, pagesize));
			request.setAttribute("pageTool", pageTool);
			request.getRequestDispatcher("S_all.jsp").forward(request, response);
			//response.sendRedirect("all.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void goodslist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		try {
			JdbcUtil jdbc = new JdbcUtil();
			String sql="select * from goodsinfo";
			List<Goods> goods = jdbc.queryPreparedStatement(sql, Goods.class);
			
			String good = JsonUtils.objectToJson(goods);
			response.getWriter().print(good);
			//response.sendRedirect("food-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void addgoods(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		DBGoodsImplement service = new DBGoodsImplement();
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
			Goods goods = new Goods();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("gname")){
						goods.setGname(val);
					}else if(name.equals("gstore")){
						goods.setGstore(val);
					}else if(name.equals("gtype")){
						goods.setGtype(val);
					}else if(name.equals("gaddress")){
						goods.setGaddress(val);
					}else if(name.equals("gprice")){
						goods.setGprice(val);
					}else if(name.equals("gphone")){
						goods.setGphone(val);
					}else if(name.equals("gintroduce")){
						goods.setGintroduce(val);
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
					if(name.equals("gpicture")){
						goods.setGpicture("/images/"+temp);
					}
					
				}
				
			}
			service.addgoods(goods);
			response.sendRedirect("goods-list.jsp");
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
	
	protected void toupdategoods(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String gnumber = request.getParameter("gnumber");
		String sql="select * from goodsinfo where gnumber =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<Goods> goods = jdbc.queryPreparedStatement(sql, Goods.class, gnumber);
		String good = JsonUtils.objectToJson(goods.get(0));
		response.getWriter().print(good);
		
	}
	
	protected void updatelist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		DBGoodsImplement service = new DBGoodsImplement();
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
			Goods goods = new Goods();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("gnumber")){
						goods.setGnumber(Integer.valueOf(val));
					}else if(name.equals("gname")){
						goods.setGname(val);
					}else if(name.equals("gstore")){
						goods.setGstore(val);
					}else if(name.equals("gtype")){
						goods.setGtype(val);
					}else if(name.equals("gaddress")){
						goods.setGaddress(val);
					}else if(name.equals("gprice")){
						goods.setGprice(val);
					}else if(name.equals("gphone")){
						goods.setGphone(val);
					}else if(name.equals("gintroduce")){
						goods.setGintroduce(val);
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
					if(name.equals("gpicture")){
						goods.setGpicture("/images/"+temp);
					}
					
				}
				
			}
			service.updatelist(goods);
			response.sendRedirect("goods-list.jsp");
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
		String gnumber = request.getParameter("gnumber");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from goodsinfo where gnumber=?";
		try {
			jdbc.updatePreparedStatement(sql,gnumber);
			response.sendRedirect("goods-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
