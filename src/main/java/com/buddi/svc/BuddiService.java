package com.buddi.svc;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.buddi.dao.BuddiDAO;
import com.buddi.vo.BuddiMonVO;
import com.buddi.vo.BuddiUserVO;

@Service
public class BuddiService {
	@Autowired
	private BuddiDAO dao;

	public boolean login(BuddiUserVO vo) {
		return dao.login(vo);
	}

	public List<BuddiUserVO> getList() {
		return dao.getUserList();
	}

	public boolean add(BuddiUserVO vo) {
		return dao.addUser(vo);
	}

	public BuddiUserVO detailUser(String uid) {
		return dao.selectById(uid);
	}

	public boolean update(BuddiUserVO vo) {
		return dao.update(vo);
	}

	public boolean delete(String uid) {
		return dao.delete(uid);
	}
	
	public BuddiMonVO detailMon(int dNum) {
		return dao.getMonByNum(dNum);
	}

	public List<BuddiMonVO> getGachaResult(int count) {
		List<BuddiMonVO> list = new ArrayList<>();
		
		Random rd = new Random();
		for (int i =0; i < count; i++) {
			BuddiMonVO vo = new BuddiMonVO();
			int dNum=rd.nextInt(159)+1;
			list.add(dao.getMonByNum(dNum));
		}
		
		return list;
	}
	
	public int getTodayMon() {
		Random rd = new Random();
		int dNum = rd.nextInt(159)+1;
		return dNum;
	}
	
}
