package com.hotel.app;

public class Bookinfo {
	private int bookcode;
	private int roomcode;
	private String roomname;
	private int person;
	private String checkin;
	private String checkout;
	private String name;
	private String mobile;
	private String typename;
	private int type;
	private int howmany;
	private int howmuch;
	
	public Bookinfo() {}

	public Bookinfo(int bookcode, int roomcode, String roomname, int person, String checkin, String checkout,
			String name, String mobile, String typename, int type, int howmany, int howmuch) {
		this.bookcode = bookcode;
		this.roomcode = roomcode;
		this.roomname = roomname;
		this.person = person;
		this.checkin = checkin;
		this.checkout = checkout;
		this.name = name;
		this.mobile = mobile;
		this.typename = typename;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}

	public int getBookcode() {
		return bookcode;
	}

	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
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

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
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
