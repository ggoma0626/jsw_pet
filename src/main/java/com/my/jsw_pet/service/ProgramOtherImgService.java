package com.my.jsw_pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.jsw_pet.dao.ProgramOtherImgDao;
import com.my.jsw_pet.vo.ProgramOtherImg;

@Service
public class ProgramOtherImgService {
	
	@Autowired
	ProgramOtherImgDao programOtherImgDao;
	
	public int save(ProgramOtherImg poi) {
		return programOtherImgDao.save(poi);
	}
	
	public List<ProgramOtherImg> findByProgramIdx(int pro_idx) {
		return programOtherImgDao.findByProgramIdx(pro_idx);
	}
	
}
