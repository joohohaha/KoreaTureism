package com.saem.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.saem.domain.MemberVO;
import com.saem.service.MemberService;
import com.saem.util.NaverCallback;
import com.saem.util.NaverProfileJoin;
import com.saem.util.SHA256;

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
	
	@RequestMapping(value = "/user_login", method = RequestMethod.POST)
	public @ResponseBody String user_login(HttpSession session,@RequestBody String data) throws Exception{
		String result ="fail";
		System.out.println("login_page_start");
		System.out.println("data :" + data);
		Gson gson = new Gson();
		MemberVO vo = new MemberVO();
		
		if(data!=null) {
		vo = gson.fromJson(data,MemberVO.class);
		}
		System.out.println("vo.getM_userid() : "+vo.getM_userid() );
		if(vo.getM_userid()!=null&& vo.getM_password()!=null) {
			 MemberVO mvo = mService.user_login(vo);
			if(mvo != null) {
				System.out.println("login 성공!"+mvo.getM_userid());
				session.setAttribute("SessionUser", mvo.getM_userid());
				result = "success";
			} else {
				System.out.println("데이터없음");
			}
		
		}
		System.out.println("login_page_end : " + result);
		return result;
	}
	
	
	@RequestMapping(value = "/naver_login", method = RequestMethod.GET)
	public String naver_login(Model model, @RequestParam("code") String code, @RequestParam("state") String state) throws Exception{
		MemberVO member; 
		final String access_token = new NaverCallback().CallBack(code, state);
		if(access_token != null) {
	    	member = new NaverProfileJoin().NaverSign_in(access_token);
			if(mService.select_User(member).getM_count() == 0) {
				System.out.println("join_naver ID : " + member.getM_userid()); //네아로 자동 가입 수정
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
	
	@RequestMapping(value = "/member/user_join", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String user_join(@RequestBody String data) throws Exception {
		System.out.println(data);
		Gson gson = new Gson();
		MemberVO mvo = gson.fromJson(data, MemberVO.class);
		
		mvo.setM_password(mvo.getM_password());
		
		String mSalt = "salt";
		String encryptPw = SHA256.getEncrypt(mvo.getM_password(), mSalt);
		
		mvo.setM_password(encryptPw);
		mvo.setM_salt(mSalt);
		
		mService.default_join(mvo);
		
		return "success";
	}
	
}
