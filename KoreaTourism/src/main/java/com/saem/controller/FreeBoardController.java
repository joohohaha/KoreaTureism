package com.saem.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.saem.domain.FreeBoardVO;
import com.saem.service.FreeBoardService;


@Controller
public class FreeBoardController {

	@Inject
	private FreeBoardService service;

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);

	// select_list
	@RequestMapping(value = "/fboard", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value="pageNum", required=false, defaultValue="0") int pageNum) throws Exception {
		
		boolean prev = true, next = true;
		
		if(pageNum == 0) {
			prev = false;
		}
		if (service.select_list(pageNum+7).size() == 0) {
			next = false;
		}
		
		model.addAttribute("list", service.select_list(pageNum));
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("pageNum", pageNum);
		return "free_board/f_board";
	}

	// view
	@RequestMapping(value = "/f_view", method = RequestMethod.GET)
	public String view(Model model, @RequestParam("f_id") int f_id) throws Exception {
		model.addAttribute("fboard", service.view(f_id));
		return "free_board/f_view";
	}

	// delete
	@RequestMapping(value = "/f_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("f_id") int f_id) throws Exception {
		service.delete(f_id);
		return "redirect:fboard";
	}

	// select
	@RequestMapping(value = "/f_updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam("f_id") int f_id) throws Exception {
		model.addAttribute("fboard", service.select(f_id));
		return "free_board/f_updateForm";
	}

	// update
	@RequestMapping(value = "/f_update", method = RequestMethod.GET)
	public String update(FreeBoardVO fboard) throws Exception {
		service.update(fboard);
		
		return "redirect:fboard";
	}

	// insert
	@RequestMapping(value = "/f_insert", method = RequestMethod.GET)
	public String insert(FreeBoardVO fboard) throws Exception {
		service.insert(fboard);
		return "redirect:fboard";
	}

}
