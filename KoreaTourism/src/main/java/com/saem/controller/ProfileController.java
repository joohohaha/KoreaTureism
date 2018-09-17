package com.saem.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@RequestMapping(value = "/login_info", method = RequestMethod.GET)
	public String login_info(Model model) throws Exception{
		model.addAttribute("login_info", "on");
		return "profile/login_info";
	}
	@RequestMapping(value = "/new_pass", method = RequestMethod.GET)
	public String new_pass(Model model) throws Exception{
		model.addAttribute("new_pass", "on");
		return "profile/new_pass";
	}
	@RequestMapping(value = "/user_info", method = RequestMethod.GET)
	public String user_info(Model model) throws Exception{
		model.addAttribute("user_info", "on");
		return "profile/user_info";
	}
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public String withdrawal(Model model) throws Exception{
		model.addAttribute("withdrawal", "on");
		return "profile/withdrawal";
	}
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public String find_id(Model model) throws Exception{
		model.addAttribute("find_id", "on");
		return "profile/find_id";
	}
	@RequestMapping(value = "/join_ok", method = RequestMethod.GET)
	public String join_ok(Model model) throws Exception{
		return "profile/loginInfo";
	}
	
}
