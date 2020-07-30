package com.Dao;

import com.util.JdbcUtil;

import java.util.List;

import com.model.*;
public class foodpageDao {
	
	JdbcUtil jdbc = new JdbcUtil();
	
	public List<Food> query(String ftype,Integer start,Integer limit) {
		
		//******最内层sql******//
		StringBuffer sql = new StringBuffer();
		sql.append("select * from foodinfo where 1=1 ");
		if(ftype!=null && !ftype.equals("")){
			sql.append(" and ftype like '%"+ftype+"%'");
		}
		sql.append("limit "+((start-1)*limit)+","+limit);
		
		List<Food> foods = jdbc.queryPreparedStatement(sql.toString(), Food.class);
		/*String sql = "select * from foodinfo";
		List<Food> foods = jdbc.queryPreparedStatement(sql, Food.class);*/
		jdbc.close();
		return foods;
	}
	
	//查询总条数
	public int count(String ftype){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from foodinfo where 1=1 ");
		if(ftype!=null && !ftype.equals("")){
			sql.append(" and ftype like '%"+ftype+"%'");
		}
		sql.append("order by fnumber asc");
		List<Food> temp = jdbc.queryPreparedStatement(sql.toString(), Food.class);
		jdbc.close();
		return temp.size();
	}
	
	public void add(Food food) throws Exception{
		String sql="insert into foodinfo(fnumber, fname, fstore, ftype,faddress,fprice, fphone, fintroduce, fpicture) values (null,?, ?, ?, ?, ?, ?, ?, ?)";
		jdbc.updatePreparedStatement(sql, food.getFname(),food.getFstore(),food.getFtype(),food.getFaddress(),
				food.getFprice(),food.getFphone(),food.getFintroduce(),food.getFpicture());
		jdbc.close();
	}
	
	public void update(Food food) throws Exception{
		String sql="update foodinfo set fname = ?,fstore = ?,ftype = ?,faddress = ?,fprice = ?,fphone = ?,fintroduce = ? ,fpicture = ? where fnumber = ?";
		jdbc.updatePreparedStatement(sql, food.getFname(),food.getFstore(),food.getFtype(),food.getFaddress(),
				food.getFprice(),food.getFphone(),food.getFintroduce(),food.getFpicture(),food.getFnumber());
		jdbc.close();
	}
	
	public void updatelist(Food food) throws Exception{
		String sql="update foodinfo set fname = ?,fstore = ?,ftype = ?,faddress = ?,fprice = ?,fphone = ?,fintroduce= ?,fpicture= ? where fnumber = ?";
		jdbc.updatePreparedStatement(sql,food.getFname(),food.getFstore(),food.getFtype(),food.getFaddress(),
				food.getFprice(),food.getFphone(),food.getFintroduce(),food.getFpicture(),food.getFnumber());
		jdbc.close();
	}
}
