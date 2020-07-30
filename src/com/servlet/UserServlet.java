package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Info;
import com.model.User;
import com.util.JdbcUtil;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends BaseServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/*protected void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("user");
		response.sendRedirect("login.jsp");
	}*/
	
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="select * from userlogin where username=? and password=?";
		List<User> users = jdbc.queryPreparedStatement(sql, User.class, username,password);
		if(users.size()>0){
			
			HttpSession session = request.getSession();
			session.setAttribute("user", users.get(0));
			
			request.getRequestDispatcher("index1.jsp").forward(request, response);
			//response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("mess", "用户名或密码不正确");
			request.getRequestDispatcher("login1.jsp").forward(request, response);
		}
	}
	
	protected void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate(); //销毁session
		response.sendRedirect("login1.jsp");
		
	}
	
	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username1");
		String password = request.getParameter("password1");
		String password1 = request.getParameter("password2");
		if(password.equals(password1)){
			JdbcUtil jdbc = new JdbcUtil();
			String sql="insert into userlogin(id,username,password) values (null,?,?)";
			jdbc.updatePreparedStatement(sql,username,password);
			request.getRequestDispatcher("login1.jsp").forward(request, response);
		}else{
			request.setAttribute("mess", "注册失败请，重新注册！");
			request.getRequestDispatcher("login1.jsp").forward(request, response);
		}
	}
	
	protected void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username1");
		JdbcUtil jdbc = new JdbcUtil();
		String sql="select * from userlogin where username=?";
		List<User> users = jdbc.queryPreparedStatement(sql, User.class, username);
		if(users.size()>0){
			response.getWriter().write("0");
		}else{
			response.getWriter().write("1");
		}
	}


}
