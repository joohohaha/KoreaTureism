package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.PSBoardVO;

@Repository
public class PSBoardDAOImpl implements PSBoardDAO {

   @Inject
   private SqlSession session;

   private static final String namespace = "com.saem.domain.psboard";

   @Override
   public List<PSBoardVO> select_list(int pageNum) throws Exception {
      return session.selectList(namespace + ".select_list", pageNum);

   }

   @Override
   public PSBoardVO select(int b_num) throws Exception {
      return session.selectOne(namespace + ".select", b_num);

   }

   @Override
   public void insert(PSBoardVO sboard) throws Exception {
      session.insert(namespace + ".insert", sboard);

   }

   @Override
   public void delete(int b_num) throws Exception {
      session.delete(namespace + ".delete", b_num);
      
   }

   @Override
   public void update(PSBoardVO sboard) throws Exception {
      session.update(namespace + ".update", sboard);
   }
   
   @Override
   public void uphit(int b_num) throws Exception {
      session.update(namespace + ".uphit", b_num);
   }

}