package com.buddi.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.buddi.mapper.BuddiMapper;
import com.buddi.vo.BuddiBoardVO;
import com.buddi.vo.BuddiMonVO;
import com.buddi.vo.BuddiUserVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Repository
public class BuddiDAO
{
	@Autowired
	private BuddiMapper buddiMapper;

	public boolean insert(BuddiUserVO vo) {
		return buddiMapper.insertUser(vo)>0;
	}
	
    public int addAndGetKey(BuddiUserVO vo) {
        return buddiMapper.addAndGetKey(vo);
    }
	public BuddiUserVO selectById(String uid) {
		return buddiMapper.getUserById(uid);
    }
	
	public List<BuddiUserVO> getUserList() {
		return buddiMapper.getUserList();
    }
	
	public PageInfo<BuddiUserVO> getListPage(int pageNum) {
		PageHelper.startPage(pageNum, 3);
		PageInfo<BuddiUserVO> pageInfo = new PageInfo<>(buddiMapper.getUserList());
		return pageInfo;
	}
	
	public List<Map<String,String>> getUserMap(){
		return buddiMapper.getUserMap();
	}

	public boolean update(BuddiUserVO vo) {
		return buddiMapper.updateUser(vo)>0;
	}
	
	public boolean updateByMap(Map<String,String> map) {
		return buddiMapper.updateByMap(map)>0;
	}
	
	public boolean delete(String uid) {
		return buddiMapper.deleteUser(uid)>0;
	}

	public boolean idCheck(String uid) {
		return (buddiMapper.getUserById(uid)==null);
	}

	public boolean addUser(BuddiUserVO vo) {
		return buddiMapper.insertUser(vo)>0;
	}

	public boolean login(BuddiUserVO vo) {
		return buddiMapper.login(vo)!=null;
	}
	
	public BuddiMonVO getMonByNum(int dNum) {
		return buddiMapper.getMonByNum(dNum);
	}
	
	public boolean addBoard(BuddiBoardVO board) {
		return buddiMapper.addBoard(board) > 0;

	}

	public boolean addFileInfo(Map<String, Object> map) {
		return buddiMapper.addFileInfo(map) > 0;

	}

	public List<Map<String, Object>> boardList() {
		return buddiMapper.boardList();
	}

	public List<Map<String, Object>> detail(int num) {
		return buddiMapper.getDetail(num);

	}

	public String getFilename(int num) {
		return buddiMapper.getFilename(num);
	}

	public boolean deleteFileInfo(int num) {
		return buddiMapper.deleteFileInfo(num) > 0;
	}

}
