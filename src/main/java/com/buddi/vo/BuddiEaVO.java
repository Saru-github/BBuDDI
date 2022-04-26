package com.buddi.vo;

public class BuddiEaVO {
	
	private int pType;
	private int ea;
	
	
	@Override
	public String toString() {
		return String.format("%d %d", pType,ea );
	}
	
	public int getpType() {
		return pType;
	}
	public void setpType(int pType) {
		this.pType = pType;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	
	

}
