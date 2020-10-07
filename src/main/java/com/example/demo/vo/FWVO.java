package com.example.demo.vo;

import java.time.LocalDateTime;

public class FWVO {
	private int Fno;
	private String Fw;
	private String Fcomment;	
	private LocalDateTime Fregdate;		
	public int getFno() {
		return Fno;
	}
	public void setFno(int fno) {
		Fno = fno;
	}
	public String getFw() {
		return Fw;
	}
	public void setFw(String fw) {
		Fw = fw;
	}
	public String getFcomment() {
		return Fcomment;
	}
	public void setFcomment(String fcomment) {
		Fcomment = fcomment;
	}
	public LocalDateTime getFregdate() {
		return Fregdate;
	}
	public void setFregdate(LocalDateTime fregdate) {
		Fregdate = fregdate;
	}
		
}
