package com.Dao;

import com.model.UserInfo;
import com.util.JdbcUtil;

public class userinfoDao {
	JdbcUtil jdbc = new JdbcUtil();
	public void adduserinfo(UserInfo userinfo) throws Exception{
		String sql="insert into userinfo(uname, uage, usex, uphone, uaddress, uexplain) values (?, ?, ?, ?, ?, ?)";
		jdbc.updatePreparedStatement(sql, userinfo.getUname(),userinfo.getUage(),userinfo.getUsex(),userinfo.getUphone(),
				userinfo.getUaddress(),userinfo.getUexplain());
	}
	
	public void update(UserInfo userinfo) throws Exception{
		String sql="update userinfo set uname = ?,uage = ?,usex = ?,uaddress = ?,uexplain = ? where uphone = ?";
		jdbc.updatePreparedStatement(sql, userinfo.getUname(),userinfo.getUage(),userinfo.getUsex(),
				userinfo.getUaddress(),userinfo.getUexplain(),userinfo.getUphone());
		jdbc.close();
	}

}
