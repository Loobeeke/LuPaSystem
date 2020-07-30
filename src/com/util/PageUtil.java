package com.util;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

/**
 * 分页工具类
 */
public class PageUtil {
	
	/**
	 * 获取分页代码
	 * @param count 总记录数
	 * @param cp 当前页面
	 * @param pagesize 每页数量
	 * @return
	 */
	public static String getPageTool(HttpServletRequest request, long count, int cp, int pagesize){
		//计算总页数
		long total = count % pagesize ==0 ? count/pagesize : count /pagesize + 1;
		total = total==0 ? 1 : total;
	
		String url = request.getRequestURL().toString();
		
		StringBuilder queryString = new StringBuilder();
		Enumeration<String> enumeration = request.getParameterNames();
		
		try { // 拼装请求参数
			while (enumeration.hasMoreElements()) {
				String element = (String) enumeration.nextElement();
				if(!element.equals("cp")) { // 跳过cp参数
					queryString.append("&").append(element).append("=").append(URLEncoder.encode(request.getParameter(element),"UTF-8"));
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 拼装分页代码
		StringBuilder buf = new StringBuilder();
		buf.append("<div style='text-align:center;'>\n");
		if (cp <= 1) {
			buf.append("<a class='btn btn-info' disabled >首页</a>\n");
		}else{
			buf.append("<a class='btn btn-info' href='").append(url).append("?cp=").append(1).append(queryString).append("'>首页</a>\n");
		}
		if (cp <= 1) {
			buf.append("<a class='btn btn-info' disabled >上一页</a>\n");
		}else {
			buf.append("<a class='btn btn-info' href='").append(url).append("?cp=").append(cp-1).append(queryString).append("'>上一页</a>\n");
		}
		buf.append("<h2 style='display:inline;'>[").append(cp).append("/").append(total).append("]</h2>\n");
		buf.append("<h2 style='display:inline;'>[").append(count).append("]</h2>\n");
		if (cp >= total) {
			buf.append("<a class='btn btn-info' disabled >下一页</a>\n");
		}else {
			buf.append("<a class='btn btn-info' href='").append(url).append("?cp=").append(cp+1).append(queryString).append("'>下一页</a>\n");
		}
		if (cp >= total) {
			buf.append("<a class='btn btn-info' disabled >尾页</a>\n");
		}else {
			buf.append("<a class='btn btn-info' href='").append(url).append("?cp=").append(total).append(queryString).append("'>尾页</a>\n");
		}
		buf.append("<input type='text' class='form-control' style='display:inline;width:60px;' value=''/>");
		buf.append("<a class='btn btn-info' href='javascript:void(0);' onclick='location.href=\"").append(url).append("?cp=").append("\"+(this.previousElementSibling.value)+\"").append(queryString).append("\"'>GO</a>\n");
		buf.append("</div>\n");
		return buf.toString();
	}

}