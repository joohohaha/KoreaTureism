package com.saem.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.saem.domain.PSBoardVO;
import com.saem.service.PSBoardService;

@Controller
public class PSBoardController {

	@Inject
	private PSBoardService service;

	private static final Logger logger = LoggerFactory.getLogger(PSBoardController.class);
	
	// select_list
	@RequestMapping(value = "/ps_board", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value="pageNum",required=false,defaultValue="0") int pageNum) throws Exception {

		boolean prev = true, next = true;

		if (pageNum == 0) {
			prev = false;
		}
		
		if (service.select_list(pageNum + 7).size() == 0) {
			next = false;
		}

		model.addAttribute("list", service.select_list(pageNum));
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("pageNum", pageNum);
		return "ps_board/ps_board";
	}

	// view
	@RequestMapping(value = "/ps_view", method = RequestMethod.GET)
	public String view(Model model, @RequestParam(value="b_num") int b_num) throws Exception {
		model.addAttribute("sboard", service.view(b_num));
		return "ps_board/ps_view";
	}

	// delete
	@RequestMapping(value = "/ps_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("b_num") int b_num) throws Exception {
		
		service.delete(b_num);
		return "redirect:ps_board";
	}

	// select
	@RequestMapping(value = "/ps_updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam("b_num") int b_num) throws Exception {
		model.addAttribute("sboard", service.select(b_num));
		
		return "ps_board/ps_updateForm";
	}

	// update
	@RequestMapping(value = "/ps_update", method = RequestMethod.GET)
	public String update(PSBoardVO sboard) throws Exception {
		service.update(sboard);
		
		return "redirect:ps_board";
	}

	// insertForm
	@RequestMapping(value = "/ps_writeForm", method = RequestMethod.GET)
	public String insertForm(PSBoardVO sboard) throws Exception {
		return "ps_board/ps_writeForm";
	}

	// insert
	@RequestMapping(value = "/ps_insert", method = RequestMethod.GET)
	public String insert(PSBoardVO sboard) throws Exception {
		
		service.insert(sboard);
		return "redirect:ps_board";
	}

}
