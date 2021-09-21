package com.hotel.app;

import java.util.ArrayList;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping("/newbie")
	public String getInfo(Locale locale, Model model) {
		return "newbie";
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String doSignin(HttpServletRequest hsr, Model model) {
		//insert into member
		iMember user = sqlSession.getMapper(iMember.class);
		
		String uname = hsr.getParameter("username");
		String uid = hsr.getParameter("userid");
		String userpw = hsr.getParameter("userpw");
		System.out.println("이름"+uname);
		System.out.println("아이디"+uid);
		System.out.println("비번"+userpw);
		
		
		int n = user.doCheckUserId(uid);
		if(n > 0) {
			model.addAttribute("msg","이미 존재하는 아이디입니다.");
            model.addAttribute("url","/newbie");
			System.out.println("X");
			return "redirect";
		} else {
			user.doAddUser(uname, uid, userpw);
			model.addAttribute("msg","회원가입이 완료되었습니다.");
            model.addAttribute("url","/");
			System.out.println("O");
			return "redirect";
		}

	}
	
	@RequestMapping(value="/check_user", method = RequestMethod.POST)
	public String check_user(HttpServletRequest hsr, Model model) {
		String userid=hsr.getParameter("userid");
		String userpw=hsr.getParameter("userpw");
		
		iMember user = sqlSession.getMapper(iMember.class);
		int n = user.doCheckUser(userid, userpw);
		if(n > 0) {
			HttpSession session=hsr.getSession();
			session.setAttribute("loginid", userid);
			model.addAttribute("msg","로그인에 성공하셨습니다.");
            model.addAttribute("url","/booking");
			return "redirect";
		} else {
			model.addAttribute("msg","아이디와 비밀번호를 다시 확인해주세요.");
            model.addAttribute("url","/");
			return "redirect";
		}
	}
	
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public String booking(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid") == null) {
			return "redirect:/";
		}
		//여기서 interface 호출, 결과를 room.jsp에 전달
		iRoom room = sqlSession.getMapper(iRoom.class);
		iBooking book = sqlSession.getMapper(iBooking.class);
		//객실 정보
//		ArrayList<Bookinfo> bookinfo = book.getBookList();
//		System.out.println(bookinfo);
//		model.addAttribute("list", bookinfo);
		//객실 타입
		ArrayList<Roomtype> roomtype = room.getRoomType();
		System.out.println(roomtype);
		model.addAttribute("type", roomtype);
		//예약된 객실정보
//		ArrayList<Bookinfo> booked = book.bookedRoomList();
//		System.out.println(booked);
//		model.addAttribute("book", booked);
		return "booking";			
	}
	
	@RequestMapping("/login")
	   public String doInfo(HttpServletRequest hsr, Model model) {
	      String strPath = hsr.getParameter("path");
	      if(strPath.equals("newbie")) {
	         return "newbie";
	      } else {
	         return "home";
	      }
	   }
	
	@RequestMapping("/room")
	public String room(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid") == null) {
			return "redirect:/";
		}
		//여기서 interface 호출, 결과를 room.jsp에 전달
		iRoom room = sqlSession.getMapper(iRoom.class);
		//객실 정보
//		ArrayList<Roominfo> roominfo = room.getRoomList();
//		System.out.println(roominfo);
//		model.addAttribute("list", roominfo);
		//객실 타입
		ArrayList<Roomtype> roomtype = room.getRoomType();
		System.out.println(roomtype);
		model.addAttribute("type", roomtype);
		return "room";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	//객실관리
	@RequestMapping(value = "/getRoomList", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoomList();
		//찾아온 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		for(int i = 0; i < roominfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("type", roominfo.get(i).getType());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
	@RequestMapping(value = "/deleteRoom", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	@RequestMapping(value = "/addRoom", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname = hsr.getParameter("roomname");
		int rtype = Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room = sqlSession.getMapper(iRoom.class);
//		System.out.println(rname);
//		System.out.println(rtype);
//		System.out.println(howmany);
//		System.out.println(howmuch);
		room.doAddRoom(rname, rtype, howmany, howmuch);
		return "ok";
	}
	@RequestMapping(value = "/updateRoom", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		int rcode = Integer.parseInt(hsr.getParameter("roomcode"));
		String rname = hsr.getParameter("roomname");
		int rtype = Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(rcode, rname, rtype, howmany, howmuch);
		return "ok";
	}
	
	
	//예약된 객실
	@RequestMapping(value = "/bookedRoomList", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getBookedRoomList(HttpServletRequest hsr) {
		iBooking book = sqlSession.getMapper(iBooking.class);
		ArrayList<Bookinfo> bookinfo = new ArrayList<Bookinfo>();
		
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		String typename = hsr.getParameter("typename");
		
		System.out.println(typename);
		
		if(typename.equals("all")) {
			bookinfo = book.bookedRoomList(checkin, checkout);			
		} else {
			bookinfo = book.bookedRoomListType(checkin, checkout, typename);
		}
		
		//찾아온 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		for(int i = 0; i < bookinfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", bookinfo.get(i).getRoomcode());
			jo.put("roomname", bookinfo.get(i).getRoomname());
			jo.put("typename", bookinfo.get(i).getTypename());
			jo.put("howmany", bookinfo.get(i).getHowmany());
			jo.put("checkin", bookinfo.get(i).getCheckin());
			jo.put("checkout", bookinfo.get(i).getCheckout());
			jo.put("howmuch", bookinfo.get(i).getHowmuch());
			jo.put("person", bookinfo.get(i).getPerson());
			jo.put("name", bookinfo.get(i).getName());
			jo.put("mobile", bookinfo.get(i).getMobile());
			jo.put("bookcode", bookinfo.get(i).getBookcode());
			ja.add(jo);
			
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
	
	@RequestMapping(value = "/deleteBook", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String deleteBook(HttpServletRequest hsr) {
		int bookcode = Integer.parseInt(hsr.getParameter("bookcode"));
		iBooking book = sqlSession.getMapper(iBooking.class);
		book.doDeleteBook(bookcode);
		return "ok";
	}
	
	//예약 가능한 객실
	@RequestMapping(value = "/getBookList", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getBookList(HttpServletRequest hsr) {
		iBooking book = sqlSession.getMapper(iBooking.class);
		ArrayList<Bookinfo> bookinfo = new ArrayList<Bookinfo>();
		
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		String typename = hsr.getParameter("typename");
		
		System.out.println(typename);
		
		if(typename.equals("all")) {
			bookinfo = book.getBookList(checkin, checkout);			
		} else {
			bookinfo = book.getBookListType(checkin, checkout, typename);	
		}
		
		//찾아온 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		for(int i = 0; i < bookinfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", bookinfo.get(i).getRoomcode());
			jo.put("roomname", bookinfo.get(i).getRoomname());
			jo.put("typename", bookinfo.get(i).getTypename());
			jo.put("type", bookinfo.get(i).getType());
			jo.put("howmany", bookinfo.get(i).getHowmany());
			jo.put("howmuch", bookinfo.get(i).getHowmuch());
			ja.add(jo);
			
		}
		return ja.toString();
	}
	
	@RequestMapping(value = "/addBook", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String addBook(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		int person = Integer.parseInt(hsr.getParameter("person"));
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		String gname = hsr.getParameter("name");
		String mobile = hsr.getParameter("mobile");
		iBooking book = sqlSession.getMapper(iBooking.class);
		book.doAddBook(roomcode, person, checkin, checkout, gname, mobile);
		return "ok";
	}
	
	@RequestMapping(value = "/updateBook", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String updateBook(HttpServletRequest hsr) {
		int bookcode = Integer.parseInt(hsr.getParameter("bookcode"));
		int person = Integer.parseInt(hsr.getParameter("person"));
		String gname = hsr.getParameter("name");
		String mobile = hsr.getParameter("mobile");
		iBooking book = sqlSession.getMapper(iBooking.class);
		book.doUpdateBook(bookcode, person, gname, mobile);
		return "ok";
	}
}
