package com.saem.domain;

public class BoardVO {
	private int b_num;
	private String b_title;
	private String b_content;
	private String b_writedate;
	private String b_updatedate;
	private String m_userid;
	private int b_used;
	private int b_readcount;
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writedate() {
		return b_writedate;
	}
	public void setB_writedate(String b_writedate) {
		this.b_writedate = b_writedate;
	}
	public String getB_updatedate() {
		return b_updatedate;
	}
	public void setB_updatedate(String b_updatedate) {
		this.b_updatedate = b_updatedate;
	}
	public String getM_userid() {
		return m_userid;
	}
	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}
	public int getB_used() {
		return b_used;
	}
	public void setB_used(int b_used) {
		this.b_used = b_used;
	}
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
}
