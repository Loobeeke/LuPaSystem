package com.service;
import java.util.List;

import com.Dao.foodpageDao;
import com.model.*;

public class foodpageService {

	foodpageDao foodpagedao = new foodpageDao();
	public List<Food> query(String ftype,Integer cp,Integer pagesize) throws Exception{
		return foodpagedao.query(ftype,cp,pagesize);
	}
	
	public int count(String ftype){
		return foodpagedao.count(ftype);
	}
	
	public void add(Food food) throws Exception{
		foodpagedao.add(food);
	}
	
	/*public void update(Food food) throws Exception{
		foodpagedao.update(food);
	}*/
	
	public void updatelist(Food food) throws Exception{
		foodpagedao.updatelist(food);
	}
	
}
