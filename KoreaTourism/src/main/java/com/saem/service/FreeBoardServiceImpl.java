package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saem.domain.FreeBoardVO;
import com.saem.persistence.FreeBoardDAO;


@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	private FreeBoardDAO dao;

	@Override
	public List<FreeBoardVO> select_list(int pageNum) throws Exception {
		return dao.select_list(pageNum);
	}
	
	@Transactional
	@Override
	public FreeBoardVO view(int f_id) throws Exception {
		dao.uphit(f_id);
		return dao.select(f_id);
	}
	
	@Override
	public FreeBoardVO select(int bid) throws Exception {
		return dao.select(bid);
	}

	@Override
	public void insert(FreeBoardVO fboard) throws Exception {
		dao.insert(fboard);
	}

	@Override
	public void delete(int bid) throws Exception {
		dao.delete(bid);
	}

	@Override
	public void update(FreeBoardVO fboard) throws Exception {
		dao.update(fboard);
	}

}
