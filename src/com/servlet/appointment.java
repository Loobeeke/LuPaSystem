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
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.model.appointmentinfo;
import com.service.appointmentService;
import com.util.JdbcUtil;

/**
 * Servlet implementation class appointment
 */
@WebServlet("/appointmentinfo")
public class appointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public appointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String atitle = request.getParameter("atitle");
		String aautor = request.getParameter("aautor");
		String acontent = request.getParameter("acontent");
		String astartaddress = request.getParameter("astartaddress");
		String aphone = request.getParameter("aphone");
		String aendaddress = request.getParameter("aendaddress");
		int aprice = Integer.parseInt(request.getParameter("aprice"));
		String atime = request.getParameter("atime");
		JdbcUtil jdbc = new JdbcUtil();
		String sql = "insert into appointmentinfo Values(null,?,?,?,?,?,?,?,?,?)";
		jdbc.updatePreparedStatement(sql, aautor,astartaddress,aendaddress,aphone,aprice,);*/
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
			request.getRequestDispatcher("yueban.jsp").forward(request, response);
			
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

		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
