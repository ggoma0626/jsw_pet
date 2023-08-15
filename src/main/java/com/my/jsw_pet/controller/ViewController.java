package com.my.jsw_pet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.jsw_pet.service.BuyProgramService;
import com.my.jsw_pet.service.PetProgramService;
import com.my.jsw_pet.service.ProgramOtherImgService;
import com.my.jsw_pet.service.UserService;
import com.my.jsw_pet.vo.BuyProgram;
import com.my.jsw_pet.vo.PetProgram;
import com.my.jsw_pet.vo.ProgramOtherImg;
import com.my.jsw_pet.vo.User;

@Controller
public class ViewController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PetProgramService petProgramService;
	
	@Autowired
	ProgramOtherImgService programOtherImgService;
	
	@Autowired
	BuyProgramService buyProgramService;
	
	
	@GetMapping("/mypage")
	public String mypage(HttpSession Session, Model model) {
		
		User me = (User) Session.getAttribute("me");
		int me_idx = me.getUser_idx();
		
		List<BuyProgram> ulist = buyProgramService.findByUserIdx(me_idx);
		model.addAttribute("ulist", ulist);
		//model.addAttribute("me_idx", me_idx); //js에서 세션값 받아오기
		
		return "mypage";
	}
	
	
	@GetMapping("/")
	public String home(Model model) {
		
		List<User> list = userService.findLatestTeacher(4);
		
		model.addAttribute("teachers", list);
		return "home";
	}
	
	@GetMapping("/detail-program")
	public String detailProgram(Model model,
				@RequestParam(value="pro_idx") int pro_idx,
				HttpSession session
				) {
				 
		PetProgram pp = petProgramService.findByIdx(pro_idx);		
		List<ProgramOtherImg> list = programOtherImgService.findByProgramIdx(pro_idx);
		
		
		model.addAttribute("petProgram",pp);
		//model.addAttribute("OtherImg_list",list);
		
		User user = (User) session.getAttribute("me");
		int user_idx=0;
		
		if(user!=null) {
			user_idx=user.getUser_idx();
		}
		
		BuyProgram bp = new BuyProgram();
		bp.setPro_idx(pro_idx);
		bp.setUser_idx(user_idx);
		
		BuyProgram result = buyProgramService.findByProgramAndUser(bp);
		
		if(result==null) {
			// 프로그램 신청 안함.
			model.addAttribute("isBuy","n");
		}else {
			// 프로그램 이미 신청함.
			model.addAttribute("isBuy","y");
		}
		
		return "detail-program";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@GetMapping("/study")
	public String study() {
		
		return "study";
	}
	
	@GetMapping("/signup")
	public String signup() {
		
		return "signup";
	}
	
	@GetMapping("/finduser")
	public String finduser() {
		
		return "finduser";
	}
	
	@GetMapping("/program")
	public String program() {
		
		return "program";
	}
	
	@GetMapping("/add-program")
	public String addProgram() {
		
		return "add-program";
	}
	
	@GetMapping("/test")
	public String test() {
		
		return "test";
	}
	
	

}
