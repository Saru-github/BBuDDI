package com.buddi.vo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class BuddiBoardVO 
{
	private int num;
	private String title;
	private String author;
	private String contents;
	private Timestamp bdate;
	public List<BuddiAttachVO> attach = new ArrayList<>();
	
	public BuddiBoardVO() {}
	
	public BuddiBoardVO(int num) {
		this.setNum(num);
	}
	
	@Override
	public String toString() {
		return String.format("%d %s %s %s %s", num, title, author, contents , bdate);
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
	public Timestamp getBdate() {
		return bdate;
	}
	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	public List<BuddiAttachVO> getAttach() {
		return attach;
	}
}
