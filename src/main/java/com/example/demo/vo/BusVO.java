package com.example.demo.vo;

public class BusVO {
	private int Cno;
	private String Car_regionid;
	private String Car_region;
	private String bus_typeid;
	private String bus_type;
	private String Co_id;
	private String Co_nm;
	private String Car_no;
	public int getCno() {
		return Cno;
	}
	public void setCno(int cno) {
		Cno = cno;
	}
	public String getCo_nm() {
		return Co_nm;
	}
	public void setCo_nm(String co_nm) {
		Co_nm = co_nm;
	}
	
	public String getCo_id() {
		return Co_id;
	}
	public void setCo_id(String co_id) {
		Co_id = co_id;
	}
	public String getCar_no() {
		return Car_no;
	}
	public void setCar_no(String car_no) {
		Car_no = car_no;
	}
	public String getCar_regionid() {
		return Car_regionid;
	}
	public void setCar_regionid(String car_regionid) {
		Car_regionid = car_regionid;
	}
	public String getCar_region() {
		return Car_region;
	}
	public void setCar_region(String car_region) {
		Car_region = car_region;
	}
	public String getBus_typeid() {
		return bus_typeid;
	}
	public void setBus_typeid(String bus_typeid) {
		this.bus_typeid = bus_typeid;
	}
	public String getBus_type() {
		return bus_type;
	}
	public void setBus_type(String bus_type) {
		this.bus_type = bus_type;
	}

}
