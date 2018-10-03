package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.PSBoardVO;
import com.saem.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
   	private SqlSession session;

   	private static final String namespace = "com.saem.domain.reply";

   	@Override
	public List<ReplyVO> select_list(String tour_name) throws Exception {
		return session.selectList(namespace+".select_list", tour_name);
	}
   
   	@Override
	public void insert_reply(ReplyVO rvo) throws Exception {
		session.insert(namespace+".insert_reply", rvo);
	}
   	
   	@Override
   	public ReplyVO select_max(String tour_name) throws Exception {
   		return session.selectOne(namespace+".select_max", tour_name);
   	}
}