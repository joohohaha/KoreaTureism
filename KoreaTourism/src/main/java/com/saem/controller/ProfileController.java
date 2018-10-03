package com.saem.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.saem.domain.MemberVO;
import com.saem.service.MemberService;
import com.saem.util.NaverCallback;
import com.saem.util.NaverProfileJoin;

@Controller
@SessionAttributes({"SessionNaver","SessionUser"})
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);

	@Inject
	private MemberService mService;
	
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
	
	@RequestMapping(value = "/user_login", method = RequestMethod.GET)
	public String user_login(Model model, MemberVO mvo) throws Exception{
		return "redirect:index";
	}
	
	@RequestMapping(value = "/naver_login", method = RequestMethod.GET)
	public String naver_login(Model model, @RequestParam("code") String code, @RequestParam("state") String state) throws Exception{
		final MemberVO member; 
		final String access_token = new NaverCallback().CallBack(code, state);
		if(access_token != null) {
	    	member = new NaverProfileJoin().NaverSign_in(access_token);
			if(member != null) {
				mService.naver_join(member);
			}
			model.addAttribute("SessionNaver", member.getM_userid());
		}
		return "redirect:index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus session) throws Exception{
		session.setComplete();
		return "redirect:index";
	}
	
	@RequestMapping(value = "/user_join", method = RequestMethod.GET)
	public String user_join(Model model, MemberVO mvo) throws Exception{
		return "redirect:index";
	}
	
}
