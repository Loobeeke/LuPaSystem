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

import com.model.Food;
import com.model.Goods;
import com.model.Hotel;
import com.model.Info;
import com.model.Manager;
import com.model.Tickets;
import com.model.appointmentinfo;
import com.service.ManagerService;
import com.service.appointmentService;
import com.util.JdbcUtil;
import com.util.JsonUtils;

/**
 * Servlet implementation class ManagerServlet
 */
@WebServlet("/manager")
public class ManagerServlet extends BaseServlet {
	
    public ManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mname = request.getParameter("mname");
		String mpassword = request.getParameter("mpassword");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="select * from manager where mname=? and mpassword=?";
		List<Manager> managers = jdbc.queryPreparedStatement(sql, Manager.class, mname,mpassword);
		if(managers.size()>0){
			
			HttpSession session = request.getSession();
			session.setAttribute("manager", managers.get(0));
			
			//查询旅游资讯
			sql="select * from trvalinfo";
			List<Info> infos = jdbc.queryPreparedStatement(sql, Info.class);
			int infocount = infos.size();
			session.setAttribute("infocount", infocount);
			//request.getRequestDispatcher("Info?action=query").forward(request, response);
			//查询门票总记录
			sql="select * from tickets";
			List<Tickets> tickets = jdbc.queryPreparedStatement(sql, Tickets.class);
			int ticketcount = tickets.size();
			session.setAttribute("ticketcount", ticketcount);
			//request.getRequestDispatcher("Tickets?action=query").forward(request, response);
			//查询酒店信息记录
			sql="select * from hotelinfo";
			List<Hotel> hotels = jdbc.queryPreparedStatement(sql, Hotel.class);
			int hotelcount = hotels.size();
			session.setAttribute("hotelcount", hotelcount);
			//查询美食记录
			sql="select * from foodinfo";
			List<Food> foods = jdbc.queryPreparedStatement(sql, Food.class);
			int foodcount = foods.size();
			session.setAttribute("foodcount", foodcount);
			//查询商品记录
			sql="select * from goodsinfo";
			List<Goods> goods = jdbc.queryPreparedStatement(sql, Goods.class);
			int goodcount = goods.size();
			session.setAttribute("goodcount", goodcount);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			//response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("mess", "用户名或密码不正确");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
	/*protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mname = request.getParameter("mname1");
		String mpassword = request.getParameter("mpassword");
		String mpassword1 = request.getParameter("mpassword1");
		if(mpassword.equals(mpassword1)){
			JdbcUtil jdbc = new JdbcUtil();
			String sql="insert into manager(mid,mname,mpassword) values (null,?,?)";
			jdbc.updatePreparedStatement(sql,mname,mpassword);
			request.getRequestDispatcher("demo.jsp").forward(request, response);
		}else{
			request.setAttribute("mess", "密码不一致，请重新输入密码！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}*/
    
    protected void managerlist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		JdbcUtil jdbc = new JdbcUtil();
		try {
			String sql="select * from manager";
			List<Manager> managers = jdbc.queryPreparedStatement(sql, Manager.class);
			
			String manager = JsonUtils.objectToJson(managers);
			response.getWriter().print(manager);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    
    protected void addmanager(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		ManagerService service = new ManagerService();
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
			Manager manager = new Manager();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("mname")){
						manager.setMname(val);;
					}else if(name.equals("mpassword")){
						manager.setMpassword(val);
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
					if(name.equals("mpicture")){
						manager.setMpicture("/images/"+temp);
						
					}
					
				}
				
			}
			service.add(manager);
			request.getRequestDispatcher("manager-list.jsp").forward(request, response);
			
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
		String mid = request.getParameter("mid");
		String sql="select * from manager where mid =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<Manager> managers = jdbc.queryPreparedStatement(sql, Manager.class, mid);
		String manager = JsonUtils.objectToJson(managers.get(0));
		response.getWriter().print(manager);
		
	}
    
    protected void updatemanager(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		ManagerService service = new ManagerService();
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
			Manager manager = new Manager();
			for(FileItem item:items){
				//判断是否是文件
				if(item.isFormField()){
					//5、普通表单字段，则调用getFieldName、getString方法得到字段名和字段值
					String name = item.getFieldName();
					String val = item.getString("utf-8");
					if(name.equals("mid")){
						manager.setMid(Integer.valueOf(val));
					}else if(name.equals("mname")){
						manager.setMname(val);;
					}else if(name.equals("mpassword")){
						manager.setMpassword(val);
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
					if(name.equals("mpicture")){
						manager.setMpicture("/images/"+temp);
					}
					
				}
				
			}
			service.updatemanager(manager);
			request.getRequestDispatcher("manager-list.jsp").forward(request, response);
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
		String mid = request.getParameter("mid");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from manager where mid=?";
		try {
			jdbc.updatePreparedStatement(sql,mid);
			response.sendRedirect("manager-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
