package com.buddi.vo;

import java.util.Objects;

public class BuddiMonVO {

	private int dNum;
	private String pName;
	private String pGrade;
	public static int toMon;
	public String rgb;
	public int type_num;
	public String type_name;
	public int subType_num;
	public String subType_name;
	public String subRgb;
	public int gachaNum;
	public int po_ea;
	public int totalCnt;



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
		return String.format("%d %s %s %s %d %s %d %s %s %d %d", dNum, pName, pGrade, rgb, type_name, subType_num ,subType_name, subRgb, po_ea, totalCnt );
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

	
	
	public int getSubType_num() {
		return subType_num;
	}

	public void setSubType_num(int subType_num) {
		this.subType_num = subType_num;
	}

	public String getSubType_name() {
		return subType_name;
	}

	public void setSubType_name(String subType_name) {
		this.subType_name = subType_name;
	}

	public String getSubRgb() {
		return subRgb;
	}

	public void setSubRgb(String subRgb) {
		this.subRgb = subRgb;
	}

	public int getGachaNum() {
		return gachaNum;
	}

	public void setGachaNum(int gachaNum) {
		this.gachaNum = gachaNum;
	}

	public int getPo_ea() {
		return po_ea;
	}

	public void setPo_ea(int po_ea) {
		this.po_ea = po_ea;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	
	
	
	
	
}