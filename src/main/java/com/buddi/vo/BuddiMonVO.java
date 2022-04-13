package com.buddi.vo;

import java.util.Objects;

public class BuddiMonVO {

	private int dNum;
	private int pNum;
	private String pName;
	private String pGrade;
	private String pType;
	public static int toMon;


	@Override
	public int hashCode() {
		return Objects.hash(this.dNum);
	}

	@Override
	public boolean equals(Object obj) {
		BuddiMonVO mon = (BuddiMonVO) obj;
		return this.dNum == mon.getdNum();
	}

	@Override
	public String toString() {
		return String.format("%d %s %s %s", dNum, pNum, pName, pGrade, pType);
	}

	public int getdNum() {
		return dNum;
	}

	public void setdNum(int dNum) {
		this.dNum = dNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpGrade() {
		return pGrade;
	}

	public void setpGrade(String pGrade) {
		this.pGrade = pGrade;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	
	
}