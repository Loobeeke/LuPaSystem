package com.service;

import java.util.List;

import com.Dao.HotelDao;
import com.model.Hotel;
import com.model.Tickets;

public class HotelService {
	HotelDao dao = new HotelDao();
	public void addhotel(Hotel hotel) throws Exception{
		dao.addhotel(hotel);
	}
	
	public void updatehotel(Hotel hotel) throws Exception{
		dao.updatehotel(hotel);
	}
	
	public List<Hotel> query(String hnumber,Integer cp,Integer pagesize) throws Exception{
		return dao.query(hnumber,cp,pagesize);
	}
	public List<Hotel> queryname(String hname,Integer cp,Integer pagesize) throws Exception{
		return dao.queryname(hname,cp,pagesize);
	}
	public List<Hotel> queryId(String hnumber) throws Exception{
		return dao.queryId(hnumber);
	}
	
	public int count(String hnumber){
		return dao.count(hnumber);
	}
	public int countname(String hname){
		return dao.count(hname);
	}
	public List<Hotel> querydetail(String hnumber) throws Exception{
		return dao.querydetail(hnumber);
	}

}
