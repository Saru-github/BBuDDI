package com.buddi.vo;

import java.util.Objects;

import org.springframework.stereotype.Component;

@Component
public class BuddiUserVO {

	private String uid;
	private String pwd;
	private int uNum;
	private String uGrade;
	private int mBall;
	private int gym;

	@Override
	public int hashCode() {
		return Objects.hash(this.uid);
	}

	@Override
	public boolean equals(Object obj) {
		BuddiUserVO bbu = (BuddiUserVO) obj;
		return this.uid.equals(bbu.getUid());
	}

	@Override
	public String toString() {
		return String.format("%s %s %d %s %d %d",  uid, pwd, uNum, uGrade, mBall, gym);
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getuNum() {
		return uNum;
	}

	public void setuNum(int uNum) {
		this.uNum = uNum;
	}

	public String getuGrade() {
		return uGrade;
	}

	public void setuGrade(String uGrade) {
		this.uGrade = uGrade;
	}

	public int getmBall() {
		return mBall;
	}

	public void setmBall(int mBall) {
		this.mBall = mBall;
	}

	public int getGym() {
		return gym;
	}

	public void setGym(int gym) {
		this.gym = gym;
	}
	
	

}
