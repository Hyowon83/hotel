package com.hotel.app;

public class Roominfo {
	private int roomcode;
	private String roomname;
	private String typename;
	private int type;
	private int howmany;
	private int howmuch;
	
	public Roominfo() {}

	public Roominfo(int roomcode, String roomname, String typename, int type, int howmany, int howmuch) {
		this.roomcode = roomcode;
		this.roomname = roomname;
		this.typename = typename;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}

	public int getRoomcode() {
		return roomcode;
	}

	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getHowmany() {
		return howmany;
	}

	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}

	public int getHowmuch() {
		return howmuch;
	}

	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}

}
