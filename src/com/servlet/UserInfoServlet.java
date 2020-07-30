package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Manager;
import com.model.UserInfo;
import com.service.userinfoService;
import com.util.Conversion;
import com.util.JdbcUtil;
import com.util.JsonUtils;

/**
 * Servlet implementation class UserInfoServlet
 */
@WebServlet("/userinfo")
public class UserInfoServlet extends BaseServlet {
	
	protected void userinfolist(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		JdbcUtil jdbc = new JdbcUtil();
		try {
			String sql="select * from userinfo";
			List<UserInfo> userinfos = jdbc.queryPreparedStatement(sql, UserInfo.class);
			
			String userinfo = JsonUtils.objectToJson(userinfos);
			response.getWriter().print(userinfo);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "查询失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			UserInfo userinfo = new UserInfo();
			Conversion.convert(userinfo, request);
			userinfoService service = new userinfoService();
			service.adduserinfo(userinfo);
			//查询数据库中学生列表 
			response.sendRedirect("index1.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "新增学生失败，请检查录入学号是否重复！！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void adduserinfo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		try {
			UserInfo userinfo = new UserInfo();
			Conversion.convert(userinfo, request);
			userinfoService service = new userinfoService();
			service.adduserinfo(userinfo);
			//查询数据库中学生列表 
			response.sendRedirect("personal-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "新增学生失败，请检查录入学号是否重复！！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void toupdate(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String uphone = request.getParameter("uphone");
		String sql="select * from userinfo where uphone =?";
		JdbcUtil jdbc = new JdbcUtil();
		List<UserInfo> userinfos = jdbc.queryPreparedStatement(sql, UserInfo.class, uphone);
		String userinfo = JsonUtils.objectToJson(userinfos.get(0));
		response.getWriter().print(userinfo);
		
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		userinfoService service = new userinfoService();
		try {
			UserInfo userinfo = new UserInfo();
			Conversion.convert(userinfo, request);
			service.update(userinfo);
			response.sendRedirect("personal-list.jsp");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			request.setAttribute("mess", "修改失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String uphone = request.getParameter("uphone");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="delete from userinfo where uphone=?";
		try {
			jdbc.updatePreparedStatement(sql,uphone);
			response.sendRedirect("personal-list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("mess", "删除失败，请稍后在试");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}


}
