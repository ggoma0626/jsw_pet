package com.my.jsw_pet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.jsw_pet.vo.BuyProgram;

@Repository
public class BuyProgramDao {

	@Autowired
	SqlSession s;	
	
	public int save(BuyProgram bp ) {
		return s.insert("buy_program.save",bp);
	}
	
	public BuyProgram findByProgramAndUser(BuyProgram bp) {
		return s.selectOne("buy_program.findByProgramAndUser",bp);
	}
	
	public List<BuyProgram> findByProgram(int pro_idx) {
		return s.selectList("buy_program.findByProgram", pro_idx);
	}
	
	public List<BuyProgram> findByUserIdx(int user_idx) {
		return s.selectList("buy_program.findByUserIdx", user_idx);
	}
	
}
