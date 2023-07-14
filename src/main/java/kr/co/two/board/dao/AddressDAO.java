package kr.co.two.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.board.dto.AddressDTO;
import kr.co.two.board.dto.AddressDTO2;

@Mapper
public interface AddressDAO {

	int adTotalCount(String opt, String keyword,String bookmark);

	ArrayList<AddressDTO2> adList(HashMap<String, Object> map2);

	int bookmark(String id, String member_id);

	ArrayList<String> bmList(String member_id);

	int bookmarkDel(String id, String member_id);

}
