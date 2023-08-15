package com.my.jsw_pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.jsw_pet.dao.UserDao;
import com.my.jsw_pet.vo.User;

@Service
public class UserService {
	
	@Autowired
	UserDao userDao;

	/*
	 * 수정에서 user idx 가져와서 세션정보 변경
	 */
	public User findByidx(int user_idx) {
		return userDao.findByidx(user_idx);
	}
	
	
	/*
	 * user update
	 */
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}
	
	
	/*
	 * 회원가입
	 */	
	public int create(User newUser) {
		return userDao.save(newUser);
	}
	
	/*
	 * ID 중복체크
	 */
	public User fintById(String id) {
		return userDao.findById(id);
	}
	
	/*
	 * 닉네임 중복체크
	 */
	public User fintByNiname(String nickName) {
		return userDao.findByNickname(nickName);
	}
	
	/*
	 * 로그인
	 */
	public User findByIdAndPw(User user) {
		return userDao.findByIdAndPw(user);
	}
	
	/*
	 * 이름, 전화번호로 회원 Id 찾기
	 */
	/*
	 * public User findByUserId(String name, String tel) { return
	 * userDao.findByUserId(name, tel); }
	 */
	
	/*
	 * 회원 ID로 PW 찾기(재설정)
	 */	
	public User findByUserPw(String id) {
		return userDao.findByUserPw(id);
	}
	
	/*
	 * 선생님(전문가) 리스트
	 */
	public List<User> findLatestTeacher(int number) {
		return userDao.findLatestTeacher(number);
	}
}
