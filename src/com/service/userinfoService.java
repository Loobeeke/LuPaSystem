package com.service;

import com.Dao.userinfoDao;
import com.model.UserInfo;

public class userinfoService {
	userinfoDao dao = new userinfoDao();
	public void adduserinfo(UserInfo userinfo) throws Exception{
		dao.adduserinfo(userinfo);
	}
	
	
	public void update(UserInfo userinfo) throws Exception{
		dao.update(userinfo);
	}

}
