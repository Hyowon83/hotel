package com.hotel.app;

public class Userinfo {
	private String username;
	private String userid;
	private String userpw;
	
	public Userinfo() {}
	
	public Userinfo(String username, String userid, String userpw) {
		this.username = username;
		this.userid = userid;
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	
}
