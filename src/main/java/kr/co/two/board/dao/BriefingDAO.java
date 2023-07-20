package kr.co.two.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.two.board.dto.BriefingDTO;
import kr.co.two.board.dto.InformDTO;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface BriefingDAO {

	int totalCount(String opt, String keyword);

	
	ArrayList<BriefingDTO> list(String opt, String keyword, int cnt, int offset);

	BriefingDTO detail(String board_id, String member_id);


	int write(BriefingDTO dto);


	int delete(String idx);


	int briefingUpdateDo(HashMap<String, Object> params);


	BriefingDTO briefingUpdate(String board_id);


	int adminChk(String member_id);

}