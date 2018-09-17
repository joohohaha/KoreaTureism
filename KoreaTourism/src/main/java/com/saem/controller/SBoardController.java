package com.saem.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.saem.domain.SBoardVO;
import com.saem.service.SBoardService;


@Controller
public class SBoardController {

	@Inject
	private SBoardService service;

	private static final Logger logger = LoggerFactory.getLogger(SBoardController.class);

	// select_list
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value="pageNum",required=false,defaultValue="0") int pageNum) throws Exception {
		
		boolean prev = true, next = true;
		if(pageNum == (Integer)null) {
			
		}
		if(pageNum == 0) {
			prev = false;
		} else if (service.select_list(pageNum+5).size() == 0) {
			next = false;
		}
		
		model.addAttribute("list", service.select_list(pageNum));
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("pageNum", pageNum);
		return "free_board/board";
	}

	// view
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model, @RequestParam("bid") int bid) throws Exception {
		model.addAttribute("sboard", service.view(bid));
		return "free_board/view";
	}

	// delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("bid") int bid) throws Exception {
		service.delete(bid);
		return "redirect:board";
	}

	// select
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam("bid") int bid) throws Exception {
		model.addAttribute("sboard", service.select(bid));
		return "free_board/updateForm";
	}

	// update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(SBoardVO sboard) throws Exception {
		service.update(sboard);
		return "redirect:board";
	}

	// insertForm
	@RequestMapping(value = "/insertForm", method = RequestMethod.GET)
	public String insertForm(SBoardVO sboard) throws Exception {

		return "insertForm";
	}

	// insert
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(SBoardVO sboard) throws Exception {
		service.insert(sboard);
		return "redirect:board";
	}

}
