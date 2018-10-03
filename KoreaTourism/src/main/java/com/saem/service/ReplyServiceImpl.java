package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.saem.domain.ReplyVO;
import com.saem.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;

	@Override
	public List<ReplyVO> select_list(String tour_name) throws Exception {
		return dao.select_list(tour_name);
	}
	
	@Override
	public void insert_reply(ReplyVO rvo) throws Exception {
		dao.insert_reply(rvo);
	}
	
	@Override
	public ReplyVO select_max(String tour_name) throws Exception {
		return dao.select_max(tour_name);
	}
}
