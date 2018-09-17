package com.saem.persistence;

import java.util.List;

import com.saem.domain.MemberVO;

public interface MemberDAO {
	public List<MemberVO> selectAll() throws Exception;
	public void naver_join(MemberVO mvo) throws Exception;
	public MemberVO select_User(MemberVO mvo) throws Exception;
	
}
