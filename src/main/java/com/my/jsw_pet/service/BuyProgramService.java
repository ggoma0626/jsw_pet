package com.my.jsw_pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.jsw_pet.dao.BuyProgramDao;
import com.my.jsw_pet.vo.BuyProgram;

@Service
public class BuyProgramService {
	
	@Autowired
	BuyProgramDao buyProgramDao;
	
	public List<BuyProgram> findByUserIdx(int user_idx) {
		return buyProgramDao.findByUserIdx(user_idx);
	}	
	
	public int save(BuyProgram bp) {		
		return buyProgramDao.save(bp);
	}
	
	public BuyProgram findByProgramAndUser(BuyProgram bp) {
		return buyProgramDao.findByProgramAndUser(bp);
	}
	
	public List<BuyProgram> findByProgram(int pro_idx) {
		return buyProgramDao.findByProgram(pro_idx);
	}
	
	
}
