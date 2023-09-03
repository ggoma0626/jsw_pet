package com.my.jsw_pet.vo;


public class Notice {

	private int nt_idx = 0;
	private String title = null;
	private String content = null;
	private String created_date = null;
	
	
	public int getNt_idx() {
		return nt_idx;
	}
	public void setNt_idx(int nt_idx) {
		this.nt_idx = nt_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	
	
}
