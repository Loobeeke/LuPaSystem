package com.Dao;

import java.util.List;

import com.model.Dynamic;
import com.model.Info;
import com.util.JdbcUtil;

public class DynamicDao {
	JdbcUtil jdbc = new JdbcUtil();
	public void addlist(Dynamic dynamic) throws Exception{
		String sql="insert into dynamicinfo(dnumber, dautor, dtitle, dcontent, ddate, dtime, dpicture) values (null, ?, ?, ?, ?, ?, ?)";
		jdbc.updatePreparedStatement(sql,dynamic.getDautor(),dynamic.getDtitle(),dynamic.getDcontent(),dynamic.getDdate(),
				dynamic.getDtime(),dynamic.getDpicture());
		jdbc.close();
	}
	
	public void updatelist(Dynamic dynamic) throws Exception{
		String sql="update dynamicinfo set dautor = ?,dtitle = ?,dcontent = ?,ddate = ?,dtime = ?,dpicture = ? where dnumber = ?";
		jdbc.updatePreparedStatement(sql,dynamic.getDautor(),dynamic.getDtitle(),dynamic.getDcontent(),dynamic.getDdate(),
				dynamic.getDtime(),dynamic.getDpicture(),dynamic.getDnumber());
		jdbc.close();
	}
	
	public List<Dynamic> query(String dnumber,Integer cp,Integer pagesize) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from dynamicinfo where 1=1 ");
		if(dnumber!=null && !dnumber.equals("")){
			sql.append(" and dnumber like '%"+dnumber+"%'");
		}
		sql.append("limit "+((cp-1)*pagesize)+","+pagesize);
		
		List<Dynamic> dynamic = jdbc.queryPreparedStatement(sql.toString(), Dynamic.class);
		jdbc.close();
		return dynamic;
	}
	
	//查询总条数
	public int count(String dnumber){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from dynamicinfo where 1=1 ");
		if(dnumber!=null && !dnumber.equals("")){
			sql.append(" and dnumber like '%"+dnumber+"%'");
		}
		sql.append("order by dnumber asc");
		List<Dynamic> temp = jdbc.queryPreparedStatement(sql.toString(), Dynamic.class);
		jdbc.close();
		return temp.size();
	}
	
	public void add(Dynamic dynamic) throws Exception{
		String sql="insert into dynamicinfo(dnumber, dautor, dtitle, dcontent, ddate, dtime, dpicture) values (null, ?, ?, ?, ?, ?, ?)";
		jdbc.updatePreparedStatement(sql,dynamic.getDautor(),dynamic.getDtitle(),dynamic.getDcontent(),dynamic.getDdate(),
				dynamic.getDtime(),dynamic.getDpicture());
		jdbc.close();
	}

}
