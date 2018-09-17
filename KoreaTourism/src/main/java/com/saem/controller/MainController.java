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

import com.saem.domain.MemberVO;
import com.saem.service.TourService;
import com.saem.util.NaverCallback;

@Controller
@SessionAttributes({"SessionNaver","SessionUser"})
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
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
	
	@RequestMapping(value = "user_login", method = RequestMethod.GET)
	public String user_login(Model model, MemberVO mvo) throws Exception{
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "naver_login", method = RequestMethod.GET)
	public String naver_login(Model model, @RequestParam("code") String code, @RequestParam("state") String state) throws Exception{
		final String naver_id; 
		if(new NaverCallback().CallBack(code, state)!= null) {
			naver_id = new NaverCallback().CallBack(code, state);
			System.out.println(naver_id);
			model.addAttribute("SessionNaver",naver_id);
		}
		return "redirect:index";
	}
	
	@RequestMapping(value = "user_join", method = RequestMethod.GET)
	public String user_join(Model model, MemberVO mvo) throws Exception{
		
		return "redirect:index";
	}
}
