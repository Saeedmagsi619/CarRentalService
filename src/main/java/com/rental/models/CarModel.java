package com.rental.models;

public class CarModel {
	
	private long   carId;
	private String carName;
	private String carCompany;
	private String carModel;
	private int    year;
	private double price;
	private long appUserid;
	
	public long getCarId() {
		return carId;
	}
	public void setCarId(long carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarCompany() {
		return carCompany;
	}
	public void setCarCompany(String carCompany) {
		this.carCompany = carCompany;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public long getAppUserid() {
		return appUserid;
	}
	public void setAppUserid(long appUserid) {
		this.appUserid = appUserid;
	}
	
}
