package com.Dao;

import java.util.List;

import com.model.Goods;
import com.model.Info;
import com.model.appointmentinfo;
import com.util.JdbcUtil;

public class DBGoodsDao {
	JdbcUtil jdbc = new JdbcUtil();
	public void addgoods(Goods goods) throws Exception{
		String sql="insert into goodsinfo(gnumber, gname, gstore, gtype,gaddress,gprice, gphone, gintroduce, gpicture) values (null,?, ?, ?, ?, ?, ?, ?, ?)";
		jdbc.updatePreparedStatement(sql, goods.getGname(),goods.getGstore(),goods.getGtype(),goods.getGaddress(),
				goods.getGprice(),goods.getGphone(),goods.getGintroduce(),goods.getGpicture());
		jdbc.close();
	}
	
	public void updatelist(Goods goods) throws Exception{
		String sql="update goodsinfo set gname = ?,gstore = ?,gtype = ?,gaddress = ?,gprice = ?,gphone = ?,gintroduce= ?,gpicture= ? where gnumber = ?";
		jdbc.updatePreparedStatement(sql,goods.getGname(),goods.getGstore(),goods.getGtype(),goods.getGaddress(),
				goods.getGprice(),goods.getGphone(),goods.getGintroduce(),goods.getGpicture(),goods.getGnumber());
		jdbc.close();
	}
	
	public List<Goods> query(String gtype,Integer start,Integer limit) {
		
		//******最内层sql******//
		StringBuffer sql = new StringBuffer();
		sql.append("select * from goodsinfo where 1=1 ");
		if(gtype!=null && !gtype.equals("") ){
			sql.append(" and gtype like '%"+gtype+"%'");
		}
		sql.append("limit "+((start-1)*limit)+","+limit);
		
		List<Goods> goods = jdbc.queryPreparedStatement(sql.toString(), Goods.class);
		/*String sql = "select * from foodinfo";
		List<Food> foods = jdbc.queryPreparedStatement(sql, Food.class);*/
		jdbc.close();
		return goods;
	}
	
	//查询总条数
	public int count(String gtype){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from goodsinfo where 1=1 ");
		if(gtype!=null && !gtype.equals("")){
			sql.append(" and gtype like '%"+gtype+"%'");
		}
		sql.append("order by gnumber asc");
		List<Goods> temp = jdbc.queryPreparedStatement(sql.toString(), Goods.class);
		jdbc.close();
		return temp.size();
	}

}
