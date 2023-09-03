package com.my.jsw_pet.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.jsw_pet.vo.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	SqlSession s;
	
	public int getCount() {
		return s.selectOne("notice.getCount");
	}
	
	public List<Notice> findAll(HashMap<String, Object> map) {
		return s.selectList("notice.findAll", map);
	}
	
	public int save(Notice notice) {
		return s.insert("notice.save", notice);
	}
}
