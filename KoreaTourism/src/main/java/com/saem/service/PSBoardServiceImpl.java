package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.saem.domain.PSBoardVO;
import com.saem.persistence.PSBoardDAO;

@Service
public class PSBoardServiceImpl implements PSBoardService {

	@Inject
	private PSBoardDAO dao;

	@Override
	public List<PSBoardVO> select_list(int pageNum) throws Exception {

		return dao.select_list(pageNum);
	}

	@Override
	public PSBoardVO view(int b_num) throws Exception {
		dao.uphit(b_num);
		return dao.select(b_num);
	}
	
	@Override
	public PSBoardVO select(int b_num) throws Exception {

		return dao.select(b_num);
	}

	@Override
	public void insert(PSBoardVO sboard) throws Exception {
		dao.insert(sboard);

	}

	@Override
	public void delete(int b_num) throws Exception {
		dao.delete(b_num);

	}

	@Override
	public void update(PSBoardVO sboard) throws Exception {
		dao.update(sboard);

	}

}
