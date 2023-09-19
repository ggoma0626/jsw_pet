package com.my.jsw_pet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.jsw_pet.vo.NoticeReply;

@Repository
public class NoticeReplyDao {
	
	@Autowired
	SqlSession s;
	
	public int save(NoticeReply nt) {
		return s.insert("notice_reply.save", nt);
	}
	
	public List<NoticeReply> findByNtIdx(int nt_idx) {
		return s.selectList("notice_reply.fineByNtIdx", nt_idx);
	}
}