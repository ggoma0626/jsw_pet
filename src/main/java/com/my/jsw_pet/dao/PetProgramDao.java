package com.my.jsw_pet.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.jsw_pet.vo.PetProgram;

@Repository
public class PetProgramDao {
	
	@Autowired
	SqlSession s;
	
	public List<PetProgram> findByUserIdx(int user_idx) {
		return s.selectList("pet_program.findByUserIdx", user_idx);
	}
	
	// 상세보기에서 idx로 정보 찾아오기
	public PetProgram findByIdx(int pro_idx) {
		return s.selectOne("pet_program.findByIdx", pro_idx);
	}
	
	public int save(PetProgram pp) {
		return s.insert("pet_program.save",pp);
	}
	
	public List<PetProgram> findChunk(HashMap<String, Object> map) {
		return s.selectList("pet_program.findChunk",map);
	}
	

}
