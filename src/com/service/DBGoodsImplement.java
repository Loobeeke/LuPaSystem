package com.service;

import java.util.List;

import com.Dao.DBGoodsDao;
import com.model.Food;
import com.model.Goods;
import com.model.Info;
import com.model.appointmentinfo;

public class DBGoodsImplement {
	DBGoodsDao dao = new DBGoodsDao();
	public void addgoods(Goods goods) throws Exception{
		dao.addgoods(goods);
	}
	
	public void updatelist(Goods goods) throws Exception{
		dao.updatelist(goods);
	}
	
	public List<Goods> query(String gtype,Integer cp,Integer pagesize) throws Exception{
		return dao.query(gtype,cp,pagesize);
	}
	
	public int count(String gtype){
		return dao.count(gtype);
	}

}
