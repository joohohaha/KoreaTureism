package com.saem.controller;

import java.util.List;

import javax.inject.Inject;

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
import com.saem.domain.ReplyVO;
import com.saem.domain.TourVO;
import com.saem.service.MemberService;
import com.saem.service.ReplyService;
import com.saem.service.TourService;
import com.saem.util.NaverCallback;
import com.saem.util.NaverProfileJoin;

@Controller
@SessionAttributes({"SessionNaver","SessionUser"})
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private TourService tService;
	@Inject
	private MemberService mService;
	@Inject
	private ReplyService rService;
	
	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String index(Model model) throws Exception{
		return "index";
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Model model) throws Exception{

		model.addAttribute("selectAll", tService.selectAll());
		model.addAttribute("mainlist", tService.selectMain());
		
		return "main";
	}
	
	@RequestMapping(value = "/user_login", method = RequestMethod.GET)
	public String user_login(Model model, MemberVO mvo) throws Exception{
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "/localPage", method = RequestMethod.GET)
	public String localPage(Model model, MemberVO mvo) throws Exception{
		
		return "localPage";
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
	
	@RequestMapping(value = "/tour_reply", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String tour_reply(Model model, @RequestBody String data) throws Exception{
		return new Gson().toJson(rService.select_list(data)).toString();
	}
	
	@RequestMapping(value = "/send_reply", method = RequestMethod.POST)
	public @ResponseBody String send_reply(Model model, @RequestBody String data) throws Exception{
		
		Gson gson = new Gson();
		ReplyVO reply = gson.fromJson(data, ReplyVO.class);
		
		int max_num = rService.select_max(reply.getTour_name()).getR_num()+1;
		reply.setR_num(max_num);
		
		rService.insert_reply(reply);
		
		return gson.toJson(reply);
	}
	
	@RequestMapping(value="/AjaxData", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String AjaxData(Model model, @RequestBody String data) throws Exception{
		
		System.out.println(data);
		List<TourVO> seg_data = null;
		
		if(data.equals("gyeongsang")) {
			seg_data = tService.selectSeg("%경상%");
		}else if(data.equals("gyeonggi")) {
			seg_data = tService.selectSeg("%경기%");
		}else if(data.equals("seoul")) {
			seg_data = tService.selectSeg("%서울%");
		}else if(data.equals("gangwon")) {
			seg_data = tService.selectSeg("%강원%");
		}else if(data.equals("chungcheong")) {
			seg_data = tService.selectSeg("%충청%");
		}else if(data.equals("jeonla")) {
			seg_data = tService.selectSeg("%전라%");
		}else if(data.equals("jeju")) {
			seg_data = tService.selectSeg("%제주%");
		}
		// Gson instance를 만들어서 쓰면 new를 안해도 될거같은데..
		return new Gson().toJson(seg_data).toString();
	}
	
	@RequestMapping(value="/tour_data", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String tour_data(Model model, @RequestBody String data) throws Exception{
		return new Gson().toJson(tService.selectOneSeg(data)).toString();
	}
	
	
}
