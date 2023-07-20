package kr.co.two.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.board.dto.InformDTO;

@Mapper
public interface InformDAO {

	int informWriteDo(InformDTO dto);

	//ArrayList<InformDTO> informList();

	InformDTO informDetail(String board_id, String member_id);

	int informUpdateDo(HashMap<String, Object> params);

	InformDTO informUpdate(String board_id);

	int delete(String board_id);

	ArrayList<InformDTO> listCall(String opt, String keyword, int cnt, int offset);

	int totalCount(String opt, String keyword);

	void is_formDel(String id);

	int adminChk(String member_id);
	
	


}
