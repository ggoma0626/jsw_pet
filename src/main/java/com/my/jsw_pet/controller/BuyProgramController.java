package com.my.jsw_pet.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.my.jsw_pet.service.BuyProgramService;
import com.my.jsw_pet.vo.BuyProgram;
import com.my.jsw_pet.vo.User;

@RestController
@RequestMapping(value="bp")
public class BuyProgramController {

	@Autowired
	BuyProgramService buyProgramService;
	
	@GetMapping("getByProgram")
	@ResponseBody
	public List<BuyProgram> getByProgram(
			@RequestParam(value="pro_idx") int pro_idx
			) {
		
		return buyProgramService.findByProgram(pro_idx);				
	};
	
	
	@PostMapping("buy")
	@ResponseBody
	public String buy(
			@RequestParam(value="pro_idx") int pro_idx,
			//이미 로그인정보에 user_idx가 있으니 세션으로 불러오자
			HttpSession session 
			) {
		User user = (User) session.getAttribute("me");
				
		
		if(user == null) {
			//로그인 안됨
			return "no-user"; 
		} else {
			//로그인 됨
			int user_idx = user.getUser_idx();
			
			BuyProgram bp = new BuyProgram();
			bp.setPro_idx(pro_idx);
			bp.setUser_idx(user_idx);
			buyProgramService.save(bp);
			return "ok";
		}
		 
		
	}
	
	
		
}
