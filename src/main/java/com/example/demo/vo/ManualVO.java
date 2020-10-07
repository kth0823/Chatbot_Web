package com.example.demo.vo;

import java.time.LocalDateTime;

public class ManualVO {
	private int Mno;
	private String Mfw;
	private String Mcomment;
	private LocalDateTime Mregdate;
	public int getMno() {
		return Mno;
	}
	public void setMno(int mno) {
		Mno = mno;
	}
	public String getMfw() {
		return Mfw;
	}
	public void setMfw(String mfw) {
		Mfw = mfw;
	}
	public String getMcomment() {
		return Mcomment;
	}
	public void setMcomment(String mcomment) {
		Mcomment = mcomment;
	}
	public LocalDateTime getMregdate() {
		return Mregdate;
	}
	public void setMregdate(LocalDateTime mregdate) {
		Mregdate = mregdate;
	}
	
}
