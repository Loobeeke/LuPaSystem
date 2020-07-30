package com.Dao;

import com.model.Manager;
import com.util.JdbcUtil;

public class ManagerDao {
	JdbcUtil jdbc = new JdbcUtil();
	public void add(Manager manager) throws Exception {
		String sql = "insert into manager(mid,mname,mpassword,mpicture) Values(null,?,?,?)";
		jdbc.updatePreparedStatement(sql, manager.getMname(),manager.getMpassword(),manager.getMpicture());
		jdbc.close();
	}
	
	public void updatemanager(Manager manager) throws Exception{
		String sql="update manager set mname = ?,mpassword = ?,mpicture = ? where mid = ?";
		jdbc.updatePreparedStatement(sql,manager.getMname(),manager.getMpassword(),manager.getMpicture(),manager.getMid());
		jdbc.close();
	}

}
