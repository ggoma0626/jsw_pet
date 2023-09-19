package com.my.jsw_pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.jsw_pet.dao.NoticeReplyDao;
import com.my.jsw_pet.vo.NoticeReply;

@Service
public class NoticeReplyService {

	@Autowired
	NoticeReplyDao noticeReplyDao;
	
	public int save(NoticeReply nt) {
		return noticeReplyDao.save(nt);
	}
	
	public List<NoticeReply> findByNtIdx(int nt_idx) {
		return noticeReplyDao.findByNtIdx(nt_idx);
	}
}
