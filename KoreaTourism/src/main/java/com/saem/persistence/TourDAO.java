package com.saem.persistence;

import java.util.List;

import com.saem.domain.TourVO;

public interface TourDAO {
	public List<TourVO> selectAll() throws Exception;
	public List<TourVO> selectMain() throws Exception;
	public List<TourVO> selectSeg(String seg_name) throws Exception;
	public TourVO selectOneSeg(String tour_name) throws Exception;
}
