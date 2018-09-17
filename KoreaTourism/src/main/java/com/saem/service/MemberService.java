package com.saem.service;

import java.util.List;

import com.saem.domain.MemberVO;

public interface MemberService {
	public List<MemberVO> selectAll() throws Exception;
	public void naver_join(MemberVO mvo) throws Exception;
	public MemberVO select_User(MemberVO mvo) throws Exception;
	
}
