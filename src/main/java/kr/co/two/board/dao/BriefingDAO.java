package kr.co.two.board.dao;

import java.util.ArrayList;
import kr.co.two.board.dto.BriefingDTO;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface BriefingDAO {

	

	int totalCount(String opt, String keyword);

	
	ArrayList<BriefingDTO> list(String opt, String keyword, int cnt, int offset);


	void bHit(String idx);


	BriefingDTO detail(String idx);


	int write(BriefingDTO dto);


	int delete(String idx);

}