package com.Dao;

import com.model.Hotel;
import com.model.Tickets;
import com.util.JdbcUtil;

public class HotelDao {
	JdbcUtil jdbc = new JdbcUtil();
	public void addhotel(Hotel hotel) throws Exception{
		String sql="insert into hotelinfo(hnumber, hname, hdetail, hprice, haddress, htype,hphone,hpicture) values (null,?, ?, ?, ?, ?, ?,?)";
		jdbc.updatePreparedStatement(sql, hotel.getHname(),hotel.getHdetail(),hotel.getHprice(),hotel.getHaddress(),
				hotel.getHtype(),hotel.getHphone(),hotel.getHpicture());
		
		jdbc.close();
	}
	
	public void updatehotel(Hotel hotel) throws Exception{
		String sql="update hotelinfo set hname = ?,hdetail = ?,hprice = ?,haddress = ?,htype = ?,hphone = ?,hpicture = ? where hnumber = ?";
		jdbc.updatePreparedStatement(sql,hotel.getHname(),hotel.getHdetail(),hotel.getHprice(),hotel.getHaddress(),
				hotel.getHtype(),hotel.getHphone(),hotel.getHpicture(),hotel.getHnumber());
		jdbc.close();
	}
}
