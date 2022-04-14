package com.buddi.vo;

import java.util.Objects;

public class BuddiMonVO {

	private int dNum;
	private String pName;
	private String pGrade;
	private String pType;
	public static int toMon;
	public String rgb;
	public int type_num;
	public String type_name;
	public String subType_name;


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
		return String.format("%d %s %s %s", dNum, pName, pGrade, pType);
	}

	public int getdNum() {
		return dNum;
	}

	public void setdNum(int dNum) {
		this.dNum = dNum;
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

	public String getRgb() {
		return rgb;
	}

	public void setRgb(String rgb) {
		this.rgb = rgb;
	}

	public int getType_num() {
		return type_num;
	}

	public void setType_num(int type_num) {
		this.type_num = type_num;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getSubType_name() {
		return subType_name;
	}

	public void setSubType_name(String subType_name) {
		this.subType_name = subType_name;
	}

	

	
	
	
	
}