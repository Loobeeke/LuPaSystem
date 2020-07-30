package com.Dao;

import java.util.List;

import com.model.Food;
import com.model.appointmentinfo;
import com.util.JdbcUtil;

public class appointDao {
	JdbcUtil jdbc = new JdbcUtil();
	
	public List<appointmentinfo> query(String atitle,Integer start,Integer limit) {
		
		//******最内层sql******//
		StringBuffer sql = new StringBuffer();
		sql.append("select * from appointmentinfo where 1=1 ");
		if(atitle!=null && !atitle.equals("") ){
			sql.append(" and atitle like '%"+atitle+"%'");
		}
		sql.append("limit "+((start-1)*limit)+","+limit);
		
		List<appointmentinfo> appoints = jdbc.queryPreparedStatement(sql.toString(), appointmentinfo.class);
		/*String sql = "select * from foodinfo";
		List<Food> foods = jdbc.queryPreparedStatement(sql, Food.class);*/
		jdbc.close();
		return appoints;
	}
	
	//查询总条数
	public int count(String atitle){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from appointmentinfo where 1=1 ");
		if(atitle!=null && !atitle.equals("")){
			sql.append(" and atitle like '%"+atitle+"%'");
		}
		sql.append("order by akid asc");
		List<appointmentinfo> temp = jdbc.queryPreparedStatement(sql.toString(), appointmentinfo.class);
		jdbc.close();
		return temp.size();
	}
	
	public void add(appointmentinfo appoint) throws Exception {
		String sql = "insert into appointmentinfo(akid,aautor,astartaddress,aendaddress,aphone,aprice,atitle,acontent,atime,apicture) Values(null,?,?,?,?,?,?,?,?,?)";
		jdbc.updatePreparedStatement(sql, appoint.getAautor(),appoint.getAstartaddress(),appoint.getAendaddress(),
				appoint.getAphone(),appoint.getAprice(),appoint.getAtitle(),appoint.getAcontent(),appoint.getAtime(),appoint.getApicture());
		jdbc.close();
	}
	/*public void selectall(){
		String sql = "select * from appointmentinfo";
		jdbc.queryPreparedStatement(sql, appo, params)
	}*/
	
	public void updateappoint(appointmentinfo appoint) throws Exception{
		String sql="update appointmentinfo set aautor = ?,astartaddress = ?,aendaddress = ?,aphone = ?,aprice = ?,atitle = ?,acontent= ?,atime =?,apicture= ? where akid = ?";
		jdbc.updatePreparedStatement(sql,appoint.getAautor(),appoint.getAstartaddress(),appoint.getAendaddress(),appoint.getAphone(),appoint.getAprice(),
				appoint.getAtitle(),appoint.getAcontent(),appoint.getAtime(),appoint.getApicture(),appoint.getAkid());
		jdbc.close();
	}
}
