package com.buddi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.buddi.vo.BuddiMonVO;
import com.buddi.vo.BuddiUserVO;

@Mapper
public interface BuddiMapper {
	String login(BuddiUserVO vo); 
	
	int insertUser(BuddiUserVO vo);
    int addAndGetKey(BuddiUserVO vo);
    
    BuddiUserVO getUserById(String uid);
    
    BuddiMonVO getMonByNum(int dNum);
 
	List<BuddiUserVO> getUserList();
	List<Map<String,String>> getUserMap();
	
	int updateUser(BuddiUserVO vo);
	int updateByMap(Map<String,String> map);
	
	int deleteUser(String uid);

/* 위에 선언된 Dynamic SQL을 사용하는 메소드  선언 */
	BuddiUserVO findWithoutId(BuddiUserVO vo);
	
}