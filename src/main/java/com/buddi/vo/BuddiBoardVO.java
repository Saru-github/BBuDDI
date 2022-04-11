package com.buddi.vo;

import java.util.ArrayList;
import java.util.List;

public class BuddiBoardVO 
{
	private int num;
	private String title;
	private String author;
	private String contents;
	private java.sql.Date bdate;
	public List<BuddiAttachVO> attach = new ArrayList<>();
	
	public BuddiBoardVO() {}
	
	public BuddiBoardVO(int num) {
		this.setNum(num);
	}
	
	@Override
	public String toString() {
		return num + " " + title + " " + author + " " + contents + " " + attach;
	}

	@Override
	public boolean equals(Object obj) {
		BuddiBoardVO other = (BuddiBoardVO) obj;
		return this.num==other.num;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public java.sql.Date getBdate() {
		return bdate;
	}
	public void setBdate(java.sql.Date bdate) {
		this.bdate = bdate;
	}
	public List<BuddiAttachVO> getAttach() {
		return attach;
	}
}
