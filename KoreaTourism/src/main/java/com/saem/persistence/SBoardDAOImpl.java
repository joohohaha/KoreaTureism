package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.SBoardVO;


@Repository
public class SBoardDAOImpl implements SBoardDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.saem.domain.sboard";

   @Override
   public List<SBoardVO> select_list(int pageNum) throws Exception {
      return session.selectList(namespace + ".select_list", pageNum);

   }

   @Override
   public SBoardVO select(int bid) throws Exception {
      return session.selectOne(namespace + ".select", bid);

   }

   @Override
   public void insert(SBoardVO sboard) throws Exception {
      session.insert(namespace + ".insert", sboard);

   }

   @Override
   public void delete(int bid) throws Exception {
      session.delete(namespace + ".delete", bid);
      
   }

   @Override
   public void update(SBoardVO sboard) throws Exception {
      session.update(namespace + ".update", sboard);
   }
   
   @Override
   public void uphit(int bid) throws Exception {
      session.update(namespace + ".uphit", bid);
   }

}