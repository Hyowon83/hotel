package com.hotel.app;

import java.util.ArrayList;

public interface iMember {
	ArrayList<Userinfo> getUserList();
	void doAddUser(String username, String userid, String userpw);
	int doCheckUser(String userid, String passcode);
	int doCheckUserID(String userid);
}
