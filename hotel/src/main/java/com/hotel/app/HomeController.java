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
	
	@RequestMapping(value="/check_user", method = RequestMethod.POST)
	public String check_user(HttpServletRequest hsr, Model model) {
		String userid=hsr.getParameter("userid");
		String userpw=hsr.getParameter("userpw");
		
		HttpSession session=hsr.getSession();
		session.setAttribute("loginid", userid);
		
		return "redirect:/booking";
		
	}
	
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid") == null) {
			return "redirect:/";
		} else {
			return "booking";			
		}
	}
	
	@RequestMapping("/login")
	   public String doInfo(HttpServletRequest hsr, Model model) {
	      String strPath = hsr.getParameter("path");
	      if(strPath.equals("login")) {
	         return "booking";
	      } else if(strPath.equals("newbie")) {
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
		ArrayList<Roominfo> roominfo = room.getRoomList();
		System.out.println(roominfo);
		model.addAttribute("list", roominfo);
		return "room";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
}
