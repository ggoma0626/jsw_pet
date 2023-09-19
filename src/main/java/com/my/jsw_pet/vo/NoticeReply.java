package com.my.jsw_pet.vo;

public class NoticeReply {

	private int nt_rp_idx = 0;
	private int nt_idx = 0;
	private int user_idx = 0;
	private int parent_nt_rp_idx = 0;
	private String content = null;
	private String created_date = null;
	
	
	public int getNt_rp_idx() {
		return nt_rp_idx;
	}
	public void setNt_rp_idx(int nt_rp_idx) {
		this.nt_rp_idx = nt_rp_idx;
	}
	public int getNt_idx() {
		return nt_idx;
	}
	public void setNt_idx(int nt_idx) {
		this.nt_idx = nt_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getParent_nt_rp_idx() {
		return parent_nt_rp_idx;
	}
	public void setParent_nt_rp_idx(int parent_nt_rp_idx) {
		this.parent_nt_rp_idx = parent_nt_rp_idx;
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
