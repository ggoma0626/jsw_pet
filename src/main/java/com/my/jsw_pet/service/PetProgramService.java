package com.my.jsw_pet.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.jsw_pet.dao.PetProgramDao;
import com.my.jsw_pet.dao.ProgramOtherImgDao;
import com.my.jsw_pet.vo.PetProgram;
import com.my.jsw_pet.vo.ProgramOtherImg;

@Service
public class PetProgramService {

	@Autowired
	PetProgramDao petProgramDao;
	
	@Autowired
	ProgramOtherImgDao programOtherImgDao;
	
	public List<PetProgram> findByUserIdx(int user_idx) {
		return petProgramDao.findByUserIdx(user_idx);
	}
	
	
	// @Transactional > 실패시 중간이 아니라 아예 처음으로 셋 	
	@Transactional
	public int saveWithOtherImgs(
				PetProgram pp, 
				List<String> other_poster_img_url
			) {		
		
		petProgramDao.save(pp);
		
		int newProIdx = pp.getPro_idx();
		
		for(int i=0; i < other_poster_img_url.size(); i++ ) {
			ProgramOtherImg poi = new ProgramOtherImg();
			poi.setPro_idx(newProIdx);
			poi.setOther_img_url(other_poster_img_url.get(i));
			
			programOtherImgDao.save(poi);
		}
		
		return newProIdx;
	}	
	
	public int save(PetProgram pp) {
		return petProgramDao.save(pp);
	}
	
	public List<PetProgram> findChunk(HashMap<String, Object> map) {
		return petProgramDao.findChunk(map);
	}
	
	public PetProgram findByIdx(int pro_idx) {
		return petProgramDao.findByIdx(pro_idx);
	}
	
}
