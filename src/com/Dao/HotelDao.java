package com.Dao;

import java.util.List;

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
	public List<Hotel> query(String hnumber,Integer cp,Integer pagesize) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from hotelinfo where 1=1 ");
		if(hnumber!=null && !hnumber.equals("")){
			sql.append(" and hnumber like '%"+hnumber+"%'");
		}
		sql.append("limit "+((cp-1)*pagesize)+","+pagesize);
		
		List<Hotel> hotels = jdbc.queryPreparedStatement(sql.toString(), Hotel.class);
		jdbc.close();
		return hotels;
	}
	public List<Hotel> queryname(String name,Integer cp,Integer pagesize) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from hotelinfo where 1=1 ");
		if(name!=null && !name.equals("")){
			sql.append(" and hname like '%"+name+"%'");
		}
		sql.append("limit "+((cp-1)*pagesize)+","+pagesize);
		
		List<Hotel> hotels = jdbc.queryPreparedStatement(sql.toString(), Hotel.class);
		jdbc.close();
		return hotels;
	}
	public List<Hotel> queryId(String hnumber) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from hotelinfo where  hnumber ="+hnumber);
		List<Hotel> hotels = jdbc.queryPreparedStatement(sql.toString(), Hotel.class);
		jdbc.close();
		return hotels;
	}
	
	//查询总条数
	public int count(String hnumber){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from hotelinfo where 1=1 ");
		if(hnumber!=null && !hnumber.equals("")){
			sql.append(" and hnumber like '%"+hnumber+"%'");
		}
		sql.append("order by hnumber asc");
		List<Hotel> temp = jdbc.queryPreparedStatement(sql.toString(), Hotel.class);
		jdbc.close();
		return temp.size();
	}
	
	public List<Hotel> querydetail(String hnumber) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from hotelinfo where 1=1 ");
		sql.append(" and hnumber ="+hnumber);
		List<Hotel> hotels = jdbc.queryPreparedStatement(sql.toString(), Hotel.class);
		jdbc.close();
		return hotels;
	}
}
