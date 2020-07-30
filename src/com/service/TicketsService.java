package com.service;

import java.util.List;

import com.Dao.ticketsDao;
import com.model.Info;
import com.model.Tickets;

public class TicketsService {
	ticketsDao dao=new ticketsDao();
	
	//修改资讯
/*	public void update(Info info) throws Exception{
		dao.update(info);
	}
	*/
//分页
	public List<Tickets> query(String id,Integer cp,Integer pagesize) throws Exception{
		return dao.query(id,cp,pagesize);
	}
	public List<Tickets> queryname(String name,Integer cp,Integer pagesize) throws Exception{
		return dao.queryname(name,cp,pagesize);
	}
	public List<Tickets> queryId(String name) throws Exception{
		return dao.queryId(name);
	}
	
	public int count(String id){
		return dao.count(id);
	}
	public int countname(String name){
		return dao.count(name);
	}
	
	public void add(Tickets tickets) throws Exception{
		dao.add(tickets);
	}
	
	public void addtickets(Tickets tickets) throws Exception{
		dao.addtickets(tickets);
	}
	
	public void updatetickets(Tickets tickets) throws Exception{
		dao.updatetickets(tickets);
	}
}
