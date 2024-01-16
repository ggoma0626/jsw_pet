package com.my.jsw_pet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.my.jsw_pet.service.UserService;
import com.my.jsw_pet.vo.User;

@RestController // RestController는 무조건 리턴이 무조건 ResponsBody
@RequestMapping(value="user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	// user 정보수정
	@PostMapping("/updateUser")
	public String updateUser(
			@RequestParam(value="name") String name,
			@RequestParam(value="birth") String birth,
			@RequestParam(value="tel") String tel,
			@RequestParam(value="gender") String gender,
			@RequestParam(value="like_type") String like_type,
			HttpSession session
			) {
		
		User me = (User) session.getAttribute("me"); 
				
		User user = new User();
		user.setName(name);
		user.setBirth(birth);
		user.setTel(tel);
		user.setGender(gender);
		user.setLike_type(like_type);
		user.setUser_idx(me.getUser_idx());
		
		userService.updateUser(user);
		
		// 세션 값 변경해줘야됨
		User updatedMe = userService.findByidx(me.getUser_idx());
		
		session.setAttribute("me", updatedMe);
		
		return "ok";
	}
	
	
	
	// 강사 4명 보여주기
	@GetMapping("/get4T")
	public List<User> get4T() {
		
		List<User> list = userService.findLatestTeacher(4);
		
		return list;
	}
	
	// 아이디 중복체크
	@GetMapping("/getById")
	public User getById(
				@RequestParam(value="id") String id
			) {
		User user = userService.fintById(id);
		return user;
	}
	
	// 닉네임 중복체크
	@GetMapping("/getByNickname")
	public User getByNickname(
				@RequestParam(value="nickname") String nickname
			) {
		User user = userService.fintByNiname(nickname);
		return user;
	}
	
	
	
	// 회원가입
	@PostMapping("/create")
	public String create(
				@RequestParam(value="id") String id,
				@RequestParam(value="pw") String pw,
				@RequestParam(value="nickname") String nickname,
				@RequestParam(value="img_url") String user_img_url,
				@RequestParam(value="name") String name,
				@RequestParam(value="birth") String birth,
				@RequestParam(value="gender") String gender,
				@RequestParam(value="tel") String tel,
				@RequestParam(value="type") String type,
				@RequestParam(value="lty") String like_type
			) {
		
		User user = new User();
		user.setId(id);
		user.setPw(pw);
		user.setNickname(nickname);
		user.setUser_img_url(user_img_url);
		user.setName(name);
		user.setBirth(birth);
		user.setGender(gender);
		user.setTel(tel);
		user.setType(type);
		user.setLike_type(like_type);
		
		userService.create(user);
		return "ok";
	}
	
	// 로그아웃
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		// 세션파괴, 삭제
		session.invalidate(); 
		return "ok";
	}
	
	// 로그인
	@GetMapping("/login")
	public User login(
			@RequestParam(value="id") String id,
			@RequestParam(value="pw") String pw,
			HttpSession session
			) {
	
		User u = new User();
		u.setId(id);
		u.setPw(pw);
		
		User user = userService.findByIdAndPw(u);
		
		if(user!=null) {
			session.setAttribute("me", user);
		}
		
		return user;
	}
	
	// 아이디 찾기
	/*
	 * @GetMapping("/getByUserId") public User getByUserId(
	 * 
	 * @RequestParam(value="name") String name,
	 * 
	 * @RequestParam(value="tel") String tel ) { User user =
	 * userService.findByUserId(name, tel); return user; }
	 */
	
	// 비밀번호 찾기
	@GetMapping("/getByUserPw")
	public User getByUserPw(
				@RequestParam(value="id") String id
			) {
		User user = userService.findByUserPw(id);
		return user;
	}

}
