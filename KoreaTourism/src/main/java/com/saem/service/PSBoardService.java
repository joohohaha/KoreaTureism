package com.saem.service;

import java.util.List;

import com.saem.domain.PSBoardVO;

public interface PSBoardService {
	public List<PSBoardVO> select_list(int pageNum) throws Exception;

	public PSBoardVO view(int b_num) throws Exception;

	public void insert(PSBoardVO sboard) throws Exception;

	public void delete(int b_num) throws Exception;
	
	public PSBoardVO select(int b_num) throws Exception;

	public void update(PSBoardVO sboard) throws Exception;
	
}
