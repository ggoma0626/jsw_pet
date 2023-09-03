package com.my.jsw_pet.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.jsw_pet.dao.NoticeDao;
import com.my.jsw_pet.vo.Notice;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDao noticedao;
	
	public int getCount() {
		return noticedao.getCount();
	}
	
	public List<Notice> findAll(HashMap<String, Object> map) {
		return noticedao.findAll(map);	
	}
	
	public int save(Notice notice) {
		return noticedao.save(notice);
	}
}
