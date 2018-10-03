package com.saem.service;

import java.util.List;

import com.saem.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> select_list(String tour_name) throws Exception;
	public ReplyVO select_max(String tour_name) throws Exception;
	public void insert_reply(ReplyVO rvo) throws Exception;
}
