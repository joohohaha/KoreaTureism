package com.saem.service;

import java.util.List;

import com.saem.domain.SBoardVO;



public interface SBoardService {
	public List<SBoardVO> select_list(int pageNum) throws Exception;

	public SBoardVO view(int bid) throws Exception;

	public void insert(SBoardVO sboard) throws Exception;

	public void delete(int bid) throws Exception;
	
	public SBoardVO select(int bid) throws Exception;

	public void update(SBoardVO sboard) throws Exception;
	
}
