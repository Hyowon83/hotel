package com.hotel.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "choose";
	}
	
	@RequestMapping("/tologin")
	public String doLogin() {
		return "login";
	}
	
	@RequestMapping(value = "/checknewbie", method = RequestMethod.POST)
	public String checkNewbie(HttpServletRequest hsr, Model model) {
		String uname = hsr.getParameter("username");
		String uid = hsr.getParameter("userid");
		model.addAttribute("name", uname);
		model.addAttribute("id", uid);
		return "checknewbie";
	}
	
	@RequestMapping("/login")
	public String doInfo(HttpServletRequest hsr, Model model) {
		String strPath = hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "booking";
		} else if(strPath.equals("choose")) {
			return "choose";
		} else {
			return "choose";
		}
//		String uid = hsr.getParameter("userid");
//		String addr = hsr.getParameter("address");
//		model.addAttribute("loginid", uid);
//		model.addAttribute("region", addr);
	}
	
	@RequestMapping(value="/check_user")
	public String check_user(HttpServletRequest hsr, Model model) {
	      String userid=hsr.getParameter("userid");
	      String userpw=hsr.getParameter("userpw");
	      System.out.println("userid:"+userid+"userpw="+userpw);
	       HttpSession session=hsr.getSession();
	       session.setAttribute("loginid", userid);
	       return "redirect:/booking";
	}
   
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
	      return "booking";
	}
	
	@RequestMapping("/room")
	public String room() {
		return "room";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
	      HttpSession session=hsr.getSession();
	      session.invalidate();
	      return "choose";
	   }
	
	@RequestMapping("/selected")
	public String doJob(HttpServletRequest hsr, Model model) {
		String strPath = hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "login";
		} else if(strPath.equals("newbie")) {
			return "newbie";
		} else {
			return "choose";
		}
	}
	
	@RequestMapping("/newbie")
	public String newbie(HttpServletRequest hsr, Model model) {
		String strPath = hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "checknewbie";
		} else if(strPath.equals("choose")) {
			return "choose";
		} else {
			return "choose";
		}
	}
	
	@RequestMapping("/check")
	public String check(HttpServletRequest hsr, Model model) {
		String strPath = hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "login";
		} else if(strPath.equals("choose")) {
			return "newbie";
		} else {
			return "choose";
		}
	}
}
