package com.service;

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

}
