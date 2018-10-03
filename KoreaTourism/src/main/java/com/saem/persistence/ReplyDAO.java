package com.saem.persistence;

import java.util.List;

import com.saem.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> select_list(String tour_name) throws Exception;
	public ReplyVO select_max(String tour_name) throws Exception;
	public void insert_reply(ReplyVO rvo) throws Exception;
}
