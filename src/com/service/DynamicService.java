package com.service;

import java.util.List;

import com.Dao.DynamicDao;
import com.model.Dynamic;
import com.model.Info;

public class DynamicService {
	DynamicDao dao = new DynamicDao();
	public void addlist(Dynamic dynamic) throws Exception{
		dao.addlist(dynamic);
	}
	
	public void updatelist(Dynamic dynamic) throws Exception{
		dao.updatelist(dynamic);
	}
	
	public List<Dynamic> query(String dnumber,Integer cp,Integer pagesize) throws Exception{
		return dao.query(dnumber,cp,pagesize);
	}
	
	public int count(String dnumber){
		return dao.count(dnumber);
	}
	
	public void add(Dynamic dynamic) throws Exception{
		dao.add(dynamic);
	}

}
