package com.service;

import com.Dao.ManagerDao;
import com.model.Manager;

public class ManagerService {
	
	ManagerDao dao = new ManagerDao();
	public void add(Manager manager) throws Exception {
		dao.add(manager);
	}
	public void updatemanager(Manager manager) throws Exception{
		dao.updatemanager(manager);
	}

}
