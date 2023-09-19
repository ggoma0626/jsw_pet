package com.my.jsw_pet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.my.jsw_pet.service.NoticeReplyService;
import com.my.jsw_pet.vo.NoticeReply;
import com.my.jsw_pet.vo.User;

@RestController
@RequestMapping(value="ntrp")
public class NoticeReplyController {
	
	@Autowired
	NoticeReplyService noticeReplyService;
	
	@GetMapping("findByIdx")
	public List<NoticeReply> findByIdx(
			@RequestParam(value="nt_idx") int nt_idx			
			) {
						
		return noticeReplyService.findByNtIdx(nt_idx);  
	}
	
	@PostMapping("save")
	public String save(
			@RequestParam(value="nt_idx") int nt_idx,			
			@RequestParam(value="parent_nt_rp_idx") int parent_nt_rp_idx,
			@RequestParam(value="content") String content,		
			HttpSession httpSession
			) {
		
		
		User me = (User) httpSession.getAttribute("me");
		
		NoticeReply noticeReply = new NoticeReply();
		noticeReply.setNt_idx(nt_idx);
		noticeReply.setUser_idx(me.getUser_idx());
		noticeReply.setParent_nt_rp_idx(parent_nt_rp_idx);
		noticeReply.setContent(content);
		
		noticeReplyService.save(noticeReply);
		
		return "ok";
	}

}
