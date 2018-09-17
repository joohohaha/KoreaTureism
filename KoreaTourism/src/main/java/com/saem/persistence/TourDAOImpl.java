package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.TourVO;

@Repository
public class TourDAOImpl implements TourDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="com.saem.domain.tour";
	
	@Override
	public List<TourVO> selectAll() throws Exception {
		return session.selectList(namespace+".selectAll");
	}
	
	@Override
	public List<TourVO> selectMain() throws Exception {
		return session.selectList(namespace+".selectMain");
	}

	@Override
	public List<TourVO> selectBusan() throws Exception {
		return session.selectList(namespace+".selectBusan");
	}

	@Override
	public List<TourVO> selectSeg(String seg_name) throws Exception {
		return session.selectList(namespace+".selectSeg", seg_name);
	}
	
}
