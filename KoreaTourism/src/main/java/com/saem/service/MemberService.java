package com.saem.service;

import java.util.List;

import com.saem.domain.MemberVO;

public interface MemberService {
	public List<MemberVO> selectAll() throws Exception;
	public void naver_join(MemberVO mvo) throws Exception;
	public void default_join(MemberVO mvo) throws Exception;
	public MemberVO select_User(MemberVO mvo) throws Exception;
	public MemberVO select_UserId(MemberVO mvo) throws Exception;
	public MemberVO select_UserInfo(MemberVO mvo) throws Exception;
	public MemberVO find_UserPass(MemberVO mvo) throws Exception;
	public MemberVO user_login(MemberVO mvo) throws Exception;
	public MemberVO user_logout(MemberVO mvo) throws Exception;
	public void update_info(MemberVO mvo) throws Exception;
	public void update_withdrawal(MemberVO mvo) throws Exception;
	public void update_password(MemberVO mvo) throws Exception;
}
