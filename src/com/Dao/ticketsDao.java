package com.Dao;

import java.util.List;

import com.model.Info;
import com.model.Tickets;
import com.util.JdbcUtil;

public class ticketsDao {
	JdbcUtil jdbc = new JdbcUtil();
	/*
	public void update(Info info) throws Exception{
		String sql="update trvalinfo set sname = ?,age = ?,sex = ?,phone = ?,school = ?,grade = ?,major = ? where sid = ?";
		jdbc.updatePreparedStatement(sql, info.getid()(),info.getAge(),info.getSex(),info.getPhone()
				,info.getSchool(),info.getGrade(),info.getMajor(),info.getSid());
		jdbc.close();
	}*/
//分页
	public List<Tickets> query(String id,Integer cp,Integer pagesize) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from tickets where 1=1 ");
		if(id!=null && !id.equals("")){
			sql.append(" and id like '%"+id+"%'");
		}
		sql.append("limit "+((cp-1)*pagesize)+","+pagesize);
		
		List<Tickets> tickets = jdbc.queryPreparedStatement(sql.toString(), Tickets.class);
		jdbc.close();
		return tickets;
	}
	public List<Tickets> queryname(String name,Integer cp,Integer pagesize) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from tickets where 1=1 ");
		if(name!=null && !name.equals("")){
			sql.append(" and name like '%"+name+"%'");
		}
		sql.append("limit "+((cp-1)*pagesize)+","+pagesize);
		
		List<Tickets> tickets = jdbc.queryPreparedStatement(sql.toString(), Tickets.class);
		jdbc.close();
		return tickets;
	}
	public List<Tickets> queryId(String id) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from tickets where 1=1 ");
		if(id!=null && !id.equals("")){
			sql.append(" and id = "+id+"");
		}
		List<Tickets> tickets = jdbc.queryPreparedStatement(sql.toString(), Tickets.class);
		jdbc.close();
		return tickets;
	}
	
	//查询总条数
	public int count(String id){
		StringBuffer sql = new StringBuffer();
		sql.append("select * from tickets where 1=1 ");
		if(id!=null && !id.equals("")){
			sql.append(" and id like '%"+id+"%'");
		}
		sql.append("order by id asc");
		List<Tickets> temp = jdbc.queryPreparedStatement(sql.toString(), Tickets.class);
		jdbc.close();
		return temp.size();
	}
	
	public void add(Tickets tickets) throws Exception{
		String sql="insert into tickets(id, name, detail, price, oldprice, stock,picture) values (?, ?, ?, ?, ?, ?,picture)";
		jdbc.updatePreparedStatement(sql, tickets.getId(),tickets.getName(),tickets.getDetail(),tickets.getPrice(),tickets.getOldprice(),tickets.getStock(),tickets.getPicture());
		
	}
	
	public void addtickets(Tickets tickets) throws Exception{
		String sql="insert into tickets(id, name, detail, price, oldprice, stock,picture) values (null, ?, ?, ?, ?, ?,?)";
		jdbc.updatePreparedStatement(sql, tickets.getName(),tickets.getDetail(),
				tickets.getPrice(),tickets.getOldprice(),tickets.getStock(),tickets.getPicture());
		
		jdbc.close();
	}
	
	public void updatetickets(Tickets tickets) throws Exception{
		String sql="update tickets set name = ?,detail = ?,price = ?,oldprice = ?,stock = ?,picture = ? where id = ?";
		jdbc.updatePreparedStatement(sql,tickets.getName(),tickets.getDetail(),
				tickets.getPrice(),tickets.getOldprice(),tickets.getStock(),tickets.getPicture(),tickets.getId());
		jdbc.close();
	}
}
