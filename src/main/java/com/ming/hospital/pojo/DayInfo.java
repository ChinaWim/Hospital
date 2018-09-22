package com.ming.hospital.pojo;

/**
 * 预约医生显示日期实体
 *
 */
public class DayInfo {

	private String date;//日期 (xx月xx日)
	private String week;//具体星期几  (星期x)
	private String fullDate;// 完整日期 (xxxx年xx月xx日)
	private int sw;
	private int xw;
	private int ws;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public int getSw() {
		return sw;
	}

	public void setSw(int sw) {
		this.sw = sw;
	}

	public int getXw() {
		return xw;
	}

	public void setXw(int xw) {
		this.xw = xw;
	}

	public int getWs() {
		return ws;
	}

	public void setWs(int ws) {
		this.ws = ws;
	}

	public String getFullDate() {
		return fullDate;
	}

	public void setFullDate(String fullDate) {
		this.fullDate = fullDate;
	}

	@Override
	public String toString() {
		return "DayInfo{" +
				"date='" + date + '\'' +
				", week='" + week + '\'' +
				", fullDate='" + fullDate + '\'' +
				", sw=" + sw +
				", xw=" + xw +
				", ws=" + ws +
				'}';
	}
}
