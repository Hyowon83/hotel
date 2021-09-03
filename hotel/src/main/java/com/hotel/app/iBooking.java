package com.hotel.app;

import java.util.ArrayList;

public interface iBooking {
	ArrayList<Bookinfo> getBookList();
	ArrayList<Bookinfo> bookedRoomList();
	void doDeleteBooking1();
	void getAbleBookList(String typename);
}
