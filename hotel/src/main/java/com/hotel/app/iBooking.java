package com.hotel.app;

import java.util.ArrayList;

public interface iBooking {
	ArrayList<Bookinfo> getBookList();
	ArrayList<Bookinfo> bookedRoomList();
	void doDeleteBook(int bookcode);
	void doDeleteBooking1();
	void getAbleBookList(String typename);
	void doAddBook(int roomcode, int person, String checkin, String checkout, String name, String mobile);
	void doUpdateBook(int roomcode, int person, String checkin, String checkout, String name, String mobile);
}
