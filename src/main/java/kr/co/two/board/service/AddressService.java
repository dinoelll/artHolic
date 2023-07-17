package kr.co.two.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.board.dao.AddressDAO;
import kr.co.two.board.dto.AddressDTO;
import kr.co.two.board.dto.AddressDTO2;
import kr.co.two.reservation.dto.ReservationDTO;

@Service
public class AddressService {
	
	@Autowired AddressDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	

	public HashMap<String, Object> adList(int page, int cnt, String opt, String keyword, String bookmark,String member_id) {
	HashMap<String, Object>map = new HashMap<String,Object>();
	int offset = (page - 1) * cnt;

	int total = dao.adTotalCount(opt, keyword,bookmark); // 12
	// cnt = 10
	int range = total % cnt == 0 ? total / cnt : (total / cnt) + 1;

	logger.info("total :" + total);
	logger.info("range :" + range);
	logger.info("before page :" + page);

	page = page > range ? range : page;

	logger.info("after page :" + page);

	map.put("currPage", page);
	map.put("pages", range);
	HashMap<String, Object> map2 = new HashMap<String, Object>();
	map2.put("opt", opt);
	map2.put("keyword", keyword);
	map2.put("cnt", cnt);
	map2.put("offset", offset);
	map2.put("bookmark",bookmark);
	
	ArrayList<AddressDTO2> adList = dao.adList(map2);
	map.put("list", adList);
	
	/*----------------------------------------즐겨찾기 리스트 가져오기------------------------------------------------*/
	
	logger.info(member_id);
	ArrayList<String>bmList = new ArrayList<String>();
	bmList = dao.bmList(member_id);
	logger.info("bmList:"+bmList);
	map.put("bmList", bmList);

	
	return map;
}




	public int bookmark(String id,String member_id) {
		// TODO Auto-generated method stub
		return dao.bookmark(id,member_id);
	}




	public int bookmarkDel(String id, String member_id) {
		// TODO Auto-generated method stub
		return  dao.bookmarkDel(id,member_id);
	}

}
