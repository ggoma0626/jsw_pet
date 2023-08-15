package com.my.jsw_pet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.jsw_pet.vo.ProgramOtherImg;

@Repository
public class ProgramOtherImgDao {
	
	@Autowired
	SqlSession s;
	
	public int save(ProgramOtherImg poi) {
		// insert 다음에 "" 부분에 매퍼에 있는 네임 스페이스가 들어간다
		return s.insert("program_other_img.save",poi);
	}
	
	public List<ProgramOtherImg> findByProgramIdx(int pro_idx) {
		return s.selectList("program_other_img.findByProgramIdx",pro_idx);
	}

}
