package com.service;

import java.util.List;

import com.Dao.appointDao;
import com.model.Food;
import com.model.appointmentinfo;

public class appointmentService {
	appointDao dao = new appointDao();
	public void add(appointmentinfo appoint) throws Exception {
		dao.add(appoint);
	}
	
	public void updateappoint(appointmentinfo appoint) throws Exception{
		dao.updateappoint(appoint);
	}
	
	public List<appointmentinfo> query(String atitle,Integer cp,Integer pagesize) throws Exception{
		return dao.query(atitle,cp,pagesize);
	}
	
	public int count(String atitle){
		return dao.count(atitle);
	}

}
