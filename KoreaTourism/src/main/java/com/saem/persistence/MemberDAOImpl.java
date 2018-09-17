package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="com.saem.domain.member";
	
	@Override
	public List<MemberVO> selectAll() throws Exception {
		return session.selectList(namespace+".selectAll");
	}
	
	@Override
	public MemberVO select_User(MemberVO mvo) throws Exception {
		return session.selectOne(namespace+".select_user", mvo);
	}
	
	@Override
	public void naver_join(MemberVO mvo) throws Exception {
		session.insert(namespace+".naver_join", mvo);
	}
	
}
