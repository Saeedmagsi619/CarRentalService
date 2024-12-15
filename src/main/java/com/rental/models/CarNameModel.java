package com.rental.models;

import java.io.Serializable;

public class CarNameModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private long   carNameId;
	private String carName;
	private String companyName;
	
	public long getCarNameId() {
		return carNameId;
	}
	public void setCarNameId(long carNameId) {
		this.carNameId = carNameId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	
	

}
