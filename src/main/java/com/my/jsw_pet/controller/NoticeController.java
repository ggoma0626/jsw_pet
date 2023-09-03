package com.my.jsw_pet.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.my.jsw_pet.service.NoticeService;
import com.my.jsw_pet.vo.Notice;

//RestController를 해주면 return이 무조건 responsbody임
@RestController   
@RequestMapping(value="notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	
	@GetMapping("getCount")
	public int getCount() {
		return noticeService.getCount();
	}
	
	@GetMapping("findAll")
	public List<Notice> findAll(
			@RequestParam(value="start") int start,
			@RequestParam(value="cnt") int cnt
			) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("cnt", cnt);
		
		return noticeService.findAll(map); 
	}
	
	
	
	@PostMapping("save")
	public String save(
			@RequestParam(value="title") String title,
			@RequestParam(value="content") String content
			) {
	
			Notice notice = new Notice();
			notice.setTitle(title);
			notice.setContent(content);
			
			noticeService.save(notice);
		
		
		
		return "ok";
	}
	
}

