package com.service;

import java.util.List;

import com.Dao.InfoDao;
import com.model.Food;
import com.model.Info;

public class InfoService {
	InfoDao dao = new InfoDao();
	
	//修改资讯
/*	public void update(Info info) throws Exception{
		dao.update(info);
	}
	*/
//分页
	public List<Info> query(String tnumber,Integer cp,Integer pagesize) throws Exception{
		return dao.query(tnumber,cp,pagesize);
	}
	
	public int count(String tnumber){
		return dao.count(tnumber);
	}
	
	public void add(Info info) throws Exception{
		dao.add(info);
	}
	
	public void update(Info info) throws Exception{
		dao.update(info);
	}
	
	public void addlist(Info info) throws Exception{
		dao.addlist(info);
	}
	public List<Info> travellist(String tnumber) throws Exception{
		return dao.travellist(tnumber);
	}
	public void updatelist(Info info) throws Exception{
		dao.updatelist(info);
	}
}
