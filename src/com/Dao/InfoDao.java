package com.Dao;

import java.util.List;

import com.model.Food;
import com.model.Info;
import com.util.JdbcUtil;

public class InfoDao {
JdbcUtil jdbc = new JdbcUtil();
	/*
	public void update(Info info) throws Exception{
		String sql="update trvalinfo set sname = ?,age = ?,sex = ?,phone = ?,school = ?,grade = ?,major = ? where sid = ?";
		jdbc.updatePreparedStatement(sql, info.getTnumber()(),info.getAge(),info.getSex(),info.getPhone()
				,info.getSchool(),info.getGrade(),info.getMajor(),info.getSid());
		jdbc.close();
	}*/
//分页
	public List<Info> query(String tnumber,Integer cp,Integer pagesize) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from trvalinfo where 1=1 ");
		if(tnumber!=null && !tnumber.equals("")){
			sql.append(" and tnumber like '%"+tnumber+"%'");
		}
		sql.append("limit "+((cp-1)*pagesize)+","+pagesize);
		
		List<Info> infos = jdbc.queryPreparedStatement(sql.toString(), Info.class);
		jdbc.close();
		return infos;
	}
	
	//查询总条数
	public int count(String tnumber){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from trvalinfo where 1=1 ");
		if(tnumber!=null && !tnumber.equals("")){
			sql.append(" and tnumber like '%"+tnumber+"%'");
		}
		sql.append("order by tnumber asc");
		List<Info> temp = jdbc.queryPreparedStatement(sql.toString(), Info.class);
		jdbc.close();
		return temp.size();
	}
	
	public void add(Info info) throws Exception{
		String sql="insert into trvalinfo(tnumber, tauthor, theading, tcontent, tdate, ttime, tpicture) values (?, ?, ?, ?, ?, ?, ?)";
		jdbc.updatePreparedStatement(sql, info.getTnumber(),info.getTauthor(),info.getTheading(),info.getTcontent(),info.getTdate(),
				info.getTtime(),info.getTpicture());
		jdbc.close();
	}
	
	public void update(Info info) throws Exception{
		String sql="update trvalinfo set tauthor = ?,theading = ?,tcontent = ?,tdate = ?,ttime = ?,tpicture = ? where tnumber = ?";
		jdbc.updatePreparedStatement(sql,info.getTauthor(),info.getTheading(),info.getTcontent(),info.getTdate(),
				info.getTtime(),info.getTpicture(),info.getTnumber());
		jdbc.close();
	}
	
	public void addlist(Info info) throws Exception{
		String sql="insert into trvalinfo(tnumber, tauthor, theading, tcontent, tdate, ttime, tpicture) values (null, ?, ?, ?, ?, ?, ?)";
		jdbc.updatePreparedStatement(sql,info.getTauthor(),info.getTheading(),info.getTcontent(),info.getTdate(),
				info.getTtime(),info.getTpicture());
		jdbc.close();
	}
	public void updatelist(Info info) throws Exception{
		String sql="update trvalinfo set tauthor = ?,theading = ?,tcontent = ?,tdate = ?,ttime = ?,tpicture = ? where tnumber = ?";
		jdbc.updatePreparedStatement(sql,info.getTauthor(),info.getTheading(),info.getTcontent(),info.getTdate(),
				info.getTtime(),info.getTpicture(),info.getTnumber());
		jdbc.close();
	}
	
	public List<Info> travellist(String theading) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from trvalinfo where 1=1 ");
		if(theading!=null && !theading.equals("")){
			sql.append(" and theading like '%"+theading+"%'");
		}
		
		List<Info> infos = jdbc.queryPreparedStatement(sql.toString(), Info.class);
		jdbc.close();
		return infos;
	}
	
}
