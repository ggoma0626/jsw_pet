package com.my.jsw_pet.vo;

public class BuyProgram {
	
	
	private int buy_idx = 0;
	private int pro_idx = 0;
	private int user_idx = 0;
	private String created_date = null;
	
	
	//user
	private String nickname= null;
	private String user_img_url = null;
	private String tel = null;
	private String name = null;
		
	
	//program
	private String poster_img_url = null;
	private String type = null;
	private String title = null;

	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoster_img_url() {
		return poster_img_url;
	}
	public void setPoster_img_url(String poster_img_url) {
		this.poster_img_url = poster_img_url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUser_img_url() {
		return user_img_url;
	}
	public void setUser_img_url(String user_img_url) {
		this.user_img_url = user_img_url;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	public int getBuy_idx() {
		return buy_idx;
	}
	public void setBuy_idx(int buy_idx) {
		this.buy_idx = buy_idx;
	}
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	
	
}
