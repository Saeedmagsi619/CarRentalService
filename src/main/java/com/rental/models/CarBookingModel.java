package com.rental.models;

import java.util.Date;

public class CarBookingModel {
	
	private long      carBookingId;
	private long      appUserId;
	private long      carId;
	private UserModel userModel;
	private Date   startDate;
	private Date   endingDate;
	private Date   bookingDate;
	private String comments;
	private int totalHourseBooked;
	private double totalPrice;
	
	public int getTotalHourseBooked() {
		return totalHourseBooked;
	}
	public void setTotalHourseBooked(int totalHourseBooked) {
		this.totalHourseBooked = totalHourseBooked;
	}
	public long getCarBookingId() {
		return carBookingId;
	}
	public void setCarBookingId(long carBookingId) {
		this.carBookingId = carBookingId;
	}
	public long getAppUserId() {
		return appUserId;
	}
	public void setAppUserId(long appUserId) {
		this.appUserId = appUserId;
	}
	public long getCarId() {
		return carId;
	}
	public void setCarId(long carId) {
		this.carId = carId;
	}
	public UserModel getUserModel() {
		return userModel;
	}
	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndingDate() {
		return endingDate;
	}
	public void setEndingDate(Date endingDate) {
		this.endingDate = endingDate;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
