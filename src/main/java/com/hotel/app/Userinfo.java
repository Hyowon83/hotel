package com.hotel.app;

public class Userinfo {
	private String name;
	private String loginid;
	private String passcode;
	
	public Userinfo() {}

	public Userinfo(String name, String loginid, String passcode) {
		this.name = name;
		this.loginid = loginid;
		this.passcode = passcode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPasscode() {
		return passcode;
	}

	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	
}
