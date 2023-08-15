package com.my.jsw_pet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.jsw_pet.vo.User;

@Repository
public class UserDao {
	
	@Autowired
	SqlSession s;
	
	// idx로 회원정보 가져오기
	public User findByidx(int user_idx) {
		return s.selectOne("user.findByIdx", user_idx);
	}
	
	//유저정보 수정 update
	public int updateUser(User user) {
		return s.update("user.updateUser", user);
	}
	
	// 회원가입
	public int save(User user) {
		return s.insert("user.save", user);   // user.save는 xml의 namespace.id로 이루어져있음
	}
	
	// 아이디체크
	public User findById(String id) {
		return s.selectOne("user.findById", id);
	}
	
	// 닉네임 중복체크
	public User findByNickname(String nickname) {
		return s.selectOne("user.findByNickname", nickname); // max값이 없거나 1개여서 selectOne을 사용함, 여러개일경우 selectlist
	}
	
	// 로그인
	public User findByIdAndPw(User user) {
		return s.selectOne("user.findByIdAndPw", user);
	}
	
	// User 이름, 전화번호로 아이디찾기
	/*
	 * public User findByUserId(String name, String tel) { return
	 * s.selectOne("user.findByUserId", name); }
	 */
	
	// User ID로 비밀번호 찾기
	public User findByUserPw(String id) {
		return s.selectOne("user.findByUserPw", id);
	}
	
	// 최신 등록된 선생님 표시 ( 조회 )
	public List<User> findLatestTeacher(int number) {
		return s.selectList("user.findLatestTeacher", number);
	}
	
	
}
