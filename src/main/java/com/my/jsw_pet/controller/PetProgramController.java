package com.my.jsw_pet.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.my.jsw_pet.service.PetProgramService;
import com.my.jsw_pet.service.ProgramOtherImgService;
import com.my.jsw_pet.vo.PetProgram;
import com.my.jsw_pet.vo.User;

@RestController
@RequestMapping(value="program")
public class PetProgramController {
	
	@Autowired
	PetProgramService petProgramService;
	
	@Autowired
	ProgramOtherImgService programOtherImgService;
	
	@GetMapping("findByUserIdx")
	public List<PetProgram> findByUserIdx(			
			@RequestParam(value="user_idx") int user_idx) {
		return petProgramService.findByUserIdx(user_idx);
	}
	
	
	// js를 이용한 방식 ajax start
	@GetMapping("findByIdx")
	public PetProgram findByIdx(
			@RequestParam(value="pro_idx") int pro_idx) {
		return petProgramService.findByIdx(pro_idx);
	}
	// js를 이용한 방식 ajax end
	
	@GetMapping("getChunk")
	public List<PetProgram> getChunk(
			@RequestParam(value="start") int start,
			@RequestParam(value="cnt") int cnt
			) {		
		HashMap<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("cnt", cnt);
		List<PetProgram> list = petProgramService.findChunk(map);
		
		return list;
	}
	
	@PostMapping("save")
	public String save(
			@RequestParam(value="title") String title,
			@RequestParam(value="content") String content,
			@RequestParam(value="type") String type,
			@RequestParam(value="poster_img_url") String poster_img_url,
			@RequestParam(value="other_img_url_list[]", defaultValue = "") List<String> other_poster_img_url,
			HttpSession session
			//@RequestParam(value="user_idx") int user_idx 세션으로 받으면 될듯?
			) {
		User user = (User) session.getAttribute("me");
		
		if(user == null) {
			//로그인 안됨
			return "not";
		}else {
			//로그인 됨
			int user_idx = user.getUser_idx();
			
			PetProgram petProgram = new PetProgram();		
			petProgram.setTitle(title);
			petProgram.setContent(content);
			petProgram.setType(type);
			petProgram.setUser_idx(user_idx);
			petProgram.setPoster_img_url(poster_img_url);
			
			petProgramService.saveWithOtherImgs(petProgram, other_poster_img_url);					

			return "ok";
		}
		

	}
}
