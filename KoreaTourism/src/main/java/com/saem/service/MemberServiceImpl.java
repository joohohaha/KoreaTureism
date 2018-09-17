package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.saem.domain.MemberVO;
import com.saem.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public List<MemberVO> selectAll() throws Exception {
		return dao.selectAll();
	}
	
	@Override
	public MemberVO select_User(MemberVO mvo) throws Exception {
		System.out.println("select_Service 호출");
		return dao.select_User(mvo);
	}
	
	
	@Override
	public void naver_join(MemberVO mvo) throws Exception {
		dao.naver_join(mvo);
	}
	
}
