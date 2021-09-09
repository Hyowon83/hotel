package com.hotel.app;

import java.util.ArrayList;

public interface iBooking {
	ArrayList<Bookinfo> getBookList(String checkin, String checkout);
	ArrayList<Bookinfo> bookedRoomList(String checkin, String checkout);
	void doDeleteBook(int bookcode);
	void doAddBook(int roomcode, int person, String checkin, String checkout, String name, String mobile);
	void doUpdateBook(int bookcode, int person, String name, String mobile);
}
