package com.saem.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.saem.service.TourService;

@Controller
public class TourController {
	
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	int[] a;
	@Inject
	private TourService tService;
	
	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String home(Model model) throws Exception{

		model.addAttribute("selectAll", tService.selectAll());
		model.addAttribute("mainlist", tService.selectMain());
		model.addAttribute("gyeongsang", tService.selectBusan());
		model.addAttribute("gyeonggi", tService.selectSeg("%경기%"));
		model.addAttribute("gangwon", tService.selectSeg("%강원%"));
		model.addAttribute("chungcheong", tService.selectSeg("%충청%"));
		model.addAttribute("jeju", tService.selectSeg("%제주%"));
		model.addAttribute("jeonla", tService.selectSeg("%전라%"));
		model.addAttribute("seoul", tService.selectSeg("%서울%"));
		
		return "main";
	}
	
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
