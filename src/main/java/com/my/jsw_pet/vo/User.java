package com.my.jsw_pet.vo;

public class User {

	private int user_idx;
	private String id = null;
	private String pw = null;
	private String nickname = null;
	private String user_img_url = null;
	private String name = null;
	private String birth = null;
	private String gender = null;
	private String tel = null;
	private String type = null;
	private String like_type = null;
	private String created_date = null;

	
	
	public String getUser_img_url() {
		return user_img_url;
	}

	public void setUser_img_url(String user_img_url) {
		this.user_img_url = user_img_url;
	}

	public String getLike_type() {
		return like_type;
	}

	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

}
