package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.saem.domain.SBoardVO;
import com.saem.persistence.SBoardDAO;


@Service
public class SBoardServiceImpl implements SBoardService {

	@Inject
	private SBoardDAO dao;

	@Override
	public List<SBoardVO> select_list(int pageNum) throws Exception {

		return dao.select_list(pageNum);
	}

	@Override
	public SBoardVO view(int bid) throws Exception {
		dao.uphit(bid);
		return dao.select(bid);
	}
	
	@Override
	public SBoardVO select(int bid) throws Exception {

		return dao.select(bid);
	}

	@Override
	public void insert(SBoardVO sboard) throws Exception {
		dao.insert(sboard);

	}

	@Override
	public void delete(int bid) throws Exception {
		dao.delete(bid);

	}

	@Override
	public void update(SBoardVO sboard) throws Exception {
		dao.update(sboard);

	}

}
